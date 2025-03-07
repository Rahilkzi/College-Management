<?php


namespace App\Http\Controllers\Staff;

use App\Http\Controllers\CollegeBaseController;
use App\Http\Requests\Staff\Registration\AddValidation;
use App\Http\Requests\Staff\Registration\EditValidation;
use App\Models\Attendance;
use App\Models\AttendanceStatus;
use App\Models\Attendence;
use App\Models\BookIssue;
use App\Models\Document;
use App\Models\Hostel;
use App\Models\LibraryMember;
use App\Models\Note;
use App\Models\ResidentHistory;
use App\Models\Route;
use App\Models\Staff;
use App\Models\StaffDesignation;
use App\Models\TransactionHead;
use App\Models\TransportHistory;
use App\Traits\UserScope;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Image, URL;
use LaravelQRCode\Facades\QRCode;
use Libern\QRCodeReader\QRCodeReader;
use ViewHelper;

class StaffController extends CollegeBaseController
{
    protected $base_route = 'staff';
    protected $view_path = 'staff';
    protected $panel = 'Staffs';
    protected $folder_path;
    protected $folder_name = 'staff';
    protected $filter_query = [];

    use UserScope;

    public function __construct()
    {
        $this->folder_path = public_path().DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.$this->folder_name.DIRECTORY_SEPARATOR;
    }

    public function index(Request $request)
    {
        $data = [];
        $data['staff'] = Staff::select('id','reg_no', 'first_name',  'middle_name', 'last_name',
             'mobile_1','designation', 'qualification', 'status')
            ->where(function ($query) use ($request) {
                $this->commonStaffFilterCondition($query, $request);
            })
            ->get();

        $data['designation'] = $this->staffDesignationList();

        //for Quick services Creation
        

        $data['url'] = URL::current();
        $data['filter_query'] = $this->filter_query;

        return view(parent::loadDataToView($this->view_path.'.index'), compact('data'));
    }

    public function add()
    {
        $data = [];
        $data['designations'] = $this->staffDesignationList();
        return view(parent::loadDataToView($this->view_path.'.add'), compact('data'));
    }

    public function store(AddValidation $request)
    {
        if ($request->hasFile('main_image')){
            $image_name = parent::uploadImages($request, 'main_image');
        }else{
            $image_name = "";
        }

        $request->request->add(['created_by' => auth()->user()->id]);
        $request->request->add(['staff_image' => $image_name]);

        $staff = Staff::create($request->all());

        if($staff) {
            //Create Customer Ledger
            $request->request->add(['tr_head' => $request->first_name.' '.$request->middle_name.' '.$request->last_name.' ' . ' [' . $staff->reg_no . ']']);
            $request->request->add(['ref_id' => $staff->id]);
            $request->request->add(['acc_id' => $this->staffAccCategory]);
            $trHead = TransactionHead::create($request->all());

            //Manage Opening Balance of Customer
            if ($trHead && $request->amount > 0) {
                if ($request->get('account_type') == "dr_amt") {
                    $drAmount = $request->amount;
                    $crAmount = 0;
                } elseif ($request->get('account_type') == "cr_amt") {
                    $drAmount = 0;
                    $crAmount = $request->amount;
                } else {

                }

                $data = [
                    'date' => Carbon::today(),
                    'tr_head_id' => $trHead->id,
                    'dr_amount' => $drAmount,
                    'cr_amount' => $crAmount,
                    'description' => 'Opening Balance',
                    'created_by' => auth()->user()->id
                ];

                Transaction::create($data);
            }
        }

        $request->session()->flash($this->message_success, $this->panel. ' Created Successfully.');

        if($request->add_staff_another) {
            return back();
        }else{
            return redirect()->route($this->base_route);
        }

    }

    public function view($id)
    {
        $data = [];
        $data['staff'] = Staff::select('id','reg_no', 'join_date', 'first_name',  'middle_name', 'last_name',
            'father_name', 'mother_name', 'date_of_birth', 'gender', 'blood_group', 'nationality','mother_tongue', 'address', 'state', 'country',
            'temp_address', 'temp_state', 'temp_country', 'home_phone', 'mobile_1', 'mobile_2', 'email', 'qualification',
            'experience', 'experience_info', 'other_info','staff_image', 'status')
            ->where('id','=',$id)
            ->first();

        if (!$data['staff']){
            request()->session()->flash($this->message_warning, "Not a Valid Staff");
            return redirect()->route($this->base_route);
        }

        $data['payroll_master'] = $data['staff']->payrollMaster()->orderBy('due_date','desc')->get();
        $data['pay_salary'] = $data['staff']->paySalary()->get();

        /*total Calculation on Table Foot*/
        $data['staff']->amount = $data['staff']->payrollMaster()->sum('amount');
        $data['staff']->allowance = $data['staff']->paySalary()->sum('allowance');
        $data['staff']->fine = $data['staff']->paySalary()->sum('fine');
        $data['staff']->paid_amount = $data['staff']->paySalary()->sum('paid_amount');
        $data['staff']->balance =
            ($data['staff']->amount + $data['staff']->allowance) - ($data['staff']->paid_amount + $data['staff']->fine) ;

       

       
        $data['note'] = Note::select('created_at', 'id', 'member_type','member_id','subject', 'note', 'status')
            ->where('member_type','=','staff')
            ->where('member_id','=', $data['staff']->id)
            ->orderBy('created_at','desc')
            ->get();

        $data['document'] = Document::select('id', 'member_type','member_id', 'title', 'file','description', 'status')
            ->where('member_type','=','staff')
            ->where('member_id','=',$data['staff']->id)
            ->orderBy('created_by','desc')
            ->get();

        //transaction
        $data['transactionHead'] = TransactionHead::where(['acc_id' => $this->staffAccCategory, 'ref_id' => $id])->first();

        if($data['transactionHead']) {
            $transaction = $data['transactionHead']->tR()
                ->orderBy('date')
                ->get();

            $adjustment = [];
            $filteredTransaction  = $transaction->filter(function ($value, $key)use($transaction, $adjustment){
                $balance = $value->dr_amount - $value->cr_amount;

                if($key > 0) {
                    $value->balance = $transaction[$key-1]->balance + $balance;
                }else{
                    $value->balance = $value->dr_amount - $value->cr_amount;
                }
                return $value;
            });

            $data['transaction'] = $filteredTransaction;
        }

        //login credential
        $data['staff_login'] = User::where([['role_id',5],['hook_id',$data['staff']->id]])->first();

        $data['url'] = URL::current();
        return view(parent::loadDataToView($this->view_path.'.detail.index'), compact('data'));
    }

    public function edit(Request $request, $id)
    {
        $data = [];
        if (!$data['row'] = Staff::find($id)) return parent::invalidRequest();

        $data['designations'] = $this->staffDesignationList();

        return view(parent::loadDataToView($this->view_path.'.edit'), compact('data'));
    }

    public function update(EditValidation $request, $id)
    {
        $data = [];
        if (!$row = Staff::find($id))
            return parent::invalidRequest();

        if ($request->hasFile('main_image')){
            $image_name = parent::uploadImages($request, 'main_image');

            // remove old image from folder
            if (file_exists($this->folder_path.$row->staff_image))
                @unlink($this->folder_path.$row->staff_image);
        }

        $request->request->add(['last_updated_by' => auth()->user()->id]);
        $request->request->add(['staff_image' => isset($image_name)?$image_name:$row->staff_image]);

        $row->update($request->all());

        $request->session()->flash($this->message_success, $this->panel. ' Updated Successfully.');
        return redirect()->route($this->base_route);

    }

    public function delete(Request $request, $id)
    {
        $errors = [];

        $row = Staff::find($id);
        if (!$row) {
            return parent::invalidRequest();
        }

        // Check if associated user exists
        if (User::where(['role_id' => 5, 'hook_id' => $id])->exists()) {
            $errors[] = "User Found, Please Delete.";
        }

        // Check if associated documents exist
        if ($row->staffDocuments()->exists()) {
            $errors[] = "Documents Found, Please Delete.";
        }

        // Check if associated notes exist
        if ($row->staffNotes()->exists()) {
            $errors[] = "Notes Found, Please Delete.";
        }

        // Check payroll master and salary pay
        if ($row->payrollMaster()->exists()) {
            if ($row->paySalary()->exists()) {
                $errors[] = "Salary Paid Found, Please Delete.";
            }
            $errors[] = "Salary Master Found, Please Delete.";
        }

        // If there are errors, return them
        if (!empty($errors)) {
            return response()->json(['errors' => $errors], 400);
        }

        // Perform deletion
        $row->delete();

        return back();
    }


    public function active(request $request, $id)
    {
        if (!$row = Staff::find($id)) return parent::invalidRequest();

        $request->request->add(['status' => 'active']);

        $row->update($request->all());

        $request->session()->flash($this->message_success, $row->reg_no.' '.$this->panel.' Active Successfully.');
        return redirect()->route($this->base_route);
    }

    public function inActive(request $request, $id)
    {
        if (!$row = Staff::find($id)) return parent::invalidRequest();

        $request->request->add(['status' => 'in-active']);

        $row->update($request->all());

        $request->session()->flash($this->message_success, $row->reg_no.' '.$this->panel.' In-Active Successfully.');
        return redirect()->route($this->base_route);
    }

    public function bulkAction(Request $request)
    {
        if ($request->has('bulk_action') && in_array($request->get('bulk_action'), ['active', 'in-active', 'delete'])) {

            if ($request->has('chkIds')) {
                foreach ($request->get('chkIds') as $row_id) {
                    switch ($request->get('bulk_action')) {
                        case 'active':
                        case 'in-active':
                            $row = Staff::find($row_id);
                            if ($row) {
                                $row->status = $request->get('bulk_action') == 'active'?'active':'in-active';
                                $row->save();
                            }
                            break;
                        case 'delete':
                            /*
                             * $row = Staff::find($row_id);
                            if (file_exists($this->folder_path.$row->staff_image))
                            @unlink($this->folder_path.$row->staff_image);
                            $row->delete();
                                */
                            $data = $this->delete($request, $row_id);
                            break;
                    }
                }

                if ($request->get('bulk_action') == 'active' || $request->get('bulk_action') == 'in-active')
                    $request->session()->flash($this->message_success, $request->get('bulk_action'). ' Action Successfully.');
                else
                    $request->session()->flash($this->message_success, 'Deleted successfully.');

                return redirect()->route($this->base_route);

            } else {
                $request->session()->flash($this->message_warning, 'Please, Check at least one row.');
                return redirect()->route($this->base_route);
            }

        } else return parent::invalidRequest();

    }

    /*bulk import*/
    public function importStaff()
    {
        return view(parent::loadDataToView($this->view_path.'.import'));
    }

    public function handleImportStaff(Request $request)
    {
        //file present or not validation
        $validator = Validator::make($request->all(), [
            'file' => 'required'
        ]);
        if ($validator->fails()) {
            return redirect()
                ->back()
                ->withErrors($validator);
        }

        $file = $request->file('file');
        $csvData = file_get_contents($file);
        $rows = array_map("str_getcsv", explode("\n", $csvData));
        $header = array_shift($rows);

        foreach ($rows as $row) {
            if (count($header) != count($row)) {
                continue;
            }

            $row = array_combine($header, $row);
            //Designation id
            $designation = StaffDesignation::where('title',$row['designation'])->first();
            if($designation){
                $designationId = $designation->id;
            }else{
                $designation = StaffDesignation::create([
                    'title' => strtoupper($row['designation']),
                    'created_by' => auth()->user()->id
                ]);

                $designationId = $designation->id;
            }

            //Staff validation
            $validator = Validator::make($row, [
                'reg_no'                => 'required  | unique:staff,reg_no',
                'join_date'              => 'required',
                'designation'           => 'required',
                'first_name'            => 'required',
                'last_name'             => 'required',
                'date_of_birth'         => 'required',
                'gender'                => 'required',
                'qualification'         => 'required',
                'mobile_1'              => 'required',
                'main_image'           => 'mimes:jpeg,bmp,png',
            ]);
            if ($validator->fails()) {
                return redirect()
                    ->back()
                    ->withErrors($validator);
            }


            /*Manage Date's Format*/
            $join_date = Carbon::parse($row['join_date'])->format('Y-m-d');
            $date_of_birth =  Carbon::parse($row['date_of_birth'])->format('Y-m-d');

            //Staff import
            $staff = Staff::create([
              "reg_no"              => $row['reg_no'],
              "join_date"           => $join_date,
              "designation"         => $designationId,
              "first_name"          => $row['first_name'],
              "middle_name"         => $row['middle_name'],
              "last_name"           => $row['last_name'],
              "father_name"         => $row['father_name'],
              "mother_name"         => $row['mother_name'],
              "date_of_birth"       => $date_of_birth,
              "gender"              => $row['gender'],
              "blood_group"         => $row['blood_group'],
              "nationality"         => $row['nationality'],
              "mother_tongue"       => $row['mother_tongue'],
              "email"               => $row['email'],
              "home_phone"          => $row['home_phone'],
              "mobile_1"            => $row['mobile_1'],
              "mobile_2"            => $row['mobile_2'],
              "address"             => $row['address'],
              "state"               => $row['state'],
              "country"             => $row['country'],
              "temp_address"        => $row['temp_address'],
              "temp_state"          => $row['temp_state'],
              "temp_country"        => $row['temp_country'],
              "qualification"       => $row['qualification'],
              "experience"          => $row['experience'],
              "experience_info"     => $row['experience_info'],
              "other_info"          => $row['other_info'],
              'created_by'          => auth()->user()->id

            ]);

            if($staff) {
                //Create Customer Ledger
                $request->request->add(['tr_head' => $row['first_name'].' '.$row['middle_name'].' '.$row['last_name'].' ' . ' [' . $staff->reg_no . ']']);
                $request->request->add(['ref_id' => $staff->id]);
                $request->request->add(['acc_id' => $this->staffAccCategory]);
                $request->request->add(['created_by' => auth()->user()->id]);
                $trHead = TransactionHead::create($request->all());

                //Manage Opening Balance of Customer
                /*if ($trHead && $request->amount > 0) {
                    if ($request->get('account_type') == "dr_amt") {
                        $drAmount = $request->amount;
                        $crAmount = 0;
                    } elseif ($request->get('account_type') == "cr_amt") {
                        $drAmount = 0;
                        $crAmount = $request->amount;
                    } else {

                    }

                    $data = [
                        'date' => Carbon::today(),
                        'tr_head_id' => $trHead->id,
                        'dr_amount' => $drAmount,
                        'cr_amount' => $crAmount,
                        'description' => 'Opening Balance',
                        'created_by' => auth()->user()->id
                    ];

                    Transaction::create($data);
                }*/
            }

        }

        $request->session()->flash($this->message_success,'Staffs imported Successfully');
        return redirect()->route($this->base_route);

    }
}

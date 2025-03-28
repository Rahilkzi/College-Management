<?php



namespace App\Http\Controllers\Student;

use App\Http\Controllers\CollegeBaseController;
use App\Http\Requests\Student\Registration\AddValidation;
use App\Http\Requests\Student\Registration\EditValidation;
use App\Jobs\AllEmail;
use App\Models\AcademicInfo;
use App\Models\Addressinfo;
use App\Models\AlertSetting;
use App\Models\Attendance;
use App\Models\AttendanceStatus;
use App\Models\BookIssue;
use App\Models\Document;
use App\Models\Faculty;
use App\Models\GuardianDetail;
use App\Models\LibraryMember;
use App\Models\Note;
use App\Models\ParentDetail;
use App\Models\ResidentHistory;
use App\Models\Student;
use App\Models\StudentAddressinfo;
use App\Models\StudentGuardian;
use App\Models\StudentParent;
use App\Models\SubjectAttendance;
use App\Models\TransportHistory;
use App\Models\Year;
use App\Traits\SmsEmailScope;
use App\Traits\UserScope;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Image, URL;
use ViewHelper;
use Illuminate\Support\Facades\Log;

class StudentController extends CollegeBaseController
{
    protected $base_route = 'student';
    protected $view_path = 'student';
    protected $panel = 'Students';
    protected $folder_path;
    protected $folder_name = 'studentProfile';
    protected $filter_query = [];

    use SmsEmailScope;
    use UserScope;

    public function __construct()
    {
        $this->folder_path = public_path().DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.$this->folder_name.DIRECTORY_SEPARATOR;
    }

    public function index(Request $request)
    {
        $data = [];
        if($request->all()) {
            $data['student'] = Student::select('students.id', 'students.reg_no', 'students.reg_date',
                'students.faculty', 'students.semester', 'students.batch', 'students.academic_status',
                'students.first_name', 'students.middle_name', 'students.last_name', 'students.status')
                ->where(function ($query) use ($request) {
                    $this->commonStudentFilterCondition($query, $request);
                })
                ->get();
        }else{
            $data['student'] = Student::select('students.id', 'students.reg_no', 'students.reg_date',
                'students.faculty', 'students.semester', 'students.batch', 'students.academic_status',
                'students.first_name', 'students.middle_name', 'students.last_name', 'students.status')
                ->Active()
                ->get();
        }

        $data['faculties'] = $this->activeFaculties();
        $data['batch'] = $this->activeBatch();
        $data['academic_status'] = $this->activeStudentAcademicStatus();

        //for Quick services Creation

        $data['url'] = URL::current();
        $data['filter_query'] = $this->filter_query;

        return view(parent::loadDataToView($this->view_path.'.index'), compact('data'));
    }

    public function registration()
    {
        $data = [];
        $data['blank_ins'] = new Student();

        $data['faculties'] = $this->activeFaculties();
        $data['semester'] = $this->activeSemester();
        $data['batch'] = $this->activeBatch();
        $data['academic_status'] = $this->activeStudentAcademicStatus();

        return view(parent::loadDataToView($this->view_path.'.registration.register'), compact('data'));
    }

    public function register(AddValidation $request)
    {
        DB::beginTransaction();
        try {
            Log::info('Starting student registration process', [
                'reg_no' => $request->reg_no,
                'serial_no' => $request->serial_no,
                'faculty' => $request->faculty
            ]);

            if(!isset($request->reg_no)){
                //RegNo Generator Start
                $oldStudent = Student::where('faculty',$request->faculty)->orderBy('id', 'DESC')->first();
                if (!$oldStudent){
                    $sn = 1;
                }else{
                    $oldReg = intval(substr($oldStudent->reg_no,-4));
                    $sn = $oldReg + 1;
                }

                $sn = substr("00000{$sn}", -4);
                $year = intval(substr(Year::where('active_status','=',1)->first()->title,-2));
                $faculty = Faculty::find(intval($request->faculty));
                $facultyCode = $faculty->faculty_code;
                //$regNum = $faculty.'-'.$year.'-'.$sn;
                $regNum = $facultyCode.$year.$sn;
                //reg generator End
                $request->request->add(['reg_no' => $regNum]);
            }else{
                $request->request->add(['reg_no' => $request->reg_no]);
            }


            if (!isset($request->serial_no)) {
                // RegNo Generator Start
                $oldStudent = Student::where('faculty', $request->faculty)->latest()->first();
                $sn = $oldStudent ? intval(substr($oldStudent->serial_no, -4)) + 1 : 1;

                $sn = str_pad($sn, 4, '0', STR_PAD_LEFT);
                $year = substr(Year::where('active_status', 1)->first()->title, -2);
                $faculty = Faculty::find(intval($request->faculty));
                $facultyName = $faculty ? $faculty->faculty : '';

                $SrNum = $facultyName . $year . '-' . $sn;
                // reg generator End

                $request->request->add(['serial_no' => $SrNum]);
            } else {
                $request->request->add(['serial_no' => $request->serial_no]);
            }


            if ($request->hasFile('student_main_image')){
                $student_image = $request->file('student_main_image');
                $student_image_name = $request->reg_no.'.'.$student_image->getClientOriginalExtension();
                $student_image->move(public_path().DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'studentProfile'.DIRECTORY_SEPARATOR, $student_image_name);
            }else{
                $student_image_name = "";
            }

            if ($request->hasFile('student_signature_main_image')){
                $student_signature_image = $request->file('student_signature_main_image');
                $student_signature_image_name = $request->reg_no.'_signature.'.$student_signature_image->getClientOriginalExtension();
                $student_signature_image->move(public_path().DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'studentProfile'.DIRECTORY_SEPARATOR, $student_signature_image_name);
            }else{
                $student_signature_image_name = "";
            }

            $request->request->add(['created_by' => auth()->user()->id]);
            $request->request->add(['semester' => $request->get('semester')]);
            $request->request->add(['student_image' => $student_image_name]);
            $request->request->add(['student_signature' => $student_signature_image_name]);

            // Add Devanagari name fields
            $request->request->add(['first_name_dev' => $request->get('first_name_dev')]);
            $request->request->add(['middle_name_dev' => $request->get('middle_name_dev')]);
            $request->request->add(['last_name_dev' => $request->get('last_name_dev')]);

            $student = Student::create($request->all());

            if ($student) {
                Log::info('Student base record created', ['student_id' => $student->id]);
            }

            $parential_image_path = public_path().DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'parents'.DIRECTORY_SEPARATOR;

            if ($request->hasFile('father_main_image')){
                $father_image = $request->file('father_main_image');
                $father_image_name = $student->reg_no.'_father.'.$father_image->getClientOriginalExtension();
                $father_image->move($parential_image_path, $father_image_name);
            }else{
                $father_image_name = "";
            }

            if ($request->hasFile('mother_main_image')){
                $mother_image = $request->file('mother_main_image');
                $mother_image_name = $student->reg_no.'_mother.'.$mother_image->getClientOriginalExtension();
                $mother_image->move($parential_image_path, $mother_image_name);
            }else{
                $mother_image_name = "";
            }

            if ($request->hasFile('guardian_main_image')){
                $guardian_image = $request->file('guardian_main_image');
                $guardian_image_name = $student->reg_no.'_guardian.'.$guardian_image->getClientOriginalExtension();
                $guardian_image->move($parential_image_path, $guardian_image_name);
            }else{
                $guardian_image_name = "";
            }

            $request->request->add(['father_image' => $father_image_name]);
            $request->request->add(['mother_image' => $mother_image_name]);
            $request->request->add(['guardian_image' => $guardian_image_name]);

            $request->request->add(['students_id' => $student->id]);
            $addressinfo = Addressinfo::create($request->all());
            if ($addressinfo) {
                Log::info('Address info created', ['address_id' => $addressinfo->id]);
            }
            $parentdetail = ParentDetail::create($request->all());
            if ($parentdetail) {
                Log::info('Parent details created', ['parent_id' => $parentdetail->id]);
            }

            if($request->guardian_link_id == null){
                $guardian = GuardianDetail::create($request->all());
                if ($guardian) {
                    Log::info('Guardian created/linked', ['guardian_id' => $guardian->id]);
                }
                $studentGuardian = StudentGuardian::create([
                    'students_id' => $student->id,
                    'guardians_id' => $guardian->id,
                ]);
            }else{
                $studentGuardian = StudentGuardian::create([
                    'students_id' => $student->id,
                    'guardians_id' => $request->guardian_link_id,
                ]);
            }

            /*Academic Info Start*/
            if ($student && $request->has('institution')) {
                foreach ($request->get('institution') as $key => $institute) {
                    AcademicInfo::create([
                        'students_id' => $student->id,
                        'institution' => $institute,
                        'board' => $request->get('board')[$key],
                        'pass_year' => $request->get('pass_year')[$key],
                        'symbol_no' => $request->get('symbol_no')[$key],
                        'percentage' => $request->get('percentage')[$key],
                        'division_grade' => $request->get('division_grade')[$key],
                        'major_subjects' => $request->get('major_subjects')[$key],
                        'remark' => $request->get('remark')[$key],
                        'created_by' => auth()->user()->id,
                    ]);
                }
            }
            /*Academic Info End*/

            /*SMS & Email Alert*/
            $alert = AlertSetting::select('sms','email','subject','template')->where('event','=','StudentRegistration')->first();
            if(!$alert){

            }else{
                //Dear {{first_name}}, you are successfully registered in our institution with RegNo.{{reg_no}}. Thank You.
                $subject = $alert->subject;
                $message = $alert->template;
                $message = str_replace('{{first_name}}', $student->first_name, $message );
                $message = str_replace('{{reg_no}}', $student->reg_no, $message );
                $emailIds[] = $student->email;
                $contactNumbers[] = $addressinfo->mobile_1;

                /*Now Send SMS On First Mobile Number*/
                if($alert->sms == 1){
                    $contactNumbers = $this->contactFilter($contactNumbers);
                    $smssuccess = $this->sendSMS($contactNumbers,$message);
                }

                /*Now Send Email With Subject*/
                if($alert->email == 1){
                    $emailIds = $this->emailFilter($emailIds);
                    /*sending email*/
                    $emailSuccess = $this->sendEmail($emailIds, $subject, $message);
                }
            }
            //end sms email

            DB::commit();
            Log::info('Student registration completed successfully');
            $request->session()->flash($this->message_success, $this->panel. ' Created Successfully.');

            if($request->add_student_another) {
                return back();
            }else{
                return redirect()->route($this->base_route);
            }

        } catch (\Exception $e) {
            DB::rollback();
            Log::error('Student registration failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            $request->session()->flash($this->message_danger, 'Failed to register student. Please try again.');
            return back();
        }
    }

    public function view($id)
    {
        $data = [];
        $data['student'] = Student::select('students.id','students.reg_no', 'students.reg_date', 'students.serial_no',
            'students.faculty','students.semester','students.batch', 'students.academic_status', 'students.first_name', 'students.middle_name',
            'students.last_name', 'students.first_name_dev', 'students.middle_name_dev', 'students.last_name_dev', 'students.first_name_dev', 
            'students.middle_name_dev', 'students.last_name_dev', 'students.first_name_dev', 'students.middle_name_dev', 'students.last_name_dev',
            'students.date_of_birth','students.gender', 'students.blood_group', 'students.adhar_no', 'students.religion', 'students.caste','students.nationality',
            'students.mother_tongue', 'students.email', 'students.extra_info', 'students.status', 'pd.grandfather_first_name',
            'pd.grandfather_middle_name', 'pd.grandfather_last_name', 'pd.father_first_name', 'pd.father_middle_name',
            'pd.father_last_name', 'pd.father_qualification', 'pd.father_occupation', 'pd.father_office', 'pd.father_office_number',
            'pd.father_residence_number', 'pd.father_mobile_1', 'pd.father_mobile_2', 'pd.father_email', 'pd.mother_first_name',
            'pd.mother_middle_name', 'pd.mother_last_name', 'pd.mother_qualification', 'pd.mother_occupation', 'pd.mother_office',
            'pd.mother_office_number', 'pd.mother_residence_number', 'pd.mother_mobile_1', 'pd.mother_mobile_2', 'pd.mother_email',
            'ai.address', 'ai.state', 'ai.country', 'ai.temp_address', 'ai.temp_state', 'ai.temp_country', 'ai.home_phone',
            'ai.mobile_1', 'ai.mobile_2', 'gd.id as guardian_id', 'gd.guardian_first_name', 'gd.guardian_middle_name', 'gd.guardian_last_name',
            'gd.guardian_qualification', 'gd.guardian_occupation', 'gd.guardian_office', 'gd.guardian_office_number', 'gd.guardian_residence_number',
            'gd.guardian_mobile_1', 'gd.guardian_mobile_2', 'gd.guardian_email', 'gd.guardian_relation', 'gd.guardian_address',
            'students.student_image','students.student_signature', 'pd.father_image', 'pd.mother_image', 'gd.guardian_image')
            ->where('students.id','=',$id)
            ->join('parent_details as pd', 'pd.students_id', '=', 'students.id')
            ->join('addressinfos as ai', 'ai.students_id', '=', 'students.id')
            ->join('student_guardians as sg', 'sg.students_id','=','students.id')
            ->join('guardian_details as gd', 'gd.id', '=', 'sg.guardians_id')
            ->first();

        if (!$data['student']){
            request()->session()->flash($this->message_warning, "Not a Valid Student");
            return redirect()->route($this->base_route);
        }

        $data['fee_master'] = $data['student']->feeMaster()->orderBy('fee_due_date','desc')->get();
        $data['fee_collection'] = $data['student']->feeCollect()->get();

        /*total Calculation on Table Foot*/
        $data['student']->fee_amount = $data['student']->feeMaster()->sum('fee_amount');
        $data['student']->discount = $data['student']->feeCollect()->sum('discount');
        $data['student']->fine = $data['student']->feeCollect()->sum('fine');
        $data['student']->paid_amount = $data['student']->feeCollect()->sum('paid_amount');
        $data['student']->balance =
            ($data['student']->fee_amount - ($data['student']->paid_amount + $data['student']->discount))+ $data['student']->fine;

        $data['document'] = Document::select('id', 'member_type','member_id', 'title', 'file','description', 'status')
            ->where('member_type','=','student')
            ->where('member_id','=',$data['student']->id)
            ->orderBy('created_by','desc')
            ->get();

       

   

        $data['note'] = Note::select('created_at', 'id', 'member_type','member_id','subject', 'note', 'status')
            ->where('member_type','=','student')
            ->where('member_id','=', $data['student']->id)
            ->orderBy('created_at','desc')
            ->get();

      

        $data['academics'] = $data['student']->academicInfo()->orderBy('sorting_order','asc')->get();

        /*Exam Score*/
        /*filter student with schedule subject markledger*/
        $subject = $data['student']->markLedger()
            //->select( 'exam_schedule_id',  'obtain_mark_theory', 'obtain_mark_practical','absent')
            ->get();

        //filter subject and joint mark from schedules;
        $filteredSubject  = $subject->filter(function ($subject, $key) {
            $joinSub = $subject->examSchedule()
                ->first();

            if($joinSub){
                $subject->subjects_id = $joinSub->subjects_id;
                $subject->full_mark_theory = $joinSub->full_mark_theory;
                $subject->pass_mark_theory = $joinSub->pass_mark_theory;
                $subject->full_mark_practical = $joinSub->full_mark_practical;
                $subject->pass_mark_practical = $joinSub->pass_mark_practical;

                /*attach exam detail*/
                $subject->years_id = $joinSub->years_id;
                $subject->months_id = $joinSub->months_id;
                $subject->exams_id = $joinSub->exams_id;
                $subject->faculty_id = $joinSub->faculty_id;
                $subject->semesters_id = $joinSub->semesters_id;
                //more
                $th = $subject->obtain_mark_theory;
                $pr = $subject->obtain_mark_practical;
                $absent_theory = $subject->absent_theory;
                $absent_practical = $subject->absent_practical;

                /*theory mark comparision*/
                if(isset($subject->pass_mark_theory) && $subject->pass_mark_theory != null){
                    if($absent_theory == 1) {
                        $subject->obtain_mark_theory = "AB";
                    }else{
                        //dd($th);//35
                        if(!is_numeric($th)){
                            $subject->obtain_mark_theory = "*";
                        }
                    }
                }else{
                    $subject->obtain_mark_theory = "-";
                }

                /*Practical mark comparision*/
                if(isset($subject->pass_mark_practical) && $subject->pass_mark_practical != null){
                    if($absent_practical == 1) {
                        $subject->obtain_mark_practical = "AB";
                    }else{
                        if(!is_numeric($pr)){
                            $subject->obtain_mark_practical = "*";
                        }
                    }
                }else{
                    $subject->obtain_mark_practical= "-";
                }


                /*verify again the new obtain values are number or not*/
                $th_new = $subject->obtain_mark_theory;
                $pr_new = $subject->obtain_mark_practical;

                $subject->total_obtain_mark = (is_numeric($th_new)?$th_new:0) + (is_numeric($pr_new)?$pr_new:0);

                if($th_new >= $subject->pass_mark_theory && $pr_new >= $subject->pass_mark_practical){
                    $subject->remark = '';
                    if($th_new > $subject->full_mark_theory){
                        $subject->th_remark = '*N';
                        $subject->remark = '*';
                    }

                    if($pr_new > $subject->full_mark_practical){
                        $subject->pr_remark = '*N';
                        $subject->remark = '*';
                    }

                }else{
                    $subject->remark = '*';

                    if($th_new < $subject->pass_mark_theory){
                        $subject->th_remark = '*';
                    }

                    if($pr_new < $subject->pass_mark_practical){
                        $subject->pr_remark = '*';
                    }

                    if($th_new > $subject->full_mark_theory){
                        $subject->th_remark = '*N';
                    }

                    if($pr_new > $subject->full_mark_practical){
                        $subject->pr_remark = '*N';
                    }

                }

                return $subject;
            }
        });

        $data['student']->markLedger->subjects = $filteredSubject;

        $data['examScore'] = $data['student']->markLedger->subjects->groupBY('months_id');

        /*Certificate History*/
        $data['certificate_history'] = $data['student']->certificateHistory()->get();

    

        //login credential
        $data['student_login'] = User::where([['role_id',6],['hook_id',$data['student']->id]])->first();
        $data['guardian_login'] = User::where([['role_id',7],['hook_id',$data['student']->guardian_id]])->first();

        $data['url'] = URL::current();
        return view(parent::loadDataToView($this->view_path.'.detail.index'), compact('data'));
    }

    public function edit(Request $request, $id)
    {
        $data = [];

        $data['row'] = Student::select('students.id','students.reg_no', 'students.reg_date', 'students.serial_no',
            'students.faculty','students.semester','students.batch', 'students.academic_status', 'students.first_name', 'students.middle_name',
            'students.last_name', 'students.first_name_dev', 'students.middle_name_dev', 'students.last_name_dev',
            'students.date_of_birth', 'students.gender', 'students.blood_group', 'students.adhar_no', 'students.religion', 'students.caste', 'students.nationality',
            'students.mother_tongue', 'students.email', 'students.extra_info','students.student_image', 'students.student_signature', 'students.status',
            'pd.grandfather_first_name',
            'pd.grandfather_middle_name', 'pd.grandfather_last_name', 'pd.father_first_name', 'pd.father_middle_name',
            'pd.father_last_name', 'pd.father_qualification', 'pd.father_occupation', 'pd.father_office', 'pd.father_office_number',
            'pd.father_residence_number', 'pd.father_mobile_1', 'pd.father_mobile_2', 'pd.father_email', 'pd.mother_first_name',
            'pd.mother_middle_name', 'pd.mother_last_name', 'pd.mother_qualification', 'pd.mother_occupation', 'pd.mother_office',
            'pd.mother_office_number', 'pd.mother_residence_number', 'pd.mother_mobile_1', 'pd.mother_mobile_2', 'pd.mother_email',
            'pd.father_image', 'pd.mother_image',
            'ai.address', 'ai.state', 'ai.country', 'ai.temp_address', 'ai.temp_state', 'ai.temp_country', 'ai.home_phone',
            'ai.mobile_1', 'ai.mobile_2', 'gd.id as guardians_id', 'gd.guardian_first_name', 'gd.guardian_middle_name', 'gd.guardian_last_name',
            'gd.guardian_qualification', 'gd.guardian_occupation', 'gd.guardian_office', 'gd.guardian_office_number',
            'gd.guardian_residence_number', 'gd.guardian_mobile_1', 'gd.guardian_mobile_2', 'gd.guardian_email',
            'gd.guardian_relation', 'gd.guardian_address', 'gd.guardian_image')
            ->where('students.id','=',$id)
            ->join('parent_details as pd', 'pd.students_id', '=', 'students.id')
            ->join('addressinfos as ai', 'ai.students_id', '=', 'students.id')
            ->join('student_guardians as sg', 'sg.students_id','=','students.id')
            ->join('guardian_details as gd', 'gd.id', '=', 'sg.guardians_id')
            ->first();

        if (!$data['row'])
            return parent::invalidRequest();

        $data['faculties'] = $this->activeFaculties();
        $data['semester'] = $this->activeSemester();
        $data['batch'] = $this->activeBatch();
        $data['academic_status'] = $this->activeStudentAcademicStatus();


        $data['academicInfo'] = $data['row']->academicInfo()->orderBy('sorting_order','asc')->get();
        //dd($data['academicInfo']->toArray());
        $data['academicInfo-html'] = view($this->view_path.'.registration.includes.forms.academic_tr_edit', [
            'academicInfos' => $data['academicInfo']
        ])->render();

        return view(parent::loadDataToView($this->view_path.'.registration.edit'), compact('data'));
    }

    public function update(EditValidation $request, $id)
    {
        if (!$row = Student::find($id)) {
            Log::warning('Student not found for update', ['id' => $id]);
            return parent::invalidRequest();
        }

        DB::beginTransaction();
        try {
            Log::info('Starting student update process', [
                'student_id' => $id,
                'reg_no' => $request->reg_no
            ]);

        

            if ($request->hasFile('student_main_image')) {
                // remove old image from folder
                if (file_exists($this->folder_path.$row->student_image))
                    @unlink($this->folder_path.$row->student_image);

                /*upload new student image*/
                $student_image = $request->file('student_main_image');
                $student_image_name = $request->reg_no.'.'.$student_image->getClientOriginalExtension();
                $student_image->move($this->folder_path, $student_image_name);
            }

            if ($request->hasFile('student_signature_main_image')) {
                // remove old image from folder
                if (file_exists($this->folder_path.$row->student_signature))
                    @unlink($this->folder_path.$row->student_signature);

                /*upload new student signature*/
                $student_signature = $request->file('student_signature_main_image');
                $student_signature_name = $request->reg_no.'_signature.'.$student_signature->getClientOriginalExtension();
                $student_signature->move($this->folder_path, $student_signature_name);
            }

            $request->request->add(['updated_by' => auth()->user()->id]);
            $request->request->add(['student_image' => isset($student_image_name)?$student_image_name:$row->student_image]);
            $request->request->add(['student_signature' => isset($student_signature_name)?$student_signature_name:$row->student_signature]);

            // Add Devanagari name fields
            $request->request->add(['first_name_dev' => $request->get('first_name_dev')]);
            $request->request->add(['middle_name_dev' => $request->get('middle_name_dev')]);
            $request->request->add(['last_name_dev' => $request->get('last_name_dev')]);

            $student = $row->update($request->all());

            if ($student) {
                Log::info('Student base record updated', ['student_id' => $id]);
            }

            /*Update Associate Address Info*/
            $row->address()->update([
                'address'    =>  $request->address,
                'state'      =>  $request->state,
                'country'    =>  $request->country,
                'temp_address' =>  $request->temp_address,
                'temp_state' =>  $request->temp_state,
                'temp_country' =>  $request->temp_country,
                'home_phone'   =>  $request->home_phone,
                'mobile_1'   =>  $request->mobile_1,
                'mobile_2'   =>  $request->mobile_2

            ]);

            if ($request->address) {
                Log::info('Address info updated', [
                    'student_id' => $id,
                    'address' => $request->address
                ]);
            }

            /*Update Associate Parents Info with Images*/
            $parent = $row->parents()->first();
            $guardian = $row->guardian()->first();

            $parential_image_path = public_path().DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'parents'.DIRECTORY_SEPARATOR;
            if ($request->hasFile('father_main_image')){
                // remove old image from folder
                if (file_exists($parential_image_path.$parent->father_image))
                    @unlink($parential_image_path.$parent->father_image);

                $father_image = $request->file('father_main_image');
                $father_image_name = $row->reg_no.'_father.'.$father_image->getClientOriginalExtension();
                $father_image->move($parential_image_path, $father_image_name);
            }

            if ($request->hasFile('mother_main_image')){
                // remove old image from folder
                if (file_exists($parential_image_path.$parent->mother_image))
                    @unlink($parential_image_path.$parent->mother_image);

                $mother_image = $request->file('mother_main_image');
                $mother_image_name = $row->reg_no.'_mother.'.$mother_image->getClientOriginalExtension();
                $mother_image->move($parential_image_path, $mother_image_name);
            }


            if ($request->hasFile('guardian_main_image')){
                // remove old image from folder
                if (file_exists($parential_image_path.$guardian->guardian_image))
                    @unlink($parential_image_path.$guardian->guardian_image);

                $guardian_image = $request->file('guardian_main_image');
                $guardian_image_name = $row->reg_no.'_guardian.'.$guardian_image->getClientOriginalExtension();
                $guardian_image->move($parential_image_path, $guardian_image_name);
            }

            $father_image_name = isset($father_image_name)?$father_image_name:$parent->father_image;
            $mother_image_name = isset($mother_image_name)?$mother_image_name:$parent->mother_image;
            $guardian_image_name = isset($guardian_image_name)?$guardian_image_name:$guardian->guardian_image;

            $row->parents()->update([
                'grandfather_first_name'    =>  $request->grandfather_first_name,
                'grandfather_middle_name'   =>  $request->grandfather_middle_name,
                'grandfather_last_name'     =>  $request->grandfather_last_name,
                'father_first_name'         =>  $request->father_first_name,
                'father_middle_name'        =>  $request->father_middle_name,
                'father_last_name'          =>  $request->father_last_name,
                'father_qualification'        =>  $request->father_qualification,
                'father_occupation'         =>  $request->father_occupation,
                'father_office'             =>  $request->father_office,
                'father_office_number'      =>  $request->father_office_number,
                'father_residence_number'   =>  $request->father_residence_number,
                'father_mobile_1'           =>  $request->father_mobile_1,
                'father_mobile_2'           =>  $request->father_mobile_2,
                'father_email'              =>  $request->father_email,
                'mother_first_name'         =>  $request->mother_first_name,
                'mother_middle_name'        =>  $request->mother_middle_name,
                'mother_last_name'          =>  $request->mother_last_name,
                'mother_qualification'        =>  $request->mother_qualification,
                'mother_occupation'         =>  $request->mother_occupation,
                'mother_office'             =>  $request->mother_office,
                'mother_office_number'      =>  $request->mother_office_number,
                'mother_residence_number'   =>  $request->mother_residence_number,
                'mother_mobile_1'           =>  $request->mother_mobile_1,
                'mother_mobile_2'           =>  $request->mother_mobile_2,
                'mother_email'              =>  $request->mother_email,
                'father_image'              =>  $father_image_name,
                'mother_image'              =>  $mother_image_name

            ]);

            if ($request->father_first_name) {
                Log::info('Parent info updated', [
                    'student_id' => $id,
                    'father_name' => $request->father_first_name
                ]);
            }

            //if guardian link modified or not condition
            if($request->guardian_link_id == null){
                $sgd = $row->guardian()->first();
                $guardiansInfo = [
                    'guardian_first_name'         =>  $request->guardian_first_name,
                    'guardian_middle_name'        =>  $request->guardian_middle_name,
                    'guardian_last_name'          =>  $request->guardian_last_name,
                    'guardian_qualification'        =>  $request->guardian_qualification,
                    'guardian_occupation'         =>  $request->guardian_occupation,
                    'guardian_office'             =>  $request->guardian_office,
                    'guardian_office_number'      =>  $request->guardian_office_number,
                    'guardian_residence_number'   =>  $request->guardian_residence_number,
                    'guardian_mobile_1'           =>  $request->guardian_mobile_1,
                    'guardian_mobile_2'           =>  $request->guardian_mobile_2,
                    'guardian_email'              =>  $request->guardian_email,
                    'guardian_relation'           =>  $request->guardian_relation,
                    'guardian_address'            =>  $request->guardian_address,
                    'guardian_image'              =>  $guardian_image_name
                ];
                GuardianDetail::where('id',$sgd->guardians_id)->update($guardiansInfo);

                if ($request->guardian_first_name) {
                    Log::info('Guardian info updated', [
                        'student_id' => $id,
                        'guardian_id' => $sgd->guardians_id
                    ]);
                }
            }else{
                $studentGuardian = StudentGuardian::where('students_id', $row->id)->update([
                    'students_id' => $row->id,
                    'guardians_id' => $request->guardian_link_id,
                ]);

                if ($request->guardian_link_id) {
                    Log::info('Guardian link updated', [
                        'student_id' => $id,
                        'new_guardian_id' => $request->guardian_link_id
                    ]);
                }
            }

            /*Academic Info Start*/
            if ($row && $request->has('institution')) {
                foreach ($request->get('institution') as $key => $institution) {
                    $academicInfoId = isset($request->get('academic_info_id')[$key])?$request->get('academic_info_id')[$key]:$key+1;
                    $academicInfoExist = AcademicInfo::where('id',$academicInfoId)->first();
                    if($academicInfoExist){
                        $academicInfoUpdate = [
                            'students_id' => $row->id,
                            'institution' => $institution,
                            'board' => $request->get('board')[$key],
                            'pass_year' => $request->get('pass_year')[$key],
                            'symbol_no' => $request->get('symbol_no')[$key],
                            'percentage' => $request->get('percentage')[$key],
                            'division_grade' => $request->get('division_grade')[$key],
                            'major_subjects' => $request->get('major_subjects')[$key],
                            'remark' => $request->get('remark')[$key],
                            'sorting_order' => $key+1,
                            'last_updated_by' => auth()->user()->id
                        ];
                        $academicInfoExist->update($academicInfoUpdate);
                    }else{
                        AcademicInfo::create([
                            'students_id' => $row->id,
                            'institution' => $institution,
                            'board' => $request->get('board')[$key],
                            'pass_year' => $request->get('pass_year')[$key],
                            'symbol_no' => $request->get('symbol_no')[$key],
                            'percentage' => $request->get('percentage')[$key],
                            'division_grade' => $request->get('division_grade')[$key],
                            'major_subjects' => $request->get('major_subjects')[$key],
                            'remark' => $request->get('remark')[$key],
                            'sorting_order' => $key+1,
                            'created_by' => auth()->user()->id,
                        ]);
                    }
                }
            }
            /*Academic Info End*/

            DB::commit();
            Log::info('Student update completed successfully');
            $request->session()->flash($this->message_success, $this->panel. ' Info Updated Successfully.');
            return back();

        } catch (\Exception $e) {
            DB::rollback();
            Log::error('Student update failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'student_id' => $id
            ]);
            $request->session()->flash($this->message_danger, 'Failed to update student. Please try again.');
            return back();
        }
    }

    public function delete(Request $request, $id)
    {
        try {
            if (!$row = Student::find($id)) {
                Log::warning('Student not found for deletion', [
                    'id' => $id,
                    'user_id' => auth()->id()
                ]);
                return parent::invalidRequest();
            }

            DB::beginTransaction();
            
            try {
                Log::info('Starting student deletion process', [
                    'student_id' => $id,
                    'reg_no' => $row->reg_no,
                    'user_id' => auth()->id()
                ]);

                // Delete user accounts
                $userDeleted = User::where(['role_id' => 6, 'hook_id'=> $id])->delete();
                $guardianUserDeleted = User::where(['role_id' => 7, 'hook_id'=> $id])->delete();
                
                Log::info('User accounts deleted', [
                    'student_user_deleted' => $userDeleted,
                    'guardian_user_deleted' => $guardianUserDeleted
                ]);

                // Delete related records with logging
                $deletedCounts = [
                    'documents' => $row->studentDocuments()->delete(),
                    'notes' => $row->studentNotes()->delete(),
                    'certificates' => [
                        'history' => $row->certificateHistory()->delete(),
                        'attendance' => $row->attendanceCertificate()->delete(),
                        'bonafide' => $row->bonafideCertificate()->delete(),
                        'completion' => $row->courseCompletionCertificate()->delete(),
                        'transfer' => $row->transferCertificate()->delete(),
                    ],
                    'academic' => [
                        'markLedger' => $row->markLedger()->delete(),
                        'attendance' => $row->regularAttendance()->delete(),
                        'info' => $row->academicInfo()->delete(),
                    ],
                    'fees' => [
                        'collect' => $row->feeCollect()->delete(),
                        'master' => $row->feeMaster()->delete(),
                    ]
                ];

                Log::info('Related records deleted', ['counts' => $deletedCounts]);

                // Handle guardian deletion
                $guardian = $row->guardian()->first();
                if ($guardian) {
                    $studentGuardian = StudentGuardian::where('students_id', $row->id)->first();
                    if ($studentGuardian) {
                        $otherLinks = StudentGuardian::where('guardians_id', $studentGuardian->guardians_id)
                            ->where('students_id', '!=', $row->id)
                            ->count();
                        
                        Log::info('Guardian check', [
                            'guardian_id' => $studentGuardian->guardians_id,
                            'other_links' => $otherLinks
                        ]);

                        if ($otherLinks == 0) {
                            // Get guardian record before deleting
                            $guardianToDelete = GuardianDetail::find($studentGuardian->guardians_id);
                            if ($guardianToDelete) {
                                $guardianToDelete->delete();
                                Log::info('Guardian deleted', ['guardian_id' => $studentGuardian->guardians_id]);
                            } else {
                                Log::warning('Guardian record not found for deletion', [
                                    'guardian_id' => $studentGuardian->guardians_id
                                ]);
                            }
                        }
                        
                        // Delete student-guardian link
                        $studentGuardian->delete();
                        Log::info('Student-guardian link deleted', [
                            'student_id' => $row->id,
                            'guardian_id' => $studentGuardian->guardians_id
                        ]);
                    }
                }

                // Delete parent record
                $parent = $row->parents()->first();
                if ($parent) {
                    // Delete parent images if they exist
                    $parential_image_path = public_path().DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'parents'.DIRECTORY_SEPARATOR;
                    
                    if ($parent->father_image && file_exists($parential_image_path.$parent->father_image)) {
                        @unlink($parential_image_path.$parent->father_image);
                    }
                    if ($parent->mother_image && file_exists($parential_image_path.$parent->mother_image)) {
                        @unlink($parential_image_path.$parent->mother_image);
                    }
                    
                    $parent->delete();
                    Log::info('Parent record deleted', ['parent_id' => $parent->id]);
                }

                // Delete address record
                $address = $row->address()->first();
                if ($address) {
                    $address->delete();
                    Log::info('Address record deleted', ['address_id' => $address->id]);
                }

                // Finally delete student
                $row->delete();

                DB::commit();
                Log::info('Student deletion completed successfully', [
                    'student_id' => $id,
                    'reg_no' => $row->reg_no
                ]);

                $request->session()->flash($this->message_success, $this->panel.' Deleted Successfully.');
                return back();

            } catch (\Exception $e) {
                DB::rollback();
                Log::error('Student deletion failed', [
                    'error' => $e->getMessage(),
                    'trace' => $e->getTraceAsString(),
                    'student_id' => $id,
                    'line' => $e->getLine(),
                    'file' => $e->getFile()
                ]);
                $request->session()->flash($this->message_danger, 'Failed to delete '.$this->panel.'. Please try again.');
                return back();
            }
        } catch (\Exception $e) {
            Log::error('Fatal error in student deletion', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'student_id' => $id,
                'line' => $e->getLine(),
                'file' => $e->getFile()
            ]);
            $request->session()->flash($this->message_danger, 'A system error occurred. Please try again.');
            return back();
        }
    }

    public function active(request $request, $id)
    {
        if (!$row = Student::find($id)) return parent::invalidRequest();

        $request->request->add(['status' => 'active']);

        $row->update($request->all());

        $request->session()->flash($this->message_success, $row->reg_no.' '.$this->panel.' Active Successfully.');
        return redirect()->route($this->base_route);
    }

    public function inActive(request $request, $id)
    {
        if (!$row = Student::find($id)) return parent::invalidRequest();

        $request->request->add(['status' => 'in-active']);
        $row->update($request->all());

        //in active student login detail
        $login_detail = User::where([['role_id',6],['hook_id',$row->id]])->first();
        if($login_detail){
            $request->request->add(['status' => 'in-active']);
            $login_detail->update($request->all());
        }

        // in active guardian login detail
        $login_detail = User::where([['role_id',7],['hook_id',$row->id]])->first();
        if($login_detail) {
            $request->request->add(['status' => 'in-active']);
            $login_detail->update($request->all());
        }

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
                            $row = Student::find($row_id);
                            if ($row) {
                                $row->status = $request->get('bulk_action') == 'active'?'active':'in-active';
                                $row->save();
                            }
                            break;
                        case 'delete':
                            $this->delete($request, $row_id);
                            break;
                    }
                }

                if ($request->get('bulk_action') == 'active' || $request->get('bulk_action') == 'in-active') {
                    $request->session()->flash($this->message_success, $request->get('bulk_action') . ' Action Successfully.');
                }else {
                    //$request->session()->flash($this->message_success, 'Deleted successfully.');
                }

                return redirect()->route($this->base_route);

            } else {
                $request->session()->flash($this->message_warning, 'Please, Check at least one row.');
                return redirect()->route($this->base_route);
            }

        } else return parent::invalidRequest();

    }

    public function findSemester(Request $request)
    {
        $response = [];
        $response['error'] = true;

        if ($request->has('faculty_id')) {
            $faculty = Faculty::find($request->get('faculty_id'));
            if ($faculty) {
                $response['semester'] = $faculty->semester()->select('semesters.id', 'semesters.semester')->get();
                $response['error'] = false;
                $response['success'] = 'Semester/Sec. Available For This Faculty/Class.';
            } else {
                $response['error'] = 'No Any Semester Assign on This Faculty/Class.';
            }
        } else {
            $response['message'] = 'Invalid request!!';
        }
        return response()->json(json_encode($response));
    }

    public function transfer(Request $request)
    {
        $data = [];
        if($request->all()) {
            $data['student'] = Student::select('id', 'reg_no', 'reg_date', 'first_name', 'middle_name', 'last_name',
                'faculty', 'semester','academic_status', 'status')
                ->where(function ($query) use ($request) {
                    $this->commonStudentFilterCondition($query, $request);
                })
                ->get();
        }

        $data['faculties'] = $this->activeFaculties();
        $data['batch'] = $this->activeBatch();
        $data['academic_status'] = $this->activeStudentAcademicStatus();

        $data['url'] = URL::current();
        $data['filter_query'] = $this->filter_query;

        return view(parent::loadDataToView($this->view_path.'.transfer.index'), compact('data'));
    }

    public function transfering(Request $request)
    {
        if($request->faculty > 0 && $request->semester_select > 0){
            if ($request->has('chkIds')) {
                $studIds = $request->get('chkIds');
                $students = Student::whereIn('id',$studIds)->get();
                //filter student & update new data & send alert if active
                /*Here We prepare message, contact number and email ids*/
                $emailIds = [];
                $contactNumbers = [];
                $alert = AlertSetting::select('sms','email','subject','template')->where('event','=','StudentTransfer')->first();

                $filteredStudent  = $students->filter(function ($student, $key) use ($alert, $emailIds, $contactNumbers, $request){
                    $updateData = [
                        'faculty' => $request->get('faculty'),
                        'semester' => $request->get('semester_select'),
                        'academic_status' => $request->get('student_status')
                    ];
                    $updateStudent = $student->update($updateData);
                    $semesterName = $this->getSemesterById($request->get('semester_select'));

                    if(!$alert) {

                    }else{
                        //send alert
                        //Dear {{first_name}}, We would like to inform you are successfully transferred to {{semester}}. Thank You.
                        $subject = $alert->subject;
                        $message = $alert->template;
                        $message = str_replace('{{first_name}}', $student->first_name, $message );
                        $message = str_replace('{{semester}}', $semesterName, $message );
                        $emailIds[] = $student->email;
                        $contactNumbers[] = $this->getStudentMobileNumber($student->id);

                        /*Now Send SMS On First Mobile Number*/
                        if($alert->sms == 1){
                            $contactNumbers = $this->contactFilter($contactNumbers);
                            $smssuccess = $this->sendSMS($contactNumbers,$message);
                        }

                        /*Now Send Email With Subject*/
                        if($alert->email == 1){
                            $emailIds = $this->emailFilter($emailIds);
                            /*sending email*/
                            $emailSuccess = $this->sendEmail($emailIds, $subject, $message);
                        }

                    }
                });
            }else {
                $request->session()->flash($this->message_warning, 'Please, Check at least one row.');
                return redirect()->route($this->base_route.'.transfer');
            }

            $faculty_title = ViewHelper::getFacultyTitle( $request->faculty );
            $semester_title = ViewHelper::getSemesterTitle( $request->semester_select );
            $request->session()->flash($this->message_success, 'Students Transfer on : '.$faculty_title.' / '.$semester_title.' Successfully.');

        }else{
            $request->session()->flash($this->message_success, 'Please Choose Faculty and Semester Correctly.');
        }
        return redirect()->route($this->base_route.'.transfer');
    }

    public function academicInfoHtml()
    {
        $response['html'] = view($this->view_path.'.registration.includes.forms.academic_tr')->render();
        return response()->json(json_encode($response));
    }

    public function deleteAcademicInfo(Request $request, $id)
    {
        if (!$row = AcademicInfo::find($id)) return parent::invalidRequest();

        $row->delete();

        $request->session()->flash($this->message_success,'Academic Info Deleted Successfully.');
        return redirect()->back();
    }

    /*guardian's info link*/
    public function guardianNameAutocomplete(Request $request)
    {
        if ($request->has('q')) {

            $guardians = GuardianDetail::select('id','guardian_first_name',
                'guardian_middle_name', 'guardian_last_name', 'guardian_qualification',
                'guardian_occupation', 'guardian_office', 'guardian_office_number',
                'guardian_residence_number', 'guardian_mobile_1', 'guardian_mobile_2',
                'guardian_email', 'guardian_relation', 'guardian_address','guardian_image')
                ->where('guardian_first_name', 'like', '%'.$request->get('q').'%')
                ->orWhere('guardian_middle_name', 'like', '%'.$request->get('q').'%')
                ->orWhere('guardian_last_name', 'like', '%'.$request->get('q').'%')
                ->orWhere('guardian_mobile_1', 'like', '%'.$request->get('q').'%')
                ->orWhere('guardian_mobile_2', 'like', '%'.$request->get('q').'%')
                ->orWhere('guardian_email', 'like', '%'.$request->get('q').'%')
                ->get();

            $response = [];
            foreach ($guardians as $guardian) {
                $guardianName = $guardian->guardian_first_name.' '.$guardian->guardian_middle_name.' '.$guardian->guardian_last_name;
                $response[] = ['id' => $guardian->id, 'text' => $guardianName.'- [MoNo.-'.$guardian->guardian_mobile_1.'] - [Email-'.$guardian->guardian_email.']'];
            }

            return json_encode($response);
        }

        abort(501);
    }

    public function guardianInfo(Request $request)
    {
        $response = [];
        $response['error'] = true;
        if ($request->has('id')) {
            if ($guardianInfo = GuardianDetail::find($request->get('id'))) {
                $response['error'] = false;
                $response['html'] = view($this->view_path.'.registration..includes.forms.pull-guardian-info', [
                    'guardianInfo' => $guardianInfo,
                ])->render();
                $response['message'] = 'Operation successful.';

            } else{
                $response['message'] = $request->get('subject_id').'Invalid request!!';
            }
        } else{
            $response['message'] = $request->get('id').'Invalid request!!';
        }

        return response()->json(json_encode($response));
    }

    /*bulk import*/
    public function importStudent()
    {
        /* $row['reg_date'] = '01-12-2017';
         $reg_date = Carbon::parse($row['reg_date'])->format('Y-m-d');
         dd($reg_date);*/
        return view(parent::loadDataToView($this->view_path.'.registration.import'));
    }

    public function handleImportStudent(Request $request)
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

            //Faculty id
            /* $faculty = Faculty::where('faculty',$row['faculty'])->first();
             if($faculty){
                 $facultyId = $faculty->id;
             }else{
                 $facultyId = "";
             }*/

            //Semester id
            /* $semester = Semester::where('semester',$row['semester'])->first();
             if($semester){
                 $semesterId = $semester->id;
             }else{
                 $semesterId = "";
             }*/

            //Academic Status
            /*$academicStatus = StudentStatus::where('title',$row['academic_status'])->first();
            if($academicStatus){
                $academicStatusId = $academicStatus->id;
            }else{
                $academicStatusId = 1; //1 for new Admission
            }*/

            //RegNo Generator Start
                if(!isset($row['reg_no'])){                 
					$oldStudent = Student::where('faculty',$request->faculty)->orderBy('id', 'DESC')->first();
                    if (!$oldStudent){
                        $sn = 1;
                    }else{
                        $oldReg = intval(substr($oldStudent->reg_no,-4));
                        $sn = $oldReg + 1;
                    }

                    $sn = substr("00000{$sn}", - 4);
                    $year = intval(substr(Year::where('active_status','=',1)->first()->title,-2));
                    $faculty = Faculty::find(intval($row['faculty']));
                    $facultyCode = $faculty->faculty_code;
                    //$regNum = $faculty.'-'.$year.'-'.$sn;
                    $regNum = $facultyCode.$year.$sn;
                    $row['reg_no'] = $regNum;
                }else{
                    //$row['reg_no'] = '';
                }

            //reg generator End

            //Student validation
            $validator = Validator::make($row, [
                'reg_no'                        => 'required  | max:25 | unique:students,reg_no',
                'reg_date'                      => 'required',
                'faculty'                       => 'required | exists:faculties,id',
                'semester'                      => 'required | exists:semesters,id',
                'first_name'                    => 'required | max:100',
                'last_name'                     => 'required | max:25',
                'date_of_birth'                 => 'required',
                'adhar_no'                      => 'required | unique:students,adhar_no',
                'gender'                        => 'required',
                'religion'                      => 'max:15',
                'caste'                         => 'max:15',
                'nationality'                   => 'required | max:25',
                'address'                       => 'required | max:100',
                'state'                         => 'required | max:25',
                'country'                       => 'required | max:25',
                'temp_address'                  => 'max:100',
                'temp_state'                    => 'max:25',
                'temp_country'                  => 'max:25',
                /*'email'                         => 'required | max:100 | unique:students,email',*/
                'extra_info'                    => 'max:100',
                'home_phone'                    => 'max:25',
                'mobile_1'                      => 'max:25',
                'mobile_2'                      => 'max:25',
                'grandfather_first_name'        => 'max:25',
                'grandfather_middle_name'       => 'max:25',
                'grandfather_last_name'         => 'max:25',
                'father_first_name'             => 'max:25',
                'father_middle_name'            => 'max:25',
                'father_last_name'              => 'max:25',
                'father_qualification'            => 'max:50',
                'father_occupation'             => 'max:50',
                'father_office'                 => 'max:100',
                'father_office_number'          => 'max:25',
                'father_residence_number'       => 'max:25',
                'father_mobile_1'               => 'max:25',
                'father_mobile_2'               => 'max:25',
                'father_email'                  => 'max:100',
                'mother_first_name'             => 'max:25',
                'mother_middle_name'            => 'max:25',
                'mother_last_name'              => 'max:25',
                'mother_qualification'            => 'max:50',
                'mother_occupation'             => 'max:50',
                'mother_office'                 => 'max:100',
                'mother_office_number'          => 'max:25',
                'mother_residence_number'       => 'max:25',
                'mother_mobile_1'               => 'max:25',
                'mother_mobile_2'               => 'max:25',
                'mother_email'                  => 'max:100',
            ]);

            if ($validator->fails()) {
                return redirect()
                    ->back()
                    ->withErrors($validator);
            }

            /*Manage Date's Format*/
            $reg_date = Carbon::parse($row['reg_date'])->format('Y-m-d');
            $date_of_birth =  Carbon::parse($row['date_of_birth'])->format('Y-m-d');
            //Student import
            $student = Student::create([
                "reg_no"                => $row['reg_no'],
                "reg_date"              => $reg_date,
                "serial_no"             => $row['serial_no'],
                "faculty"               => $row['faculty'],
                "semester"              => $row['semester'],
                "academic_status"       => $row['academic_status'],
                "batch"                 => $row['batch'],
                "first_name"            => $row['first_name'],
                "middle_name"           => $row['middle_name'],
                "last_name"             => $row['last_name'],
                "first_name_dev"        => $row['first_name_dev'],
                "middle_name_dev"       => $row['middle_name_dev'],
                "last_name_dev"         => $row['last_name_dev'],
                "date_of_birth"         => $date_of_birth,
                "gender"                => $row['gender'],
                "blood_group"           => $row['blood_group'],
                "adhar_no"              => $row['adhar_no'],
                "religion"              => $row['religion'],
                "caste"                 => $row['caste'],
                "nationality"           => $row['nationality'],
                "mother_tongue"         => $row['mother_tongue'],
                "email"                 => $row['email'],
                "extra_info"            => $row['extra_info'],
                'created_by'            => auth()->user()->id
            ]);

            if($student){
                //address info
                Addressinfo::create([
                    "students_id"           => $student->id,
                    "home_phone"            => $row['home_phone'],
                    "mobile_1"              => $row['mobile_1'],
                    "mobile_2"              => $row['mobile_2'],
                    "address"               => $row['address'],
                    "state"                 => $row['state'],
                    "country"               => $row['country'],
                    "temp_address"          => $row['temp_address'],
                    "temp_state"            => $row['temp_state'],
                    "temp_country"          => $row['temp_country'],
                    'created_by'            => auth()->user()->id
                ]);

                //parents detail
                ParentDetail::create([
                    "students_id"               => $student->id,
                    "home_phone"                => $row['home_phone'],
                    "grandfather_first_name"    => $row['grandfather_first_name'],
                    "grandfather_middle_name"   => $row['grandfather_middle_name'],
                    "grandfather_last_name"     => $row['grandfather_last_name'],
                    "father_first_name"         => $row['father_first_name'],
                    "father_middle_name"        => $row['father_middle_name'],
                    "father_last_name"          => $row['father_last_name'],
                    "father_qualification"        => $row['father_qualification'],
                    "father_occupation"         => $row['father_occupation'],
                    "father_office"             => $row['father_office'],
                    "father_office_number"      => $row['father_office_number'],
                    "father_residence_number"   => $row['father_residence_number'],
                    "father_mobile_1"           => $row['father_mobile_1'],
                    "father_mobile_2"           => $row['father_mobile_2'],
                    "father_email"              => $row['father_email'],
                    "mother_first_name"         => $row['mother_first_name'],
                    "mother_middle_name"        => $row['mother_middle_name'],
                    "mother_last_name"          => $row['mother_last_name'],
                    "mother_qualification"        => $row['mother_qualification'],
                    "mother_occupation"         => $row['mother_occupation'],
                    "mother_office"             => $row['mother_office'],
                    "mother_office_number"      => $row['mother_office_number'],
                    "mother_residence_number"   => $row['mother_residence_number'],
                    "mother_mobile_1"           => $row['mother_mobile_1'],
                    "mother_mobile_2"           => $row['mother_mobile_2'],
                    "mother_email"              => $row['mother_email'],
                    'created_by'                => auth()->user()->id
                ]);

                //Guardian detail
                $guardian = GuardianDetail::create([
                    "students_id"                 => $student->id,
                    "guardian_first_name"         => $row['guardian_first_name'],
                    "guardian_middle_name"        => $row['guardian_middle_name'],
                    "guardian_last_name"          => $row['guardian_last_name'],
                    "guardian_qualification"        => $row['guardian_qualification'],
                    "guardian_occupation"         => $row['guardian_occupation'],
                    "guardian_office"             => $row['guardian_office'],
                    "guardian_office_number"      => $row['guardian_office_number'],
                    "guardian_residence_number"   => $row['guardian_residence_number'],
                    "guardian_mobile_1"           => $row['guardian_mobile_1'],
                    "guardian_mobile_2"           => $row['guardian_mobile_2'],
                    "guardian_email"              => $row['guardian_email'],
                    "guardian_relation"           => $row['guardian_relation'],
                    "guardian_address"            => $row['guardian_address'],
                    'created_by'                  => auth()->user()->id
                ]);

                /*student guardian link*/

                if($guardian){
                    StudentGuardian::create([
                        'students_id' => $student->id,
                        'guardians_id' => $guardian->id,
                    ]);
                }
            }

        }

        $request->session()->flash($this->message_success,'Students imported Successfully');
        return redirect()->route($this->base_route);
    }

    /*student name auto complete*/
    public function studentNameAutocomplete(Request $request)
    {
        if ($request->has('q')) {
            $students = Student::select('students.id', 'students.reg_no', 'students.serial_no',
                'students.first_name', 'students.middle_name', 'students.last_name', 'students.semester','students.email',
                'ai.mobile_1', 'ai.mobile_2')
                ->where('students.reg_no', 'like', '%'.$request->get('q').'%')
                ->orWhere('students.serial_no', 'like', '%'.$request->get('q').'%')
                ->orWhere('students.first_name', 'like', '%'.$request->get('q').'%')
                ->orWhere('students.middle_name', 'like', '%'.$request->get('q').'%')
                ->orWhere('students.last_name', 'like', '%'.$request->get('q').'%')
                ->orWhere('students.email', 'like', '%'.$request->get('q').'%')
                ->orWhere('ai.mobile_1', 'like', '%'.$request->get('q').'%')
                ->orWhere('ai.mobile_2', 'like', '%'.$request->get('q').'%')
                ->join('addressinfos as ai','ai.students_id','=','students.id')
                ->get();

            $response = [];
            foreach ($students as $student) {
                $response[] = ['id' => $student->id, 'text' => $student->reg_no.' | '.$student->first_name.' '.$student->middle_name.' '.$student->last_name.' | '.$this->getSemesterById($student->semester).' | '.$student->mobile_1];
            }

            return json_encode($response);
        }

        abort(501);
    }
}

<?php


namespace App\Http\Controllers\Attendance;

use App\Http\Controllers\CollegeBaseController;
use App\Models\AlertSetting;
use App\Models\Attendance;
use App\Models\AttendanceStatus;
use App\Models\Month;
use App\Models\Semester;
use App\Models\Student;
use App\Models\Year;
use App\Traits\AcademicScope;
use App\Traits\SmsEmailScope;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use View, URL;
use Illuminate\Support\Facades\Storage;
use League\Csv\Reader;
use League\Csv\Writer;
use League\Csv\Statement;

class StudentAttendanceController extends CollegeBaseController
{
    protected $base_route = 'attendance.student';
    protected $view_path = 'attendance.student';
    protected $panel = 'Student Attendance';
    protected $filter_query = [];

    use AcademicScope;
    use SmsEmailScope;

    public function __construct()
    {

    }

    public function index(Request $request)
    {
        $data = [];

        if ($request->all()) {
            if (auth()->user()->hasRole('staff')) {
                $id = auth()->user()->id;
                $staffId = auth()->user()->hook_id;

                if ($request->has('semester_select')) {
                    $semesterStaff = Semester::where('staff_id', $staffId)->where('id', $request->semester_select)->first();

                    if (isset($semesterStaff)) {

                        $students = Attendance::select(
                            'attendances.id',
                            'attendances.attendees_type',
                            'attendances.link_id',
                            'attendances.years_id',
                            'attendances.months_id',
                            'attendances.day_1',
                            'attendances.day_2',
                            'attendances.day_3',
                            'attendances.day_4',
                            'attendances.day_5',
                            'attendances.day_6',
                            'attendances.day_7',
                            'attendances.day_8',
                            'attendances.day_9',
                            'attendances.day_10',
                            'attendances.day_11',
                            'attendances.day_12',
                            'attendances.day_13',
                            'attendances.day_14',
                            'attendances.day_15',
                            'attendances.day_16',
                            'attendances.day_17',
                            'attendances.day_18',
                            'attendances.day_19',
                            'attendances.day_20',
                            'attendances.day_21',
                            'attendances.day_22',
                            'attendances.day_23',
                            'attendances.day_24',
                            'attendances.day_25',
                            'attendances.day_26',
                            'attendances.day_27',
                            'attendances.day_28',
                            'attendances.day_29',
                            'attendances.day_30',
                            'attendances.day_31',
                            'attendances.day_32',
                            'students.id as students_id',
                            'students.reg_no',
                            'students.first_name',
                            'students.middle_name',
                            'students.last_name',
                            'students.faculty',
                            'students.semester'
                        )
                            ->where('attendances.created_by', $id)
                            ->where('attendances.attendees_type', 1)
                            ->where('students.semester', $semesterStaff->id)
                            ->where(function ($query) use ($request) {

                                $this->commonStudentFilterCondition($query, $request);

                                if ($request->has('year') && $request->get('year') != 0) {
                                    $query->where('attendances.years_id', '=', $request->year);
                                    $this->filter_query['attendances.years_id'] = $request->year;
                                }

                                if ($request->has('month') && $request->get('month') != 0) {
                                    $query->where('attendances.months_id', '=', $request->month);
                                    $this->filter_query['attendances.months_id'] = $request->month;
                                }
                            })
                            ->join('students', 'students.id', '=', 'attendances.link_id')
                            ->orderBy('attendances.years_id', 'asc')
                            ->orderBy('attendances.months_id', 'asc')
                            ->orderBy('attendances.link_id', 'asc')
                            ->get();
                    } else {
                        $request->session()->flash($this->message_warning, 'You are not a valid Staff for target Semester/Section.');
                    }
                } else {
                    $request->session()->flash($this->message_warning, 'Please Filter Attendance with Semester/Section.');
                }

            } else {
                $students = Attendance::select(
                    'attendances.id',
                    'attendances.attendees_type',
                    'attendances.link_id',
                    'attendances.years_id',
                    'attendances.months_id',
                    'attendances.day_1',
                    'attendances.day_2',
                    'attendances.day_3',
                    'attendances.day_4',
                    'attendances.day_5',
                    'attendances.day_6',
                    'attendances.day_7',
                    'attendances.day_8',
                    'attendances.day_9',
                    'attendances.day_10',
                    'attendances.day_11',
                    'attendances.day_12',
                    'attendances.day_13',
                    'attendances.day_14',
                    'attendances.day_15',
                    'attendances.day_16',
                    'attendances.day_17',
                    'attendances.day_18',
                    'attendances.day_19',
                    'attendances.day_20',
                    'attendances.day_21',
                    'attendances.day_22',
                    'attendances.day_23',
                    'attendances.day_24',
                    'attendances.day_25',
                    'attendances.day_26',
                    'attendances.day_27',
                    'attendances.day_28',
                    'attendances.day_29',
                    'attendances.day_30',
                    'attendances.day_31',
                    'attendances.day_32',
                    'students.id as students_id',
                    'students.reg_no',
                    'students.first_name',
                    'students.middle_name',
                    'students.last_name',
                    'students.faculty',
                    'students.semester'
                )
                    ->where('attendances.attendees_type', 1)
                    ->where(function ($query) use ($request) {

                        $this->commonStudentFilterCondition($query, $request);

                        if ($request->has('year') && $request->get('year') != 0) {
                            $query->where('attendances.years_id', '=', $request->year);
                            $this->filter_query['attendances.years_id'] = $request->year;
                        }

                        if ($request->has('month') && $request->get('month') != 0) {
                            $query->where('attendances.months_id', '=', $request->month);
                            $this->filter_query['attendances.months_id'] = $request->month;
                        }
                    })
                    ->join('students', 'students.id', '=', 'attendances.link_id')
                    ->orderBy('attendances.years_id', 'asc')
                    ->orderBy('attendances.months_id', 'asc')
                    ->orderBy('attendances.link_id', 'asc')
                    ->get();
            }
        }

        $attendanceStatus = AttendanceStatus::get();
        if (isset($students)) {
            $filteredStudent = $students->filter(function ($student, $key) use ($attendanceStatus) {
                for ($day = 1; $day <= 32; $day++) {
                    $dayCode = "day_" . $day;
                    foreach ($attendanceStatus as $attenStatus) {
                        if ($student->$dayCode == $attenStatus->id) {
                            $attenTitle = $attenStatus->title;
                            $student->$attenTitle = $student->$attenTitle + 1;
                        }
                    }
                }

                return $student;
            });

            $data['student'] = $filteredStudent;
        }


        $data['attendanceStatus'] = $attendanceStatus;
        $data['years'] = $this->activeYears();
        $data['months'] = $this->activeMonths();
        $data['faculties'] = $this->activeFaculties();
        $data['batch'] = $this->activeBatch();
        $data['academic_status'] = $this->activeStudentAcademicStatus();

        $data['url'] = URL::current();
        $data['filter_query'] = $this->filter_query;

        return view(parent::loadDataToView($this->view_path . '.index'), compact('data'));
    }

    public function add(Request $request)
    {
        $data = [];
        $data['faculties'] = $this->activeFaculties();
        $data['batch'] = $this->activeBatch();

        $data['attendance_status'] = AttendanceStatus::get();

        $data['url'] = URL::current();
        $data['filter_query'] = $this->filter_query;

        return view(parent::loadDataToView($this->view_path . '.add'), compact('data'));
    }

    public function store(Request $request)
    {
        $response = [];
        $response['error'] = true;
        $date = Carbon::parse($request->get('date'));
        $month = Carbon::createFromFormat('Y-m-d H:i:s', $date)->month;
        $day = "day_" . Carbon::createFromFormat('Y-m-d H:i:s', $date)->day;
        $yearTitle = Carbon::createFromFormat('Y-m-d H:i:s', $date)->year;
        $year = Year::where('title', $yearTitle)->first()->id;

        $attendanceStatus = AttendanceStatus::get();

        $faculty = $request->get('faculty');
        $semester = $request->get('semester_select');

        if ($request->has('students_id')) {
            foreach ($request->get('students_id') as $student) {

                $attendanceExist = Attendance::select(
                    'attendances.id',
                    'attendances.attendees_type',
                    'attendances.link_id',
                    'attendances.years_id',
                    'attendances.months_id',
                    'attendances.' . $day,
                    's.id as students_id',
                    's.reg_no',
                    's.first_name',
                    's.middle_name',
                    's.last_name',
                    's.student_image'
                )
                    ->where('attendances.attendees_type', 1)
                    ->where('attendances.years_id', $year)
                    ->where('attendances.months_id', $month)
                    ->where([['s.id', '=', $student], ['s.faculty', '=', $faculty], ['s.semester', '=', $semester]])
                    ->join('students as s', 's.id', '=', 'attendances.link_id')
                    ->first();

                /*get ledger exist student id*/

                if ($attendanceExist) {
                    /*Update Already Register Attendance Ledger*/
                    $Update = [
                        'attendees_type' => 1,
                        'link_id' => $student,
                        'years_id' => $year,
                        'months_id' => $month,
                        $day => $request->get($student),
                        'last_updated_by' => auth()->user()->id
                    ];

                    $attendanceExist->update($Update);
                } else {
                    /*Schedule When Not Scheduled Yet*/
                    Attendance::create([
                        'attendees_type' => 1,
                        'link_id' => $student,
                        'years_id' => $year,
                        'months_id' => $month,
                        $day => $request->get($student),
                        'created_by' => auth()->user()->id,
                    ]);

                }
            }


            /*confirmation*/
            if ($request->has('send_alert') && $request->get('send_alert') == 1) {
                $this->attendanceConfirm($semester, $date);
            }

            /*Absent confirmation*/
            if ($request->has('send_alert') && $request->get('send_alert') == 2) {
                $this->attendanceAbsentConfirm($semester, $date);
            }


            $request->session()->flash($this->message_success, $this->panel . ' Managed Successfully.');
            return redirect()->back();
        } else {
            $request->session()->flash($this->message_warning, 'You Have No Any Student to Managed Attendance. ');
            return back();
        }

        return redirect()->route($this->base_route);
    }

    public function delete(Request $request, $id)
    {
        if (!$row = Attendance::find($id))
            return parent::invalidRequest();

        $row->delete();

        $request->session()->flash($this->message_success, $this->panel . ' Deleted Successfully.');
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
                            $row = Attendance::find($row_id);
                            if ($row) {
                                $row->status = $request->get('bulk_action') == 'active' ? 'active' : 'in-active';
                                $row->save();
                            }
                            break;
                        case 'delete':
                            $row = Attendance::find($row_id);
                            $row->delete();
                            break;
                    }
                }

                if ($request->get('bulk_action') == 'active' || $request->get('bulk_action') == 'in-active')
                    $request->session()->flash($this->message_success, $request->get('bulk_action') . ' Action Successfully.');
                else
                    $request->session()->flash($this->message_success, 'Deleted successfully.');

                return redirect()->route($this->base_route);

            } else {
                $request->session()->flash($this->message_warning, 'Please, Check at least one row.');
                return redirect()->route($this->base_route);
            }

        } else
            return parent::invalidRequest();

    }

    public function studentHtmlRow(Request $request)
    {
        $response = [];
        $response['error'] = true;
        $date = Carbon::parse($request->get('date'));
        $month = Carbon::createFromFormat('Y-m-d H:i:s', $date)->month;
        $day = "day_" . Carbon::createFromFormat('Y-m-d H:i:s', $date)->day;
        $yearTitle = Carbon::createFromFormat('Y-m-d H:i:s', $date)->year;
        $year = Year::where('title', $yearTitle)->first()->id;

        $attendanceStatus = AttendanceStatus::get();

        $faculty = $request->get('faculty_id');
        $semester = $request->get('semester_id');
        $batch = $request->get('batch') > 0 ? $request->get('batch') : '';

        //Check semester/Sec Teacher/Staff valid or not
        if (auth()->user()->hasRole('staff')) {
            $id = auth()->user()->id;
            $staffId = auth()->user()->hook_id;
            $availableSemesterId = Semester::where('staff_id', $staffId)->pluck('id');

            /*For Student List*/
            $studentCondition = [['faculty', '=', $faculty], ['semester', '=', $semester]];

            $attendanceExist = Attendance::select(
                'attendances.attendees_type',
                'attendances.link_id',
                'attendances.years_id',
                'attendances.months_id',
                'attendances.' . $day,
                's.id as students_id',
                's.reg_no',
                's.first_name',
                's.middle_name',
                's.last_name',
                's.student_image'
            )
                ->where('attendances.attendees_type', 1)
                ->where('attendances.years_id', $year)
                ->where('attendances.months_id', $month)
                ->where($day, '<>', 0)
                ->where('s.faculty', $faculty)
                ->where('s.semester', $availableSemesterId)
                ->join('students as s', 's.id', '=', 'attendances.link_id')
                ->get();

            /*get ledger exist student id*/
            $dayStatus = array_pluck($attendanceExist, $day);
            $existStudentId = array_pluck($attendanceExist, 'students_id');

            //Get Active Student For Related Faculty and Semester
            $activeStudent = Student::select('id', 'reg_no', 'first_name', 'middle_name', 'last_name', 'student_image')
                ->where($studentCondition)
                ->whereIn('semester', $availableSemesterId)
                ->whereNotIn('id', $existStudentId)
                ->Active()
                ->orderBy('id', 'asc')
                ->get();


            if ($activeStudent->count() > 0 || $attendanceExist->count() > 0) {
                if ($attendanceExist) {
                    $response['error'] = false;

                    $response['exist'] = view($this->view_path . '.includes.student_tr_rows', [
                        'exist' => $attendanceExist,
                        'attendanceStatus' => $attendanceStatus,
                        'dayStatus' => $dayStatus,
                        'day' => $day,
                    ])->render();

                    $response['students'] = view($this->view_path . '.includes.student_tr', [
                        'students' => $activeStudent,
                        'attendanceStatus' => $attendanceStatus
                    ])->render();

                    $response['message'] = 'Active Students Found. Please, Managed Attendance.';
                } else {
                    $response['error'] = false;

                    $response['students'] = view($this->view_path . '.includes.student_tr', [
                        'students' => $activeStudent
                    ])->render();

                    $response['message'] = 'Active Students Found. Please, Managed Attendance.';
                }
            } else {
                $response['error'] = 'Student not found or you have not the right to manage attendance.';
            }

        } else {
            /*For Student List*/
            $studentCondition = $batch != '' ? [['s.faculty', '=', $faculty], ['s.semester', '=', $semester], ['s.batch', '=', $batch]] : [['s.faculty', '=', $faculty], ['s.semester', '=', $semester]];
            $attendanceExist = Attendance::select(
                'attendances.attendees_type',
                'attendances.link_id',
                'attendances.years_id',
                'attendances.months_id',
                'attendances.' . $day,
                's.id as students_id',
                's.reg_no',
                's.first_name',
                's.middle_name',
                's.last_name',
                's.student_image'
            )
                ->where('attendances.attendees_type', 1)
                ->where('attendances.years_id', $year)
                ->where('attendances.months_id', $month)
                ->where($day, '<>', 0)
                ->where($studentCondition)
                ->join('students as s', 's.id', '=', 'attendances.link_id')
                ->get();

            /*get ledger exist student id*/
            $dayStatus = array_pluck($attendanceExist, $day);
            $existStudentId = array_pluck($attendanceExist, 'students_id');

            //Get Active Student For Related Faculty and Semester
            $studentCondition = $batch != '' ? [['faculty', '=', $faculty], ['semester', '=', $semester], ['batch', '=', $batch]] : [['faculty', '=', $faculty], ['semester', '=', $semester]];
            $activeStudent = Student::select('id', 'reg_no', 'first_name', 'middle_name', 'last_name', 'student_image')
                ->where($studentCondition)
                ->whereNotIn('id', $existStudentId)
                ->Active()
                ->orderBy('id', 'asc')
                ->get();

            if ($activeStudent) {
                if ($attendanceExist) {
                    $response['error'] = false;

                    $response['exist'] = view($this->view_path . '.includes.student_tr_rows', [
                        'exist' => $attendanceExist,
                        'attendanceStatus' => $attendanceStatus,
                        'dayStatus' => $dayStatus,
                        'day' => $day,
                    ])->render();

                    $response['students'] = view($this->view_path . '.includes.student_tr', [
                        'students' => $activeStudent,
                        'attendanceStatus' => $attendanceStatus
                    ])->render();

                    $response['message'] = 'Active Students Found. Please, Managed Attendance.';
                } else {
                    $response['error'] = false;

                    $response['students'] = view($this->view_path . '.includes.student_tr', [
                        'students' => $activeStudent
                    ])->render();

                    $response['message'] = 'Active Students Found. Please, Managed Attendance.';
                }
            } else {
                $response['error'] = 'No Any Active Students in This Faculty/Semester.';
            }
        }


        return response()->json(json_encode($response));
    }

    //Send Attendance Alert on guardian mobile
    public function attendanceConfirm($semester, $date)
    {
        $month = Carbon::createFromFormat('Y-m-d H:i:s', $date)->month;
        $day = "day_" . Carbon::createFromFormat('Y-m-d H:i:s', $date)->day;
        $yearTitle = Carbon::createFromFormat('Y-m-d H:i:s', $date)->year;
        $year = Year::where('title', $yearTitle)->first()->id;


        $alert = AlertSetting::select('sms', 'email', 'subject', 'template')->where('event', '=', 'StudentAttendance')->first();
        if (!$alert)
            return back()->with($this->message_warning, "Alert Setting not Setup. Contact Admin For More Detail.");

        $sms = false;
        $email = false;

        $attendanceExist = Attendance::select(
            'attendances.id',
            'attendances.attendees_type',
            'attendances.link_id',
            'attendances.years_id',
            'attendances.months_id',
            'attendances.' . $day,
            's.id as students_id',
            's.first_name as student_name',
            'gd.guardian_first_name',
            'gd.guardian_mobile_1',
            'gd.guardian_email'
        )
            ->where('attendances.attendees_type', 1)
            ->where('attendances.years_id', $year)
            ->where('attendances.months_id', $month)
            ->where('s.semester', $semester)
            ->join('students as s', 's.id', '=', 'attendances.link_id')
            ->join('student_guardians as sg', 'sg.students_id', '=', 's.id')
            ->join('guardian_details as gd', 'gd.id', '=', 'sg.guardians_id')
            ->get();

        if ($attendanceExist && $attendanceExist->count() > 0) {
            foreach ($attendanceExist as $attendance) {
                $subject = $alert->subject;
                $Name = $attendance->student_name;
                $guardianContact = $attendance->guardian_mobile_1;
                $guardianEmail = $attendance->guardian_email;
                $message = str_replace('{{first_name}}', $Name, $alert->template);
                $message = str_replace('{{status}}', $this->getAttendanceFullStatus($attendance->$day), $message);
                $message = str_replace('{{date}}', Carbon::parse($date)->format('M d , Y'), $message);

                //Send SMS On First Mobile Number
                if ($alert->sms == 1 && isset($guardianContact)) {
                    $contactNumbers = array($guardianContact);
                    $contactNumbers = $this->contactFilter($contactNumbers);
                    $smssuccess = $this->sendSMS($contactNumbers, $message);
                    $sms = true;
                }

                if ($alert->email == 1 && isset($guardianEmail)) {
                    $emailIds = array($guardianEmail);
                    $emailIds = $this->emailFilter($emailIds);
                    $emailSuccess = $this->sendEmail($emailIds, $subject, $message);
                    $email = true;
                }

            }

        }
    }

    //absent alert on guardian mobile
    public function attendanceAbsentConfirm($semester, $date)
    {
        $month = Carbon::createFromFormat('Y-m-d H:i:s', $date)->month;
        $day = "day_" . Carbon::createFromFormat('Y-m-d H:i:s', $date)->day;
        $yearTitle = Carbon::createFromFormat('Y-m-d H:i:s', $date)->year;
        $year = Year::where('title', $yearTitle)->first()->id;


        $alert = AlertSetting::select('sms', 'email', 'subject', 'template')->where('event', '=', 'StudentAttendance')->first();
        if (!$alert)
            return back()->with($this->message_warning, "Alert Setting not Setup. Contact Admin For More Detail.");

        $sms = false;
        $email = false;

        //send on guardian mobile & email
        $attendanceExist = Attendance::select(
            'attendances.id',
            'attendances.attendees_type',
            'attendances.link_id',
            'attendances.years_id',
            'attendances.months_id',
            'attendances.' . $day,
            's.id as students_id',
            's.first_name as student_name',
            'gd.guardian_first_name',
            'gd.guardian_mobile_1',
            'gd.guardian_email'
        )
            ->where('attendances.attendees_type', 1)
            ->where('attendances.years_id', $year)
            ->where('attendances.months_id', $month)
            ->where('attendances.' . $day, 2)//2 for absent
            ->where('s.semester', $semester)
            ->join('students as s', 's.id', '=', 'attendances.link_id')
            ->join('student_guardians as sg', 'sg.students_id', '=', 's.id')
            ->join('guardian_details as gd', 'gd.id', '=', 'sg.guardians_id')
            ->get();

        if ($attendanceExist && $attendanceExist->count() > 0) {
            foreach ($attendanceExist as $attendance) {
                $subject = $alert->subject;
                $Name = $attendance->student_name;
                $guardianContact = $attendance->guardian_mobile_1;
                $guardianEmail = $attendance->guardian_email;
                $message = str_replace('{{first_name}}', $Name, $alert->template);
                $message = str_replace('{{status}}', $this->getAttendanceFullStatus($attendance->$day), $message);
                $message = str_replace('{{date}}', Carbon::parse($date)->format('M d , Y'), $message);

                //Now Send SMS On First Mobile Number

                if ($alert->sms == 1 && isset($guardianContact)) {
                    $contactNumbers = array($guardianContact);
                    $contactNumbers = $this->contactFilter($contactNumbers);
                    $smssuccess = $this->sendSMS($contactNumbers, $message);
                    $sms = true;
                }

                if ($alert->email == 1 && isset($guardianEmail)) {
                    $emailIds = array($guardianEmail);
                    $emailIds = $this->emailFilter($emailIds);
                    $emailSuccess = $this->sendEmail($emailIds, $subject, $message);
                    $email = true;
                }

            }

        }
    }

    //Send Attendance Alert on Father mobile
    /*public function attendanceConfirm($semester, $date)
    {
        $month = Carbon::createFromFormat('Y-m-d H:i:s', $date)->month;
        $day = "day_".Carbon::createFromFormat('Y-m-d H:i:s', $date)->day;
        $yearTitle = Carbon::createFromFormat('Y-m-d H:i:s', $date)->year;
        $year = Year::where('title',$yearTitle)->first()->id;


        $alert = AlertSetting::select('sms','email','subject','template')->where('event','=','StudentAttendance')->first();
        if(!$alert)
            return back()->with($this->message_warning, "Alert Setting not Setup. Contact Admin For More Detail.");

        $sms = false;
        $email = false;

        $attendanceExist = Attendance::select('attendances.id','attendances.attendees_type','attendances.link_id',
            'attendances.years_id','attendances.months_id','attendances.'.$day,
            's.id as students_id','s.first_name as student_name','pd.father_first_name','pd.father_mobile_1','pd.father_email')
            ->where('attendances.attendees_type',1)
            ->where('attendances.years_id',$year)
            ->where('attendances.months_id',$month)
            ->where('s.semester', $semester)
            ->join('students as s','s.id','=','attendances.link_id')
            ->join('parent_details as pd', 'pd.students_id','=','s.id')
            ->get();


        if($attendanceExist && $attendanceExist->count() > 0) {
            foreach ($attendanceExist as $attendance) {
                $subject = $alert->subject;
                $Name = $attendance->student_name;
                $guardianContact = $attendance->father_mobile_1;
                $guardianEmail = $attendance->father_email;
                $message = str_replace('{{first_name}}', $Name, $alert->template);
                $message = str_replace('{{status}}', $this->getAttendanceFullStatus($attendance->$day), $message);
                $message = str_replace('{{date}}', Carbon::parse($date)->format('M d , Y'), $message);

                //Send SMS On First Mobile Number
                if ($alert->sms == 1 && isset($guardianContact)) {
                    $contactNumbers = array($guardianContact);
                    $contactNumbers = $this->contactFilter($contactNumbers);
                    $smssuccess = $this->sendSMS($contactNumbers, $message);
                    $sms = true;
                }

                if ($alert->email == 1 && isset($guardianEmail)) {
                    $emailIds = array($guardianEmail);
                    $emailIds = $this->emailFilter($emailIds);
                    $emailSuccess = $this->sendEmail($emailIds, $subject, $message);
                    $email = true;
                }

            }

        }
    }

    //absent alert on father mobile
    public function attendanceAbsentConfirm($semester, $date)
    {
        $month = Carbon::createFromFormat('Y-m-d H:i:s', $date)->month;
        $day = "day_".Carbon::createFromFormat('Y-m-d H:i:s', $date)->day;
        $yearTitle = Carbon::createFromFormat('Y-m-d H:i:s', $date)->year;
        $year = Year::where('title',$yearTitle)->first()->id;


        $alert = AlertSetting::select('sms','email','subject','template')->where('event','=','StudentAttendance')->first();
        if(!$alert)
            return back()->with($this->message_warning, "Alert Setting not Setup. Contact Admin For More Detail.");

        $sms = false;
        $email = false;

       //send on father mobile & email
        $attendanceExist = Attendance::select('attendances.id','attendances.attendees_type','attendances.link_id',
            'attendances.years_id','attendances.months_id','attendances.'.$day,
            's.id as students_id','s.first_name as student_name','pd.father_first_name','pd.father_mobile_1','pd.father_email')
            ->where('attendances.attendees_type',1)
            ->where('attendances.years_id',$year)
            ->where('attendances.months_id',$month)
            ->where('attendances.'.$day,2)//2 for absent
            ->where('s.semester', $semester)
            ->join('students as s','s.id','=','attendances.link_id')
            ->join('parent_details as pd', 'pd.students_id','=','s.id')
            ->get();

        if($attendanceExist && $attendanceExist->count() > 0) {
            foreach ($attendanceExist as $attendance) {
                $subject = $alert->subject;
                $Name = $attendance->student_name;
                $guardianContact = $attendance->father_mobile_1;
                $guardianEmail = $attendance->father_email;
                $message = str_replace('{{first_name}}', $Name, $alert->template);
                $message = str_replace('{{status}}', $this->getAttendanceFullStatus($attendance->$day), $message);
                $message = str_replace('{{date}}', Carbon::parse($date)->format('M d , Y'), $message);

                //Now Send SMS On First Mobile Number
                if ($alert->sms == 1 && isset($guardianContact)) {
                    $contactNumbers = array($guardianContact);
                    $contactNumbers = $this->contactFilter($contactNumbers);
                    $smssuccess = $this->sendSMS($contactNumbers, $message);
                    $sms = true;
                }

                if ($alert->email == 1 && isset($guardianEmail)) {
                    $emailIds = array($guardianEmail);
                    $emailIds = $this->emailFilter($emailIds);
                    $emailSuccess = $this->sendEmail($emailIds, $subject, $message);
                    $email = true;
                }

            }

        }
    }*/

    public function importAttendance()
    {
        $data = [];
        return view(parent::loadDataToView($this->view_path . '.import'), compact('data'));
    }

    public function handleImport(Request $request)
    {
        \Log::info('Starting import process');

        if (!$request->hasFile('file')) {
            \Log::warning('No file uploaded');
            return back()->with($this->message_warning, 'Please upload a file.');
        }

        $file = $request->file('file');
        
        try {
            // Read CSV file contents
            $contents = file_get_contents($file->getRealPath());
            \Log::info('File contents:', ['contents' => substr($contents, 0, 500)]); // Log first 500 chars
            
            // Parse CSV data
            $csvData = array_map('str_getcsv', explode("\n", $contents));
            
            if (count($csvData) <= 1) {
                return back()->with($this->message_warning, 'CSV file is empty or contains only headers.');
            }

            // Get headers and convert to lowercase
            $headers = array_map('strtolower', array_shift($csvData));
            
            // Validate required columns
            $requiredColumns = ['reg_no', 'date', 'status'];
            foreach ($requiredColumns as $column) {
                if (!in_array($column, $headers)) {
                    return back()->with($this->message_warning, "Missing required column: {$column}");
                }
            }

            $imported = 0;
            $errors = [];

            // Get column indexes
            $reg_no_index = array_search('reg_no', $headers);
            $date_index = array_search('date', $headers);
            $status_index = array_search('status', $headers);

            // Remove empty rows
            $csvData = array_filter($csvData, function($row) {
                return !empty($row) && count($row) > 1;
            });

            foreach ($csvData as $index => $row) {
                try {
                    // Skip empty rows
                    if (empty($row[$reg_no_index]) || empty($row[$date_index]) || empty($row[$status_index])) {
                        continue;
                    }

                    $reg_no = trim($row[$reg_no_index]);
                    $date = trim($row[$date_index]);
                    $status = trim($row[$status_index]);

                    \Log::info('Processing row:', [
                        'reg_no' => $reg_no,
                        'date' => $date,
                        'status' => $status
                    ]);

                    // Find student
                    $student = Student::where('reg_no', $reg_no)->first();
                    if (!$student) {
                        $errors[] = "Row {$index}: Student with reg no {$reg_no} not found";
                        continue;
                    }

                    // Parse and validate date
                    try {
                        $parsedDate = Carbon::parse($date);
                    } catch (\Exception $e) {
                        $errors[] = "Row {$index}: Invalid date format for {$date}";
                        continue;
                    }

                    // Get or create year
                    $year = Year::firstOrCreate(
                        ['title' => $parsedDate->year],
                        ['created_by' => auth()->id()]
                    );

                    $month = $parsedDate->month;
                    $day = "day_" . $parsedDate->day;

                    // Validate status
                    if (!in_array($status, ['1', '2', '3', '4', '5'])) {
                        $errors[] = "Row {$index}: Invalid status value {$status}";
                        continue;
                    }

                    \Log::info('Attempting to create/update attendance record', [
                        'student_id' => $student->id,
                        'year_id' => $year->id,
                        'month' => $month,
                        'day' => $day,
                        'status' => $status
                    ]);

                    // Create or update attendance record
                    $attendance = Attendance::updateOrCreate(
                        [
                            'attendees_type' => 1,
                            'link_id' => $student->id,
                            'years_id' => $year->id,
                            'months_id' => $month
                        ],
                        [
                            $day => $status,
                            'created_by' => auth()->id(),
                            'last_updated_by' => auth()->id()
                        ]
                    );

                    \Log::info('Attendance record processed', [
                        'attendance_id' => $attendance->id,
                        'success' => true
                    ]);

                    $imported++;

                } catch (\Exception $e) {
                    \Log::error('Error processing row ' . $index, [
                        'error' => $e->getMessage(),
                        'trace' => $e->getTraceAsString()
                    ]);
                    $errors[] = "Row {$index}: " . $e->getMessage();
                }
            }

            $message = "Processed {$imported} attendance records.";
            if (!empty($errors)) {
                $message .= "\nErrors encountered:\n" . implode("\n", $errors);
                \Log::warning('Import completed with errors', ['errors' => $errors]);
                return back()->with($this->message_warning, $message);
            }

            return back()->with($this->message_success, $message);

        } catch (\Exception $e) {
            \Log::error('Fatal import error', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            return back()->with($this->message_danger, 'Error importing attendance: ' . $e->getMessage());
        }
    }

    public function downloadSample()
    {
        try {
            $headers = ['reg_no', 'date', 'status'];

            $rows = [
                ['REG-001', '2024-01-01', '1'],  // Present
                ['REG-001', '2024-01-02', '2'],  // Absent
                ['REG-002', '2024-01-01', '3'],  // Late
                ['REG-002', '2024-01-02', '4'],  // Leave
                ['REG-003', '2024-01-01', '5'],  // Holiday
            ];

            $callback = function () use ($headers, $rows) {
                $file = fopen('php://output', 'w');
                fputcsv($file, $headers);
                foreach ($rows as $row) {
                    fputcsv($file, $row);
                }
                fclose($file);
            };

            return response()->stream($callback, 200, [
                'Content-Type' => 'text/csv',
                'Content-Disposition' => 'attachment; filename="attendance_sample.csv"',
            ]);
        } catch (\Exception $e) {
            \Log::error('Sample Download Error: ' . $e->getMessage());
            return back()->with($this->message_danger, 'Error generating sample file: ' . $e->getMessage());
        }
    }

}
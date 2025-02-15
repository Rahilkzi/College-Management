<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Student extends BaseModel
{
    protected $fillable = ['created_by', 'last_updated_by', 'reg_no', 'reg_date', 'university_reg','faculty','semester','batch',
        'academic_status', 'first_name', 'middle_name', 'last_name', 'devnagari_first_name', 'devnagari_middle_name', 'devnagari_last_name',
         'date_of_birth', 'gender', 'blood_group', 'adhar_no', 'nationality','religion', 'caste','mother_tongue', 'email', 'extra_info', 'student_image','student_signature','status', 'serial_no',
         'first_name_dev',
         'middle_name_dev', 
         'last_name_dev'];

    public function address()
    {
        return $this->hasOne(Addressinfo::class,'students_id', 'id');
    }

    public function parents()
    {
        return $this->hasOne(ParentDetail::class, 'students_id', 'id');
    }

    public function guardian()
    {
        return $this->hasOne(StudentGuardian::class, 'students_id', 'id');
    }

   /* public function guardian()
    {
        return $this->belongsTo(StudentGuardian::class);
    }*/

    public function academicInfo()
    {
        return $this->hasMany(AcademicInfo::class, 'students_id', 'id');
    }


    public function studentNotes()
    {
        return $this->hasMany(Note::class,'member_id','id')->where('member_type','=','student');
    }

    public function documents()
    {
        return $this->hasMany(Document::class, 'member_id')
                    ->where('member_type', 'student');
    }


    public function feeMaster()
    {
        return $this->hasMany(FeeMaster::class, 'students_id', 'id');
    }

    public function feeCollect()
    {
        return $this->hasMany(FeeCollection::class, 'students_id', 'id');
    }


    public function markLedger()
    {
        return $this->hasMany(ExamMarkLedger::class, 'students_id', 'id');
    }



    //Regular Attendance
    public function regularAttendance()
    {
        return $this->hasMany(Attendance::class,'link_id','id')->where('attendees_type','=',1);
    }

    //Regular Attendance
    public function subjectAttendance()
    {
        return $this->hasMany(SubjectAttendance::class,'link_id','id');
    }


    //certificates
    public function certificateHistory()
    {
        return $this->hasMany(CertificateHistory::class, 'students_id', 'id');
    }

    public function attendanceCertificate()
    {
        return $this->hasOne(AttendanceCertificate::class, 'students_id', 'id');
    }

    public function transferCertificate()
    {
        return $this->hasOne(TransferCertificate::class, 'students_id', 'id');
    }

    public function characterCertificate()
    {
        return $this->hasOne(CharacterCertificate::class, 'students_id', 'id');
    }

    public function bonafideCertificate()
    {
        return $this->hasOne(BonafideCertificate::class, 'students_id', 'id');
    }

    public function courseCompletionCertificate()
    {
        return $this->hasOne(CourseCompletionCertificate::class, 'students_id', 'id');
    }

}

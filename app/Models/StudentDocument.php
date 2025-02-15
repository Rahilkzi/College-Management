<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentDocument extends Model
{
    protected $fillable = ['student_id', 'title', 'file', 'status'];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }
} 
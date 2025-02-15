<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentDocumentsTable extends Migration
{
    public function up()
    {
        Schema::create('student_documents', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('student_id');
            $table->string('title');
            $table->string('file');
            $table->enum('status', ['active', 'inactive'])->default('active');
            $table->timestamps();

            $table->foreign('student_id')
                  ->references('id')
                  ->on('students')
                  ->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('student_documents');
    }
} 
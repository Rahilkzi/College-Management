<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ModifyGuardianConstraints extends Migration
{
    public function up()
    {
        // First drop existing foreign keys
        Schema::table('student_guardians', function (Blueprint $table) {
            $table->dropForeign(['students_id']);
            $table->dropForeign(['guardians_id']);
        });

        // Add back with cascade delete
        Schema::table('student_guardians', function (Blueprint $table) {
            $table->foreign('students_id')
                  ->references('id')
                  ->on('students')
                  ->onDelete('cascade');
                  
            $table->foreign('guardians_id')
                  ->references('id')
                  ->on('guardian_details')
                  ->onDelete('cascade');
        });

        // Modify guardian_details table if needed
        Schema::table('guardian_details', function (Blueprint $table) {
            $table->dropForeign(['students_id']);
            $table->foreign('students_id')
                  ->references('id')
                  ->on('students')
                  ->onDelete('cascade');
        });
    }

    public function down()
    {
        // Restore original constraints if needed to rollback
        Schema::table('student_guardians', function (Blueprint $table) {
            $table->dropForeign(['students_id']);
            $table->dropForeign(['guardians_id']);
            
            $table->foreign('students_id')
                  ->references('id')
                  ->on('students');
                  
            $table->foreign('guardians_id')
                  ->references('id')
                  ->on('guardian_details');
        });

        Schema::table('guardian_details', function (Blueprint $table) {
            $table->dropForeign(['students_id']);
            $table->foreign('students_id')
                  ->references('id')
                  ->on('students');
        });
    }
} 
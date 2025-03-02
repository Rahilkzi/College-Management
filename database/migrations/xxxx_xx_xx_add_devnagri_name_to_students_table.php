    <?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDevnagriNameToStudentsTable extends Migration
{
    public function up()
    {
        Schema::table('students', function (Blueprint $table) {
            $table->string('first_name_dev')->nullable()->after('first_name');
            $table->string('middle_name_dev')->nullable()->after('middle_name');
            $table->string('last_name_dev')->nullable()->after('last_name');
        });
    }

    public function down()
    {
        Schema::table('students', function (Blueprint $table) {
            $table->dropColumn(['first_name_dev', 'middle_name_dev', 'last_name_dev']);
        });
    }
} 
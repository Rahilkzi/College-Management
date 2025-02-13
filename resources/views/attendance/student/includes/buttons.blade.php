<div class="clearfix hidden-print ">
    <div class=" ">
        <a class="{!! request()->is('attendance/student') ? 'btn-success' : 'btn-primary' !!}  btn-sm"  href="{{ route('attendance.student') }}"><i class="fa fa-list" aria-hidden="true"></i>&nbsp;Attendance Detail</a>
        <a class="{!! request()->is('attendance/student/add') ? 'btn-success' : 'btn-primary' !!}  btn-sm" href="{{ route('attendance.student.add') }}"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add / Edit {{ $panel }}</a>
        <a class="{!! request()->is('attendance/student/import') ? 'btn-success' : 'btn-primary' !!} btn-sm" href="{{ route('attendance.student.import') }}"><i class="fa fa-upload" aria-hidden="true"></i>&nbsp;Import Attendance</a>
    </div>
</div>
<hr class="hr-6">
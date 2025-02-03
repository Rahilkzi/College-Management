<div class="row">
    <div class="col-md-2">
        <a href="{{ route('student') }}" class="easy-link-menu">
            <div class="dash-card card-softred text-xs-center">
                <div class="card-block">
                    <h4 class="card-title">
                        {{ $data['academic_status_count']->sum('total') }}
                    </h4>
                    <p class="card-text"><i class="ace-icon fa fa-users"></i> Students</p>
                </div>
            </div>
        </a>
    </div>

    <div class="col-md-2">
        <a href="{{ route('staff') }}" class="easy-link-menu">
            <div class="dash-card card-sky text-xs-center">
                <div class="card-block">
                    <h4 class="card-title">
                        {{ $data['staff_status']->sum('total') }}
                    </h4>
                    <p class="card-text"><i class="ace-icon fa fa-user-secret"></i> Staff</p>
                </div>
            </div>
        </a>
    </div>



    <div class="col-md-2">
        <a href="{{ route('exam.schedule') }}" class="easy-link-menu">
            <div class="dash-card card-yellow text-xs-center">
                <div class="card-block">
                    <h4 class="card-title">
                        {{ $data['exams_status'] }}
                    </h4>
                    <p class="card-text"><i class="ace-icon fa fa-line-chart"></i> Exams</p>
                </div>
            </div>
        </a>
    </div>



</div>



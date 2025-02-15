@extends('layouts.master')

@section('css')
    <!-- page specific plugin styles -->

@endsection

@section('content')

    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                @include('layouts.includes.template_setting')

                <div class="page-header">
                    <h1>
                        @include($view_path . '.registration.includes.breadcrumb-primary')
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            Registration
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12 ">
                    @include($view_path . '.includes.buttons')
                    <!-- PAGE CONTENT BEGINS -->
                        @include('includes.validation_error_messages')
                        <div class="align-right">
                        <a class="{!! request()->is('student/import*') ? 'btn-success' : 'btn-primary' !!} btn-sm" href="{{ route('student.import') }}"><i class="fa fa-upload" aria-hidden="true"></i>&nbsp;Bulk Student Registration</a>
                        </div>
                        {!! Form::open([
    'route' => $base_route . '.register',
    'method' => 'POST',
    'class' => 'form-horizontal',
    'id' => 'validation-form',
    "enctype" => "multipart/form-data"
]) !!}

                        @include($view_path . '.registration.includes.form')

                        <div class="clearfix form-actions">
                            <div class="col-md-12 align-right">
                                <button class="btn" type="reset">
                                    <i class="fa fa-undo bigger-110"></i>
                                    Reset
                                </button>

                                <button class="btn btn-primary" type="submit" value="Save" name="add_student" id="add-student">
                                    <i class="fa fa-save bigger-110"></i>
                                    Save
                                </button>

                                <button class="btn btn-success" type="submit" value="Save" name="add_student_another" id="add-student-another">
                                    <i class="fa fa-save bigger-110"></i>
                                    <i class="fa fa-plus bigger-110"></i>
                                    Save And Add Another
                                </button>
                            </div>
                        </div>

                        <div class="hr hr-24"></div>

                        {!! Form::close() !!}

                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->


@endsection

@section('js')
    <!-- page specific plugin scripts -->

    @include('includes.scripts.jquery_validation_scripts')
    @include('student.registration.includes.student-comman-script')
    @include('includes.scripts.inputMask_script')
    @include('includes.scripts.datepicker_script')
    <script>
        function convertToDevanagari(input, outputId) {
            let text = input.value.trim();
            if (text.length === 0) {
                document.getElementById(outputId).value = "";
                return;
            }

            fetch(`https://inputtools.google.com/request?text=${encodeURIComponent(text)}&itc=hi-t-i0-und&num=1`)
                .then(response => response.json())
                .then(data => {
                    if (data[0] === 'SUCCESS' && data[1][0] && data[1][0][1][0]) {
                        document.getElementById(outputId).value = data[1][0][1][0];
                    }
                })
                .catch(error => console.error("Error in transliteration:", error));
        }
    </script>

@endsection


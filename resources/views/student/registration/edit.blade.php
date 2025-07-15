@extends('layouts.master')
@section('css')
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="{{ asset('assets/css/select2.min.css') }}" />
@endsection
@section('content')
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
               
                <div class="page-header">
                    <h1>
                        @include($view_path . '.registration.includes.breadcrumb-primary')
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            Edit  Registration
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12 ">
                    @include($view_path . '.includes.buttons')
                    @include('includes.flash_messages')
                    <!-- PAGE CONTENT BEGINS -->
                    @include('includes.validation_error_messages')
                        <div class="align-right hidden-print">
                            <a class="btn-primary btn-sm" href="{{ route($base_route . '.view', ['id' => $data['row']->id]) }}"  >
                                <i class="ace-icon fa fa-eye"></i> View Student Profile
                            </a>
                        </div>
                        {!! Form::model($data['row'], [
    'route' => [$base_route . '.update', $data['row']->id],
    'method' => 'POST',
    'class' => 'form-horizontal',
    'id' => 'validation-form',
    "enctype" => "multipart/form-data"
]) !!}
                        {!! Form::hidden('id', $data['row']->id) !!}
                        {{--{!! Form::hidden('guardians_id', $data['row']->guardians_id) !!}--}}
                        @include($view_path . '.registration.includes.form')
                        <div class="clearfix form-actions">
                            <div class="col-md-12 align-right">
                                <button class="btn btn-info" type="submit">
                                    <i class="fa fa-save bigger-110"></i>
                Update
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



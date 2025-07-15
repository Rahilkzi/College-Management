@extends('layouts.master')

@section('css')
    <!-- page specific plugin styles -->
@endsection

@section('content')
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
               
                <div class="page-header">
                    <h1>
                        @include($view_path.'.includes.breadcrumb-primary')
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            Import Attendance
                        </small>
                    </h1>
                </div>

                <div class="row">
                    @include('attendance.includes.buttons')
                    <div class="col-xs-12">
                        @include($view_path.'.includes.buttons')
                        @include('includes.flash_messages')
                        
                        <div class="widget-box transparent">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="alert alert-info">
                                                <i class="ace-icon fa fa-hand-o-right"></i> Please, 
                                                <a href="{{ route('attendance.student.import-sample') }}" target="_blank" class="btn btn-primary btn-minier">
                                                    <i class="ace-icon fa fa-download"></i> Download Sample
                                                </a> File and Prepare Attendance Data Accordingly.
                                            </div>
                                        </div>

                                        {!! Form::open([
                                            'route' => $base_route.'.import', 
                                            'method' => 'POST', 
                                            'class' => 'form-horizontal',
                                            'id' => 'validation-form', 
                                            'enctype' => 'multipart/form-data'
                                        ]) !!}

                                        <div class="form-group">
                                            {!! Form::label('file', 'File', ['class' => 'col-sm-2 control-label']) !!}
                                            <div class="col-sm-4">
                                                {!! Form::file('file', null, ["class" => "form-control border-form", "required"]) !!}
                                                @include('includes.form_fields_validation_message', ['name' => 'file'])
                                            </div>
                                        </div>

                                        <div class="clearfix form-actions">
                                            <div class="col-md-12 align-right">
                                                <button class="btn btn-info" type="submit">
                                                    <i class="fa fa-upload"></i>
                                                    Import
                                                </button>
                                            </div>
                                        </div>

                                        {!! Form::close() !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('js')
    @include('includes.scripts.jquery_validation_scripts')
@endsection 
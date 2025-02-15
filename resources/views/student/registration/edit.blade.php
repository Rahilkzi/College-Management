@extends('layouts.master')
@section('css')
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="{{ asset('assets/css/select2.min.css') }}" />
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
                            Edit Registration
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
                            <a class="btn-primary btn-sm"
                                href="{{ route($base_route . '.view', ['id' => $data['row']->id]) }}">
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

    <script>
        $(document).ready(function () {
                $('.select2').select2({
                    placeholder: "Select Document Type",
                    allowClear: true
                });
            });

            function addDocumentField() {
                let wrapper = document.getElementById('document-wrapper1');
                let html = `
                        <div class="col-xs-12 col-sm-8">
                        <div class="document-form-group">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Document Type</label>
                                            <div class="col-sm-9">
                                                <select name="title[]" class="form-control select2" required>
                                                    <option value="">Select Document Type</option>
                                                    <optgroup label="Academic Documents">
                                                        <option value="marksheet_10">10th Marksheet</option>
                                                        <option value="marksheet_12">12th Marksheet</option>
                                                        <option value="transfer_certificate">Transfer Certificate</option>
                                                    </optgroup>
                                                    <optgroup label="Personal Documents">
                                                        <option value="birth_certificate">Birth Certificate</option>
                                                        <option value="medical_certificate">Medical Certificate</option>
                                                        <option value="nationality_certificate">Nationality Certificate</option>
                                                    </optgroup>
                                                    <optgroup label="Other Certificates">
                                                        <option value="bonafide_certificate">Bonafide Certificate</option>
                                                        <option value="character_certificate">Character Certificate</option>
                                                        <option value="migration_certificate">Migration Certificate</option>
                                                        <option value="gap_certificate">Gap Certificate</option>
                                                    </optgroup>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Upload File</label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="ace-icon fa fa-upload"></i>
                                                    </span>
                                                    <input type="file" name="document_file[]" class="form-control file-upload" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-3 col-sm-offset-9">
                                                <button type="button" class="btn btn-danger btn-sm" onclick="removeDocumentField(this)">
                                                    <i class="fa fa-trash"></i> Remove
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                    `;
                wrapper.insertAdjacentHTML('beforeend', html);

                // Reinitialize select2 for new fields
                $('.select2').select2({
                    placeholder: "Select Document Type",
                    allowClear: true
                });
            }

            function removeDocumentField(button) {
                button.closest('.document-form-group').remove();
            }

            function deleteDocument(documentId) {
                if (confirm('Are you sure you want to delete this document?')) {
                    $.ajax({
                        url: '/student/document/' + documentId,
                        type: 'DELETE',
                        data: {
                            _token: '{{ csrf_token() }}'
                        },
                        success: function (response) {
                            if (response.success) {
                                location.reload();
                            } else {
                                alert('Failed to delete document');
                            }
                        },
                        error: function () {
                            alert('An error occurred while deleting the document');
                        }
                    });
                }
            }
        </script>
@endsection
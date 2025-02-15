<div class="widget-box transparent">
    <div class="widget-header">
        <h4 class="widget-title lighter">
            <i class="ace-icon fa fa-file-o blue"></i>
            Required Documents
        </h4>
        <div class="widget-toolbar">
            <a href="#" data-action="collapse">
                <i class="ace-icon fa fa-chevron-up"></i>
            </a>
        </div>
    </div>

    <div class="widget-body">
        <div class="widget-main">
            <!-- Document Upload Form -->
            <div id="document-wrapper1">
                <div class="row">
                    <div class="col-xs-12 col-sm-8">
                        <div class="form-group">
                            {!! Form::label('document_type', 'Document Type', ['class' => 'col-sm-3 control-label no-padding-right']) !!}
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

                        <div class="space-4"></div>

                        <div class="form-group">
                            {!! Form::label('document_file', 'Upload File', ['class' => 'col-sm-3 control-label no-padding-right']) !!}
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="ace-icon fa fa-upload"></i>
                                    </span>
                                    {!! Form::file('document_file[]', ["class" => "form-control file-upload", "required"]) !!}
                                </div>
                                <span class="help-block">
                                    <i class="ace-icon fa fa-info-circle"></i>
                                    Allowed: PDF, JPG, JPEG, PNG | Max: 2MB
                                </span>
                            </div>
                        </div>

                        <div class="space-4"></div>

                    </div>
                </div>
            </div>
            <div class="form-group">

                <div class="col-sm-9">
                    <button type="button" class="btn btn-sm btn-primary" onclick="addDocumentField()">
                        <i class="ace-icon fa fa-plus"></i> Add More Document
                    </button>
                </div>
            </div>

            <!-- Uploaded Documents Table -->
            <div id="document-wrapper">
                @if (isset($data['row']) && $data['row']->documents->count() > 0)
                    <div class="row">
                        <div class="col-xs-12">
                            <hr>
                            <h4 class="header smaller lighter blue">
                                <i class="ace-icon fa fa-folder-open"></i> Uploaded Documents
                            </h4>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th width="5%">S.N.</th>
                                            <th>Document Type</th>
                                            <th width="20%">Upload Date</th>
                                            <th width="25%">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($data['row']->documents as $key => $document)
                                            <tr>
                                                <td>{{ $key + 1 }}</td>
                                                <td>
                                                    <i class="ace-icon fa fa-file-pdf-o red"></i>
                                                    {{ str_replace('_', ' ', ucwords($document->title)) }}
                                                </td>
                                                <td>{{ \Carbon\Carbon::parse($document->created_at)->format('d-M-Y') }}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <a href="{{ asset('documents/student/' . $document->file) }}"
                                                            class="btn btn-primary btn-sm" target="_blank">
                                                            <i class="ace-icon fa fa-download"></i> Download
                                                        </a>
                                                        <button type="button" class="btn btn-danger btn-sm"
                                                            onclick="deleteDocument({{ $document->id }})">
                                                            <i class="ace-icon fa fa-trash"></i> Delete
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>

@push('css')
    <style>
        .select2 {
            width: 100% !important;
        }

        .file-upload {
            padding: 6px 12px;
            height: 34px;
        }

        .btn-group {
            display: flex;
            gap: 5px;
        }

        .alert ul li {
            margin-bottom: 5px;
        }

        .widget-box {
            border: 1px solid #DDD;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .table>thead>tr>th {
            background-color: #f5f5f5;
            border-bottom: 2px solid #ddd;
        }
    </style>
@endpush
<!-- 
@push('js')
<script>
$(document).ready(function() {
    $('.select2').select2({
        placeholder: "Select Document Type",
        allowClear: true
    });
});

function addDocumentField() {
    let wrapper = document.getElementById('document-wrapper');
    let html = `
        <div class="form-group document-form-group">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="panel panel-default">
                    <div class="panel-body">
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

// ... rest of your existing JS functions ...
</script>
@endpush -->
<div class="form-group">
    {!! Form::label('student_search', 'Search Student', ['class' => 'col-sm-4 control-label']) !!}
    <div class="col-sm-8">
        <input type="text" id="student_search" class="form-control border-form" placeholder="Search by student name">
        <div id="search_results"
            style="display:none; position: absolute; z-index: 1000; background: white; width: 100%; border: 1px solid #ddd; max-height: 200px; overflow-y: auto;">
        </div>
    </div>
</div>

<div class="form-group">
    {!! Form::label('reg_no', 'Reg. No.', ['class' => 'col-sm-4 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::text('reg_no', null, ["placeholder" => "", "class" => "form-control border-form input-mask-registration", "required", "readonly" => "readonly"]) !!}
        @include('includes.form_fields_validation_message', ['name' => 'reg_no'])
    </div>
</div>


<!-- <div class="form-group">
    {!! Form::label('reg_no', 'Reg. No.', ['class' => 'col-sm-4 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::text('reg_no', null, ["placeholder" => "", "class" => "form-control border-form input-mask-registration", "required"]) !!}
        @include('includes.form_fields_validation_message', ['name' => 'reg_no'])
    </div>
</div> -->

<div class="form-group">
    {!! Form::label('title', 'Title', ['class' => 'col-sm-4 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::text('title', null, ["placeholder" => "", "class" => "form-control border-form", "required"]) !!}
        @include('includes.form_fields_validation_message', ['name' => 'title'])
    </div>
</div>

<div class="form-group">
    {!! Form::label('document_file', 'Select File', ['class' => 'col-sm-4 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::file('document_file', null, ["placeholder" => "", "class" => "form-control border-form", "required"]) !!}
        @include('includes.form_fields_validation_message', ['name' => 'document_file'])
    </div>
</div>

@if (isset($data['row']))

    <div class="space-4"></div>

    <div class="form-group">
        {!! Form::label('old_file', 'Old File', ['class' => 'col-sm-4 control-label']) !!}
        <div class="col-sm-8">
            @if ($data['row']->file)
                <a href="{{ asset($folder_name . DIRECTORY_SEPARATOR . 'student' . DIRECTORY_SEPARATOR . ViewHelper::getStudentById($data['row']->member_id) . DIRECTORY_SEPARATOR . $data['row']->file) }}" target="_blank">
                    <i class="ace-icon fa fa-download bigger-120"></i> &nbsp;{{ $data['row']->title }}
                </a>
            @else
                <p>No File.</p>
            @endif
        </div>
    </div>

@endif

<div class="form-group">
    {!! Form::label('description', 'Description', ['class' => 'col-sm-4 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::textarea('description', null, ["placeholder" => "", "class" => "form-control border-form", "rows" => "2"]) !!}
        @include('includes.form_fields_validation_message', ['name' => 'description'])
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>
    $(document).ready(function () {
        $('#student_search').on('input', function () {
            let query = $(this).val();
      
            if (query.length > 2) { // Only search when at least 3 characters are entered
                $.ajax({
                    url: '/College/public/student/search-by-name?name=' + query,
                    type: 'GET',
                    success: function (data) {
                        let results = $('#search_results');
                        results.empty();

                        if (data.length > 0) {
                            data.forEach(function (student) {
                                results.append(
                                    `<div class="search-result-item" 
                                    data-regno="${student.reg_no}"
                                    style="padding: 5px; cursor: pointer; border-bottom: 1px solid #eee;">
                                    ${student.first_name} ${student.middle_name} ${student.last_name} (${student.reg_no})
                                </div>`
                                );
                            });
                            results.show();
                        } else {
                            results.hide();
                        }
                    }
                });
            } else {
                $('#search_results').hide();
            }
        });

        // Handle click on search result
        $(document).on('click', '.search-result-item', function () {
            let regNo = $(this).data('regno');
            $('input[name="reg_no"]').val(regNo);
            $('#search_results').hide();
            $('#student_search').val(''); // Clear the search field
        });

        // Hide results when clicking elsewhere
        $(document).click(function (e) {
            if (!$(e.target).closest('#student_search, #search_results').length) {
                $('#search_results').hide();
            }
        });
    });
</script>
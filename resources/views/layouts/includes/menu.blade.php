<div id="sidebar" class="sidebar h-sidebar navbar-collapse collapse ace-save-state hidden-print">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>

    <ul class="nav nav-list">
        {{-- Dashboard --}}
        <li class="{!! request()->is('/')?'active':'' !!}">
            <a href="{{ route('home') }}" >
                <i class="menu-icon fa fa-tachometer"></i>
                <span class="menu-text"> Dashboard </span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
        </li>

    

        {{-- Staff & Student --}}
        @ability('super-admin','student-staff')
            @if( isset($generalSetting) && $generalSetting->student_staff ==1)
                <li class="{!! request()->is('student*')||request()->is('staff*')?'active open':'' !!}  hover">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-users" aria-hidden="true"></i>
                    <span class="menu-text"> Student&Staff</span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="{!! request()->is('student*')?'active open':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Student
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('student')?'active':'' !!} hover">
                                <a href="{{ route('student') }}" accesskey="S">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Student Detail
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('student/registration')?'active':'' !!} hover">
                                <a href="{{ route('student.registration') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Registration
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('student/import')?'active':'' !!} hover">
                                <a href="{{ route('student.import') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Bulk Import
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('student/transfer')?'active':'' !!} hover">
                                <a href="{{ route('student.transfer') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Transfer Student
                                </a>

                                <b class="arrow"></b>
                            </li>
                            <li class="{!! request()->is('student/document')?'active':'' !!} hover">
                                <a href="{{ route('student.document') }}"  accesskey="U">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Document Upload
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('student/note')?'active':'' !!} hover">
                                <a href="{{ route('student.note') }}">
                                    <i class="menu-icon fa fa-caret-right"  accesskey="N"></i>
                                    Create Notes
                                </a>
                                <b class="arrow"></b>
                            </li>
                            <li class="{!! request()->is('report/student*')?'active':'' !!} hover">
                                <a href="{{ route('report.student') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Student Complete Records
                                </a>

                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>

                    <li class="{!! request()->is('guardian*')?'active open':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Guardian
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('guardian')?'active':'' !!} hover">
                                <a href="{{ route('guardian') }}" accesskey="S">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Guardian Detail
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('guardian/registration')?'active':'' !!} hover">
                                <a href="{{ route('guardian.registration') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Registration
                                </a>

                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>

                    <li class="{!! request()->is('staff*')?'active open':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Staff
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('staff')?'active':'' !!}  hover">
                                <a href="{{ route('staff') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Staff Detail
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('staff/add')?'active':'' !!}  hover">
                                <a href="{{ route('staff.add') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Registration
                                </a>

                                <b class="arrow"></b>
                            </li>
                            <li class="{!! request()->is('staff/import')?'active':'' !!} hover">
                                <a href="{{ route('staff.import') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Bulk Import
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('staff/document')?'active':'' !!} hover">
                                <a href="{{ route('staff.document') }}"  accesskey="U">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Document Upload
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('staff/note')?'active':'' !!} hover">
                                <a href="{{ route('staff.note') }}">
                                    <i class="menu-icon fa fa-caret-right"  accesskey="N"></i>
                                    Create Notes
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('staff/designation')?'active':'' !!} hover">
                                <a href="{{ route('staff.designation') }}">
                                    <i class="menu-icon fa fa-caret-right"  accesskey="N"></i>
                                    Designations
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('report/staff*')?'active':'' !!} hover">
                                <a href="{{ route('report.staff') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Staff Complete Records
                                </a>

                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            @endif
        @endability

        {{-- Account --}}
        @ability('super-admin','account')
            @if( isset($generalSetting) && $generalSetting->account ==1)
                <li class="{!! request()->is('account/*')?'active open':'' !!}  hover">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-calculator" aria-hidden="true"></i>
                    <span class="menu-text"> Account</span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="{!! request()->is('account/fees*')?'active open':'' !!} hover">
                            <a href="#" class="dropdown-toggle">
                                <i class="menu-icon fa fa-caret-right"></i>
                                <i class="fa fa-calculator"></i>  Fees Collection
                                <b class="arrow fa fa-angle-r"></b>
                            </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('account/fees')?'active':'' !!}  hover">
                                <a href="{{ route('account.fees') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Receive Detail
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/fees/quick-receive')?'active':'' !!}  hover">
                                <a href="{{ route('account.fees.quick-receive') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Quick Receive
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/fees/collection')?'active':'' !!} hover">
                                <a href="{{ route('account.fees.collection') }}" accesskey="R">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Collect Fees
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/fees/balance')?'active':'' !!}  hover">
                                <a href="{{ route('account.fees.balance') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Balance Fees Report
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/fees/master/add')?'active':'' !!} hover">
                                <a href="{{ route('account.fees.master.add') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Add Fees
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/fees/online-payment')?'active':'' !!} hover">
                                <a href="{{ route('account.fees.online-payment') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Online Payments
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/fees/head')?'active':'' !!}  hover">
                                <a href="{{ route('account.fees.head') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Fees Head
                                </a>
                                <b class="arrow"></b>
                            </li>

                            </ul>
                    </li>

                    <li class="{!! request()->is('account.transaction*')?'active open':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            <i class="fa fa-newspaper-o"></i> Ledger & Transaction
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('account/transaction/add')?'active':'' !!} hover">
                                <a href="{{ route('account.transaction.add') }}">
                                    <i class="menu-icon fa fa-plus"></i>
                                    Transaction
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/transaction/multi-add')?'active':'' !!} hover">
                                <a href="{{ route('account.transaction.multi-add') }}">
                                    <i class="menu-icon fa fa-plus"></i>
                                    Multi Transaction
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/transaction')?'active':'' !!} hover">
                                <a href="{{ route('account.transaction') }}" accesskey="R">
                                    <i class="menu-icon fa fa-list"></i>
                                    Transaction Detail
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/transfer')?'active':'' !!} hover">
                                <a href="{{ route('account.transfer') }}">
                                    <i class="menu-icon fa fa-exchange"></i>
                                    Acc to Acc Transfer
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/transaction-head')?'active':'' !!} hover">
                                <a href="{{ route('account.transaction-head') }}">
                                    <i class="menu-icon fa fa-newspaper-o"></i>
                                    Ledger/Account
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/transaction/account-group')?'active':'' !!} hover">
                                <a href="{{ route('account.transaction.account-group') }}">
                                    <i class="menu-icon fa fa-newspaper-o"></i>
                                    Account Groups
                                </a>
                                <b class="arrow"></b>
                            </li>
                            <li class="{!! request()->is('account/transaction/account-group/chart-of-account')?'active':'' !!} hover">
                                <a href="{{ route('account.transaction.account-group.chart-of-account') }}">
                                    <i class="menu-icon fa fa-newspaper-o"></i>
                                    Charts of Account
                                </a>
                                <b class="arrow"></b>
                            </li>

                        </ul>
                    </li>

                    <li class="{!! request()->is('account/bank*')?'active open':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            <i class="fa fa-bank"></i> Separate Banking
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('account/bank')?'active':'' !!} hover">
                                <a href="{{ route('account.bank') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Manage Bank Accounts
                                </a>
                            </li>
                            <li class="{!! request()->is('account/bank/add')?'active':'' !!} hover">
                                <a href="{{ route('account.bank.add') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Add New Bank
                                </a>
                            </li>

                            <li class="{!! request()->is('account/bank-transaction')?'active':'' !!} hover">
                                <a href="{{ route('account.bank-transaction') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Transaction Detail
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/bank-transaction/add')?'active':'' !!} hover">
                                <a href="{{ route('account.bank-transaction.add') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    New Transaction
                                </a>

                                <b class="arrow"></b>
                            </li>

                        </ul>
                    </li>

                    <li class="{!! request()->is('account/payroll*')?'active open':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            <i class="fa fa-user-secret"></i>  Payroll
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('account/payroll')?'active':'' !!}  hover">
                                <a href="{{ route('account.payroll') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Paid Detail
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/salary/payment')?'active':'' !!} hover">
                                <a href="{{ route('account.salary.payment') }}" accesskey="R">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Salary Pay
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/payroll/master*')?'active':'' !!} hover">
                                <a href="{{ route('account.payroll.master.add') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Add Payroll
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/payroll/balance')?'active':'' !!}  hover">
                                <a href="{{ route('account.payroll.balance') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Balance Salary Report
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('account/payroll/head')?'active':'' !!}  hover">
                                <a href="{{ route('account.payroll.head') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Salary Head
                                </a>

                                <b class="arrow"></b>
                            </li>

                        </ul>
                    </li>

                    <li class="{!! request()->is('account/report*')?'active open':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            <i class="fa fa-print"></i> Account Report
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('account/report/cash-book*')?'active':'' !!} hover">
                                <a href="{{ route('account.report.cash-book') }}">
                                    <i class="menu-icon fa fa-rupee"></i>
                                    Cash Book
                                </a>
                            </li>

                            <li class="{!! request()->is('account/report/fee-collection')?'active':'' !!} hover">
                                <a href="{{ route('account.report.fee-collection') }}">
                                    <i class="menu-icon fa fa-calculator"></i>
                                    Fee Collection
                                </a>
                            </li>

                            <li class="{!! request()->is('account/report/fee-online-payment')?'active':'' !!} hover">
                                <a href="{{ route('account.report.fee-online-payment') }}">
                                    <i class="menu-icon fa fa-globe"></i>
                                    Online Payments
                                </a>
                            </li>

                            <li class="{!! request()->is('account/report/fee-collection-head*')?'active':'' !!} hover">
                                <a href="{{ route('account.report.fee-collection-head') }}">
                                    <i class="menu-icon fa fa-calculator"></i>
                                    Fee Collection Head
                                </a>
                            </li>

                            <li class="{!! request()->is('account/report/balance-fee*')?'active':'' !!} hover">
                                <a href="{{ route('account.report.balance-fee') }}">
                                    <i class="menu-icon fa fa-calculator"></i>
                                    Fee Balance
                                </a>
                            </li>

                            <li class="{!! request()->is('account/transaction-head/view*')?'active':'' !!} hover">
                                <a href="{{ route('account.transaction-head.view') }}">
                                    <i class="menu-icon fa fa-newspaper-o"></i>
                                    Statement of Ledger
                                </a>
                            </li>
                            <li class="{!! request()->is('account/transaction-head/balance-statement*')?'active':'' !!} hover">
                                <a href="{{ route('account.transaction-head.balance-statement') }}" accesskey="B">
                                    <i class="menu-icon fa fa-newspaper-o"></i>
                                    Ledger Balance
                                </a>
                            </li>

                            <li class="{!! request()->is('account/transaction/account-group/chart-of-account')?'active':'' !!} hover">
                                <a href="{{ route('account.transaction.account-group.chart-of-account') }}">
                                    <i class="menu-icon fa fa-newspaper-o"></i>
                                    Charts of Account
                                </a>
                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>

                </ul>
            </li>
            @endif
        @endability

    
   
        @ability('super-admin','examination')
            @if( isset($generalSetting) && $generalSetting->exam == 1)
                <li class="{!! request()->is('exam*')?'active':'' !!} hover">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-line-chart"  aria-hidden="true"></i>
                    <span class="menu-text"> Exam</span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="{!! request()->is('exam/schedule*')?'active':'' !!} hover">
                        <a href="{{ route('exam.schedule') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Schedule Exam
                        </a>
                        <b class="arrow"></b>
                    </li>

                    <li class="{!! request()->is('exam/mark-ledger')?'active':'' !!}  hover">
                        <a href="{{ route('exam.mark-ledger') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Mark Ledger
                        </a>
                        <b class="arrow"></b>
                    </li>

                    <li class="{!! request()->is('exam')?'active':'' !!} hover">
                        <a href="{{ route('exam') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Exams Head
                        </a>
                        <b class="arrow"></b>
                    </li>

                    <li class="{!! request()->is('exam/admit-card*')?'active':'' !!} hover">
                        <a href="{{ route('exam.admit-card') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Admit Card
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="{!! request()->is('exam/routine*')?'active':'' !!} hover">
                        <a href="{{ route('exam.routine') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Routine/Schedule
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="{!! request()->is('exam/mark-sheet*')?'active':'' !!} hover">
                        <a href="{{ route('exam.mark-sheet') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Grade/Mark/Ledger Sheet
                        </a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
            @endif
        @endability

        {{-- Examination --}}
        @ability('super-admin','certificate')
            @if( isset($generalSetting) && $generalSetting->certificate ==1)
                <li class="{!! request()->is('certificate*')?'active':'' !!} hover">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-certificate"  aria-hidden="true"></i>
                    <span class="menu-text"> Certificate</span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="{!! request()->is('certificate/issue')?'active':'' !!} hover">
                        <a href="{{ route('certificate.issue') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Issue Certificate
                        </a>
                        <b class="arrow"></b>
                    </li>

                  

                    <li class="{!! request()->is('certificate/transfer*')?'active':'' !!} hover">
                        <a href="{{ route('certificate.transfer') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Transfer Certificate
                        </a>
                        <b class="arrow"></b>
                    </li>

                    <li class="{!! request()->is('certificate/character*')?'active':'' !!} hover">
                        <a href="{{ route('certificate.character') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Character Certificate
                        </a>
                        <b class="arrow"></b>
                    </li>

                    <li class="{!! request()->is('certificate/bonafide*')?'active':'' !!} hover">
                        <a href="{{ route('certificate.bonafide') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Bonafide Certificate
                        </a>
                        <b class="arrow"></b>
                    </li>

                    <li class="{!! request()->is('certificate/course-completion*')?'active':'' !!} hover">
                        <a href="{{ route('certificate.course-completion') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Course Completion Cer.
                        </a>
                        <b class="arrow"></b>
                    </li>

                    <li class="{!! request()->is('certificate/issue-history*')?'active':'' !!} hover">
                        <a href="{{ route('certificate.issue-history') }}">
                            <i class="menu-icon fa fa-history"></i>
                            Issue History
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="{!! request()->is('certificate/generate*')?'active':'' !!} hover">
                        <a href="{{ route('certificate.generate') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Custom Print
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="{!! request()->is('certificate/template*')?'active':'' !!} hover">
                        <a href="{{ route('certificate.template') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Certificate Template
                        </a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
            @endif
        @endability

    

      
        {{-- More --}}
       {{-- @ability('super-admin',download')
            <li class="hover">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon  fa fa-th-list" aria-hidden="true"></i>
                    <span class="menu-text"> More </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>
                <b class="arrow"></b>
                <ul class="submenu">
                 

                    @ability('super-admin','download')
                        @if( isset($generalSetting) && $generalSetting->upload_download ==1)
                            <li class="{!! request()->is('download*')?'active':'' !!} hover">
                            <a href="{{ route('download') }}">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Upload & Download
                                <b class="arrow fa fa-angle-r"></b>
                            </a>
                        </li>
                        @endif
                    @endability

                </ul>
            </li>
        @endability--}}

    

        @ability('super-admin','download')
        @if( isset($generalSetting) && $generalSetting->upload_download ==1)
            <li class="{!! request()->is('download*')?'active':'' !!} hover">
                <a href="{{ route('download') }}">
                    <i class="menu-icon fa fa-download"></i>
                    Download
                    <b class="arrow fa fa-angle-r"></b>
                </a>
            </li>
        @endif
        @endability




        {{-- Reports --}}
        @ability('super-admin','report')
        {{--<li class="{!! request()->is('report*')?'active':'' !!} hover">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-bar-chart"  aria-hidden="true"></i>
                <span class="menu-text"> Report Links</span>

                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <li class="{!! request()->is('report/student*')?'active':'' !!} hover">
                    <a href="{{ route('report.student') }}">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Student Detail
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="{!! request()->is('report/staff*')?'active':'' !!} hover">
                    <a href="{{ route('report.staff') }}">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Staff Detail
                    </a>

                    <b class="arrow"></b>
                </li>
                @ability('super-admin','fees-index')
                <li class="{!! request()->is('account/fees')?'active':'' !!} hover">
                    <a href="{{ route('account.fees') }}">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Fees Statement
                    </a>
                    <b class="arrow"></b>
                </li>
                @endability

                @ability('super-admin','fees-balance')
                <li class="{!! request()->is('account/fees/balance')?'active':'' !!} hover">
                    <a href="{{ route('account.fees.balance') }}">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Balance Fees
                    </a>
                    <b class="arrow"></b>
                </li>
                @endability

                @ability('super-admin','payroll-balance')
                <li class="{!! request()->is('account/payroll/balance')?'active':'' !!} hover">
                    <a href="{{ route('account.payroll.balance') }}">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Balance Salary
                    </a>
                    <b class="arrow"></b>
                </li>
                @endability

                @ability('super-admin','transaction-head-index')
                <li class="{!! request()->is('account/transaction-head')?'active':'' !!} hover">
                    <a href="{{ route('account.transaction-head') }}">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Ledger
                    </a>
                    <b class="arrow"></b>
                </li>
                @endability

                @ability('super-admin','transaction-index')
                <li class="{!! request()->is('account/transaction')?'active':'' !!} hover">
                    <a href="{{ route('account.transaction') }}">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Transactions
                    </a>
                    <b class="arrow"></b>
                </li>
                @endability

                @ability('super-admin','bank-index')
                <li class="{!! request()->is('account/bank')?'active':'' !!} hover">
                    <a href="{{ route('account.bank') }}">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Bank Statement
                    </a>
                    <b class="arrow"></b>
                </li>
                @endability

             


            
          

        
            </ul>
        </li>--}}
        @endability

        {{-- Info Center --}}
        @ability('super-admin','alert-center')
            @if( isset($generalSetting) && $generalSetting->alert ==1)
                <li class="{!! request()->is('info*')?'active':'' !!} hover">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-bullhorn" aria-hidden="true"></i>
                    <span class="menu-text"> Alert </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>
                <b class="arrow"></b>
                <ul class="submenu">
                    <li class="{!! request()->is('info/notice*')?'active':'' !!} hover">
                        <a href="{{ route('info.notice') }}" accesskey="L">
                            <i class="menu-icon fa fa-caret-right"></i>
                            User Notice
                        </a>

                        <b class="arrow"></b>
                    </li>
                    <li class="{!! request()->is('info/smsemail*')?'active':'' !!} hover">
                        <a href="{{ route('info.smsemail') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            SMS / E-mail
                        </a>

                        <b class="arrow"></b>
                    </li>

                </ul>
            </li>
            @endif
        @endability

        {{-- Academic --}}
        @ability('super-admin','academic')
            @if( isset($generalSetting) && $generalSetting->academic ==1)
                <li class="hover">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon  fa fa-graduation-cap" aria-hidden="true"></i>
                    <span class="menu-text"> Academics </span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="{!! request()->is('faculty*') || request()->is('semester*')?'active':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Academic Level
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('faculty*')?'active':'' !!} hover">
                                <a href="{{ route('faculty') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Faculty/Level/Class
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('semester*')?'active':'' !!} hover">
                                <a href="{{ route('semester') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Semester/Section
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('student-batch*')?'active':'' !!} hover">
                                <a href="{{ route('student-batch') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Batch
                                </a>
                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>
                    <li class="{!! request()->is('grading*') || request()->is('subject*')?'active':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Grading/Subject
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('grading*')?'active':'' !!} hover">
                                <a href="{{ route('grading') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Grading
                                </a>
                                <b class="arrow"></b>
                            </li>

                            <li class="{!! request()->is('subject*')?'active':'' !!} hover">
                                <a href="{{ route('subject') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Course / Subject
                                </a>
                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>

                    <li class="{!! request()->is('*status')?'active':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Status Setting
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('student-status*')?'active':'' !!} hover">
                                <a href="{{ route('student-status') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Student Status
                                </a>

                                <b class="arrow"></b>
                            </li>

                         

                           
                            <li class="{!! request()->is('customer-status*')?'active':'' !!} hover">
                                <a href="{{ route('customer-status') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Customer Status
                                </a>

                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>


                    <li class="{!! request()->is('year*') || request()->is('month*')?'active':'' !!} hover">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Year & Month
                            <b class="arrow fa fa-angle-r"></b>
                        </a>
                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="{!! request()->is('year*')?'active':'' !!} hover">
                                <a href="{{ route('year') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Year
                                </a>

                                <b class="arrow"></b>
                            </li>
                            <li class="{!! request()->is('month*')?'active':'' !!} hover">
                                <a href="{{ route('month') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Month
                                </a>

                                <b class="arrow"></b>
                            </li>
                            <li class="{!! request()->is('day*')?'active':'' !!} hover">
                                <a href="{{ route('day') }}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Day
                                </a>

                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>
                    <li class="{!! request()->is('payment-method*')?'active':'' !!} hover">
                        <a href="{{ route('payment-method') }}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Payment Methods
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
            @endif
        @endability

        {{-- Help --}}
        @ability('super-admin','help')
            @if( isset($generalSetting) && $generalSetting->help ==1)
                <li class="hover">
                <a href="#" target="_blank" class="dropdown-toggle">
                    <i class="menu-icon  fa fa-question" aria-hidden="true"></i>
                    <span class="menu-text"> Help </span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="hover">
                        <a href="http://unlimitededufirm.com/demo-detail" target="_blank">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Test Demo
                        </a>
                    </li>
                    <li class="hover">
                        <a href="https://www.youtube.com/watch?v=2jgA9WY8IzQ&list=PLCtD_CGPAQJ2zSk5cDUkkfWGdtMGsF9n0" target="_blank">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Video Tutorial
                        </a>
                    </li>
                    <li class="hover">
                        <a href="http://docs.unlimitededufirm.com" target="_blank">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Documentation
                        </a>
                    </li>
                    <li class="hover">
                        <a href="https://codecanyon.net/item/unlimited-edu-firm-school-college-information-management-system/21850988" target="_blank">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Buy New License
                        </a>
                    </li>
                </ul>
            </li>
            @endif
        @endability
    </ul><!-- /.nav-list -->
</div>

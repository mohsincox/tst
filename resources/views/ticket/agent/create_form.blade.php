@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-sm-offset-0">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title text-center"><i class="fa fa-pencil"></i> Create Form of <code><b>Ticket</b></code> </h3>
                </div>
                <div class="panel-body">
                    {!! Form::open(['url' => 'ticket/agent/ticket-store', 'method' => 'post', 'class' => 'form-horizontal', 'id' => 'ticketForm', 'enctype' => 'multipart/form-data']) !!}

                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="required form-group {{ $errors->has('phone_number') ? 'has-error' : ''}}">
                                {!! Form::label('phone_number', 'Phone Number', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::text('phone_number', null, ['class' => 'form-control', 'placeholder' => 'Enter Customer Phone Number', 'autocomplete' => 'off', 'onkeypress' => 'return event.charCode >= 48 && event.charCode <= 57']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('phone_number') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group {{ $errors->has('featured_mp3') ? 'has-error' : ''}}">
                                {!! Form::label('featured_mp3', 'mp3 File', ['class' => 'col-sm-3 control-label']) !!}
                                <div class="col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                    {!! Form::file('featured_mp3', ['class' => 'form-control', 'placeholder' => 'Featured mp3', 'autocomplete' => 'off']) !!}
                                    <span class="help-block text-danger">
                                        {{ $errors->first('featured_mp3') }}
                                    </span>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="required form-group {{ $errors->has('subject') ? 'has-error' : ''}}">
                                {!! Form::label('subject', 'Subject', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::select('subject', $subjectList, null, ['class' => 'form-control','placeholder' => 'Select Subject', 'id' => 'subject']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('subject') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-6">
                            <div class="required form-group {{ $errors->has('customer_name') ? 'has-error' : ''}}">
                                {!! Form::label('customer_name', 'Customer Name', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::text('customer_name', null, ['class' => 'form-control', 'placeholder' => 'Enter Customer Name', 'autocomplete' => 'off']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('customer_name') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="required form-group {{ $errors->has('district_id') ? 'has-error' : ''}}">
                                {!! Form::label('district_id', 'Select District', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::select('district_id', $districtList, null, ['class' => 'form-control js-example-basic-single', 'placeholder' => 'Select Customer District']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('district_id') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div id="hide_ps" class="form-group {{ $errors->has('police_station_id') ? 'has-error' : ''}}">
                                {!! Form::label('police_station_id', 'Select Police Station', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::select('police_station_id', [], null, ['class' => 'form-control','placeholder' => 'Select Customer Police Station', 'id' => 'police_station_id']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('police_station_id') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <span id="district_ps_show"></span>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="required form-group {{ $errors->has('customer_address') ? 'has-error' : ''}}">
                                {!! Form::label('customer_address', 'Customer Address', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::text('customer_address', null, ['class' => 'form-control', 'placeholder' => 'Enter Customer Address', 'autocomplete' => 'off']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('customer_address') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="required form-group {{ $errors->has('product_name_with_model') ? 'has-error' : ''}}">
                                {!! Form::label('product_name_with_model', 'Product Name With Model', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::text('product_name_with_model', null, ['class' => 'form-control', 'placeholder' => 'Enter Product Name With Model', 'autocomplete' => 'off']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('product_name_with_model') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        
                        <div class="col-xs-12 col-sm-6">
                            <div class="required form-group {{ $errors->has('ticket_type_id') ? 'has-error' : ''}}">
                                {!! Form::label('ticket_type_id', 'Ticket Type', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::select('ticket_type_id', $ticketTypeList, null, ['class' => 'form-control','placeholder' => 'Select Ticket Type', 'id' => 'ticket_type_id']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('ticket_type_id') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="required form-group {{ $errors->has('assigned_id') ? 'has-error' : ''}}">
                                {!! Form::label('assigned_id', 'Assign, Mail & SMS To (PIC)', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12"><span id="type_to_assign_show">
                                        {!! Form::select('assigned_id', [], null, ['class' => 'form-control','placeholder' => 'Select Assign To', 'id' => 'assigned_id']) !!}</span>
                                        <span class="text-danger">
                                            {{ $errors->first('assigned_id') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        
                        <div class="col-xs-12 col-sm-6" style="pointer-events: none;">
                        <!-- <div class="col-xs-12 col-sm-6"> -->
                            <div class="required form-group {{ $errors->has('cc_to') ? 'has-error' : ''}}">
                                {!! Form::label('cc_to', 'CC To', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12"><span id="type_to_cc_show">
                                        {!! Form::select('cc_to[]', [], null, ['class' => 'form-control js-example-basic-multiple', 'id' => 'cc_to', 'multiple' => 'multiple']) !!}</span>
                                        <!-- {!! Form::select('cc_to[]', $userList, [8, 9], ['class' => 'form-control js-example-basic-multiple', 'id' => 'cc_to', 'multiple' => 'multiple']) !!}</span> -->
                                        <span class="text-danger">
                                            {{ $errors->first('cc_to') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="required form-group {{ $errors->has('call_type') ? 'has-error' : ''}}">
                                {!! Form::label('call_type', 'Call Type', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::select('call_type', $callTypeList, null, ['class' => 'form-control','placeholder' => 'Select Call Type', 'id' => 'call_type']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('call_type') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group required {{ $errors->has('invoice_no') ? 'has-error' : ''}}">
                                {!! Form::label('invoice_no', 'Invoice No', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::text('invoice_no', null, ['class' => 'form-control', 'placeholder' => 'Enter Invoice No', 'autocomplete' => 'off']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('invoice_no') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group required {{ $errors->has('job_no') ? 'has-error' : ''}}">
                                {!! Form::label('job_no', 'Job No', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::text('job_no', null, ['class' => 'form-control', 'placeholder' => 'Enter Job No', 'autocomplete' => 'off']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('job_no') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group required {{ $errors->has('warranty_or_paid') ? 'has-error' : ''}}">
                                {!! Form::label('warranty_or_paid', 'Warranty or Paid', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::select('warranty_or_paid', $warrantyOrPaidList, null, ['class' => 'form-control','placeholder' => 'Select Warranty or Paid', 'id' => 'warranty_or_paid']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('warranty_or_paid') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group required {{ $errors->has('tp_or_engineer_name') ? 'has-error' : ''}}">
                                {!! Form::label('tp_or_engineer_name', 'TP or Engineer Name', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
                                <div class="col-xs-9 col-sm-9">
                                    <div class="col-xs-12 col-sm-12">
                                        {!! Form::text('tp_or_engineer_name', null, ['class' => 'form-control', 'placeholder' => 'Enter TP or Engineer Name', 'autocomplete' => 'off']) !!}
                                        <span class="text-danger">
                                            {{ $errors->first('tp_or_engineer_name') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="required form-group {{ $errors->has('verbatim_or_issue') ? 'has-error' : ''}}">
                            {!! Form::label('verbatim_or_issue', 'Verbatim or Issue', ['class' => 'col-xs-2 col-sm-2 control-label']) !!}
                            <div class="col-xs-10 col-sm-10">
                                <div class="col-xs-12 col-sm-12">
                                    {!! Form::textarea('verbatim_or_issue', null, ['class' => 'form-control', 'placeholder' => 'Enter Verbatim or Issue', 'autocomplete' => 'off', 'rows' => 3]) !!}
                                    <span class="text-danger">
                                        {{ $errors->first('verbatim_or_issue') }}
                                    </span>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-12">
                            {!! Form::button('Submit', ['class' => 'btn btn-primary btn-block', 'data-toggle' => 'modal', 'data-target' => '#myModal']) !!}
                        </div>
                    </div>
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog"> 
                            <div class="modal-content">
                                <div class="modal-header bg-primary">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Confirmation Message</h4>
                                </div>
                                <div class="modal-body">
                                    <h3 class="text-center">Want to <b>create a Ticket</b>?</h3>
                                </div>
                                <div class="modal-footer bg-success">   
                                    {!! Form::submit('YES', ['class' => 'btn btn-primary btn-block submitBtnTicket']) !!}
                                </div>
                            </div>      
                        </div>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>  
</div>  
@endsection

@section('style')
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
@stop

@section('script')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#district_id").change(function(){
                var districtId = $("#district_id").val();
                var url = '{{ url("/ticket/agent/district-ps-show")}}';
                $.get(url+'?district_id='+districtId, function (data) {  
                    $("#hide_ps").hide();
                    $('#district_ps_show').html(data);
                    $('.js-example-basic-single').select2();
                });
            });
        });

        $(document).ready(function() {
            $('.js-example-basic-single').select2();
            $('.js-example-basic-multiple').select2();
        });

        // $(document).ready(function(){
        //     $("#ticket_type_id").change(function(){
        //         var ticketTypeId = $("#ticket_type_id").val();
        //         //alert('ttttt');
        //         var url = '{{ url("/ticket/agent/type-to-assign")}}';
        //         $.get(url+'?ticket_type_id='+ticketTypeId, function (data) {  
        //             $('#type_to_assign_show').html(data);
        //         });
        //     });
        // });

         $(document).ready(function(){
            $("#ticket_type_id").change(function(){
                var ticketTypeId = $("#ticket_type_id").val();
                //alert('ttttt');
                var url = '{{ url("/ticket/agent/type-to-assign")}}';
                $.get(url+'?ticket_type_id='+ticketTypeId, function (data) {  
                    $('#type_to_assign_show').html(data);
                });

                var url2 = '{{ url("/ticket/agent/type-to-cc")}}';
                $.get(url2+'?ticket_type_id='+ticketTypeId, function (data) {  
                    $('#type_to_cc_show').html(data);
                    $('.js-example-basic-multiple').select2();
                });
            });
        });

        $(document).ready(function () {
            $("#ticketForm").submit(function () {
                $(".submitBtnTicket").attr("disabled", true);
                return true;
            });
        });
    </script>
@append
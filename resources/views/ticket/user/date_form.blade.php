@extends('layouts.app')

@section('content')
<div class="container" style="height: 500px;">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <h3>
                <i class="fa fa-list-ul"></i>
                <mark>Ticket</mark> Show In Date Range for own  Ticket
            </h3>
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title text-center"><i class="fa fa-list-ul"></i> Date Wise <code><b>Ticket Show</b></code> Form for own  Ticket</h3>
                </div>
                <div class="panel-body">

                    <h3>Ticket List Show for own  Ticket</h3>
                    <hr>
                    <div class="row">
                        <div class="col-sm-12">
                            {!! Form::open([
                                    'url'         => 'ticket/user/ticket',
                                    'method'      => 'get',
                                    'role'        => 'form',
                                    'id'          => 'report-form',
                                    'class'       => 'form-horizontal'
                                ])
                            !!}

                            <div class="required form-group{{ $errors->has('start_date') ? ' has-error' : '' }}">
                                {!! Form::label('start_date', 'Start Date', ['class' => 'col-sm-3 col-sm-offset-0 control-label']) !!}
                                <div class="col-sm-7">
                                    {!! Form::text('start_date', null, ['class' => 'form-control', 'id' => 'start_date', 'autocomplete' => 'off']) !!}
                                    <span class="help-block text-danger">
                                        {!! $errors->first('start_date') !!}
                                    </span>
                                </div>
                            </div>

                            <div class="required form-group{{ $errors->has('end_date') ? ' has-error' : '' }}">
                                {!! Form::label('end_date', 'End Date', ['class' => 'col-sm-3 col-sm-offset-0 control-label']) !!}
                                <div class="col-sm-7">
                                    {!! Form::text('end_date', null, ['class' => 'form-control', 'id' => 'end_date', 'autocomplete' => 'off']) !!}
                                    <span class="help-block text-danger">
                                        {!! $errors->first('end_date') !!}
                                    </span>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-7 text-center">
                                    {!! Form::submit('Submit',['class'=>'btn btn-primary btn-block']) !!}
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
@endsection

@section('style')
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.2/themes/mint-choc/jquery-ui.css">
    <style type="text/css">
        .ui-datepicker-month{ color: black; }
        .ui-datepicker-year{ color: black; }
    </style>
@endsection


@section('script')
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#start_date" ).datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", maxDate: +0 });
            $( "#start_date" ).datepicker( "setDate", "0" );
            $( "#end_date" ).datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", maxDate: +0 });
            $( "#end_date" ).datepicker( "setDate", "0" );
        } );
     </script>
@endsection

@extends('layouts.app')

@section('content')
<div class="container" style="height: 500px;">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-sm-offset-2">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title text-center"><i class="fa fa-pencil"></i> Enter <code><b> Customer Mobile Number</b></code> to get <code><b> invoice</b></code> information</h3>
                </div>
                <div class="panel-body">
                    {!! Form::open(['url' => 'invoice-api/show', 'method' => 'post', 'class' => 'form-horizontal']) !!}

                    <div class="required form-group {{ $errors->has('mobileNo') ? 'has-error' : ''}}">
                        {!! Form::label('mobileNo', 'Customer Mobile Number', ['class' => 'col-xs-3 col-sm-4 control-label']) !!}
                        <div class="col-xs-9 col-sm-8">
                            <div class="col-xs-12 col-sm-12">
                                {!! Form::text('mobileNo', null, ['class' => 'form-control', 'placeholder' => 'Enter Mobile Number', 'autocomplete' => 'off', 'onkeypress' => 'return event.charCode >= 48 && event.charCode <= 57', 'required' => 'required']) !!}
                                <span class="text-danger">
                                    {{ $errors->first('mobileNo') }}
                                </span>
                            </div>
                        </div>
                    </div>
                    <p class="text-center">Test Example: 01676260176</p>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-12">
                            {!! Form::submit('Submit', ['class' => 'btn btn-primary btn-block']) !!}
                        </div>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>  
</div>  
@endsection
@extends('layouts.app')

@section('content')
<div class="container" style="height: 500px;">
	<div class="row">
		<div class="col-xs-12 col-sm-8 col-sm-offset-2">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title text-center"><i class="fa fa-send-o"></i> Send SMS to <code><b>Customer</b></code></h3>
				</div>
				<div class="panel-body">
					<!-- <center><h4>Customer Phone No: <b>{{ '$ticket->phone_number' }}</b> Customer Name: <b>{{ '$ticket->customer_name' }}</b></h4></center> -->
					{!! Form::open(['url' => 'sms-send', 'method' => 'post', 'class' => 'form-horizontal']) !!}
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
					<div class="required form-group {{ $errors->has('message') ? 'has-error' : ''}}">
					    {!! Form::label('message', 'Message', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
					    <div class="col-xs-9 col-sm-9">
					    	<div class="col-xs-12 col-sm-12">
						        {!! Form::textarea('message', null, ['class' => 'form-control', 'placeholder' => 'Enter Message', 'autocomplete' => 'off', 'rows' => 2]) !!}
						        <span class="text-danger">
								    {{ $errors->first('message') }}
							    </span>
							</div>
					    </div>
					</div>
					<p><b>Pending Template:</b> Dear Sir/Ma'am, Your complain has been generated. Ref. no: . For any query please call 16212.</p>
					<p><b>Closed Template:</b> Dear Sir/Ma'am, Your complain (Ref. no: ) has been resolved. For any query please call 16212.</p>
					<div class="form-group">
					    <div class="col-xs-12 col-sm-12">
					        {!! Form::button('Submit', ['class' => 'btn btn-success btn-block', 'data-toggle' => 'modal', 'data-target' => '#myModal']) !!}
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
                                    <h3 class="text-center">Want to <b>send SMS</b>?</h3>
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

@section('script')
	<script type="text/javascript">
		$(document).ready(function () {
            $("#ticketForm").submit(function () {
                $(".submitBtnTicket").attr("disabled", true);
                return true;
            });
        });
	</script>
@endsection
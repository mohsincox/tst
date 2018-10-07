@extends('layouts.app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-8 col-sm-offset-2">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title text-center"><i class="fa fa-pencil"></i> Edit Form of <code><b>Ticket</b></code> for Agents</h3>
				</div>
				<div class="panel-body">
					<center><h4>Customer Phone No: <b>{{ $ticket->phone_number }}</b> Customer Name: <b>{{ $ticket->customer_name }}</b></h4></center>
					{!! Form::model($ticket, ['url' => "ticket/agent/ticket/$ticket->id", 'method' => 'put', 'class' => 'form-horizontal', 'id' => 'ticketForm']) !!}
					<div class="required form-group {{ $errors->has('ticket_status_id') ? 'has-error' : ''}}">
					    {!! Form::label('ticket_status_id', 'Ticket Status', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
					    <div class="col-xs-9 col-sm-9">
					        <div class="col-xs-12 col-sm-12">
					            {!! Form::select('ticket_status_id', $ticketStatusList, null, ['class' => 'form-control','placeholder' => 'Select Ticket Status', 'id' => 'ticket_status_id']) !!}
					            <span class="text-danger">
					                {{ $errors->first('ticket_status_id') }}
					            </span>
					        </div>
					    </div>
					</div>
					<div class="required form-group {{ $errors->has('verbatim_or_issue') ? 'has-error' : ''}}">
					    {!! Form::label('verbatim_or_issue', 'Verbatim or Issue', ['class' => 'col-xs-3 col-sm-3 control-label']) !!}
					    <div class="col-xs-9 col-sm-9">
					    	<div class="col-xs-12 col-sm-12">
						        {!! Form::textarea('verbatim_or_issue', null, ['class' => 'form-control', 'placeholder' => 'Enter Verbatim or Issue', 'autocomplete' => 'off', 'rows' => 2]) !!}
						        <span class="text-danger">
								    {{ $errors->first('verbatim_or_issue') }}
							    </span>
							</div>
					    </div>
					</div>
					<div class="form-group">
					    <div class="col-xs-12 col-sm-12">
					        {!! Form::submit('Submit', ['class' => 'btn btn-primary btn-block submitBtnTicket']) !!}
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
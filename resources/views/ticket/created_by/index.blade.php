@extends('layouts.app')

@section('content')
<div class="container-fluid">
	<div class="row">
	    <div class="col-sm-12">
	        <h3 style="margin-top: 0px;">
	            <i class="fa fa-list-ul"></i>
	            List of <mark>Tickets</mark> created by <code><b>{{ Auth::user()->name }}</b></code>
	            @can('agent-access')
		            <a href="{{ url('ticket/agent/ticket-create-form') }}" class="btn btn-primary pull-right">
		                <i class="fa fa-plus"></i> Create <code><b>Ticket</b></code>
		            </a>
				@endcan
	        </h3>
	        <div class="panel panel-info">
	            <div class="panel-heading">
	                <h3 class="panel-title text-center"><i class="fa fa-list-ul"></i> List of <code><b>Tickets</b></code> created by <code><b>{{ Auth::user()->name }}</b></code></h3>
	            </div>
	            <div class="panel-body">
	            	<div class="table-responsive">
		                <table id="myTable" class="table table-bordered table-striped table-hover">
		                    <thead>
		                        <tr class="success">
		                            <th>SL</th>
		                            <th>ID</th>
		                            <th>PIC</th>
		                            <th>Subject</th>
		                            <th>Ticket Type</th>
		                            <th>Ticket Status</th>
		                            <th>Call Type</th>
		                            <th>Cus. Name</th>
		                            <th>Phone No</th>
		                            <th>Invoice No</th>
		                            <th>Job No</th>
		                            <th>CreatedBy</th>
		                            <th>CreatedAt</th>
		                            @can('agent-access')
		                            	<th>Edit</th>
		                            @endcan
		                            <th>Details</th>
		                            <th>View</th>
		                            <th>Cus. Address</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    <?php
		                        $i = 0;
		                    ?>
		                    @foreach($tickets as $ticket)
		                        <tr>
		                            <td>{{ ++$i }}</td>
		                            <td>{{ $ticket->id }}</td>
		                            <td>{{ $ticket->assigned->name }}</td>
		                            <td>{{ $ticket->subject }}</td>
		                            <td>{{ $ticket->ticketType->name }}</td>
		                            <td>{{ $ticket->ticketStatus->name }}</td>
		                            <td>{{ $ticket->call_type }}</td>
		                            <td>{{ $ticket->customer_name }}</td>
		                            <td>{{ $ticket->phone_number }}</td>
		                            <td>{{ $ticket->invoice_no }}</td>
		                            <td>{{ $ticket->job_no }}</td>
		                            <td>{{ $ticket->createdBy->name }}</td>
		                            <td>{{ $ticket->created_at }}</td>
		                            @can('agent-access')
		                            	<td>{!! Html::link("ticket/agent/ticket/$ticket->id/edit",' Edit', ['class' => 'fa fa-edit btn btn-primary btn-xs']) !!}</td>
		                            @endcan
		                            <td>{!! Html::link("ticket/agent/ticket-details/$ticket->id",' Details', ['class' => 'fa fa-eye btn btn-danger btn-xs']) !!}</td>
		                            <td>{!! Html::link("ticket/agent/ticket/$ticket->id",' View', ['class' => 'fa fa-eye btn btn-info btn-xs']) !!}</td>
		                            <td>{{ $ticket->customer_address }}</td>
		                        </tr>
		                    @endforeach
		                    </tbody>
		                </table>
		            </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>
@endsection

@section('script')
<script type="text/javascript">
    $(document).ready(function(){
        $('#myTable').DataTable();
    });
</script>
@endsection
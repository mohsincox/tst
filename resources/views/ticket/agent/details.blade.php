@extends('layouts.app')

@section('content')
<div class="container" style="height: 500px;">
	<div class="row">
	    <div class="col-sm-12">
	        <!-- <h3 style="margin-top: 0px;">
	            <i class="fa fa-list-ul"></i>
	            List of <mark>Ticket Details</mark> for Agents
	            @can('agent-access') -->
		            <!-- <a href="{{ url('ticket/agent/ticket-create-phone-number') }}" class="btn btn-primary pull-right">
		                <i class="fa fa-plus"></i> Create <code><b>Ticket</b></code>
		            </a> -->
				<!-- @endcan
	        </h3> -->
	        <div class="panel panel-info">
	            <div class="panel-heading">
	                <h3 class="panel-title text-center"><i class="fa fa-list-ul"></i> List of <code><b>Ticket Details</b></code> for Agents</h3>
	            </div>
	            <div class="panel-body">
	            	<div class="table-responsive">
		                <table id="myTable" class="table table-bordered table-striped table-hover">
		                    <thead>
		                        <tr class="success">
		                            <th>SL</th>
		                            <th>Ticket ID</th>
		                            <th>Ticket Status</th>
		                            <th>Verbatim or Issue</th>
		                            <th>CreatedBy</th>
		                            <th>CreatedAt</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    <?php
		                        $i = 0;
		                    ?>
		                    @foreach($ticketDetails as $detail)
		                        <tr>
		                            <td>{{ ++$i }}</td>
		                            <td>{{ $detail->ticket_id }}</td>
		                            <td>{{ $detail->ticketStatus->name }}</td>
		                            <td>{{ $detail->verbatim_or_issue }}</td>
		                            <td>{{ $detail->createdBy->name }}</td>
		                            <td>{{ $detail->created_at }}</td>
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
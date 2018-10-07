@extends('layouts.app')

@section('content')
<div class="container">
	<div class="row">
	    <div class="col-sm-12">
	        <h3 style="margin-top: 0px;">
	            <i class="fa fa-list-ul"></i>
	            List of <mark>Sent SMS & Mobile No.</mark>
	            @can('user-access')
		            <a href="{{ url('sms-send/create') }}" class="btn btn-primary pull-right">
		                <i class="fa fa-plus"></i> Create <code><b>SMS to send</b></code>
		            </a>
				@endcan
	        </h3>
	        <div class="panel panel-info">
	            <div class="panel-heading">
	                <h3 class="panel-title text-center"><i class="fa fa-list-ul"></i> List of <code><b>Sent SMS & Mobile No.</b></code></h3>
	            </div>
	            <div class="panel-body">
	            	<div class="table-responsive">
		                <table id="myTable" class="table table-bordered table-striped table-hover">
		                    <thead>
		                        <tr class="success">
		                            <th>SL</th>
		                            <th>Mobile No</th>
		                            <th>Message</th>
		                            <th>CreatedBy</th>
		                            <th>CreatedAt</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    <?php
		                        $i = 0;
		                    ?>
		                    @foreach($messages as $sms)
		                        <tr>
		                            <td>{{ ++$i }}</td>
		                            <td>{{ $sms->phone_number }}</td>
		                            <td>{{ $sms->message }}</td>
		         					<td>{{ $sms->createdBy->name }}</td>
		         					<td>{{ $sms->created_at }}</td>
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
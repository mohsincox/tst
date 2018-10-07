@extends('layouts.app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-12 col-md-offset-0">
			<div class="panel panel-primary">
				<div class="panel-heading">User, Role, Department or Ticket Status</div>

				<div class="panel-body">
					<div class="table-responsive">
						<table id="myTable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr class="success">
									<th>SL</th>
									<th>Name</th>
									<th>Email</th>
									<th>Role</th>
									<th>Department or Ticket Status</th>
									<th>Phone Number</th>
									<th>Address</th>
									@can('ticket_admin-access')
										<th>Edit</th>
	                    			@endcan
								</tr>
							</thead>
							<tbody>
							@foreach($users as $user)
								<?php
									if ($user->role == 'super_admin') {
										$role = "Super Admin";
									} else if ($user->role == 'ticket_admin') {
										$role = "Ticket Admin";
									} else if ($user->role == 'agent') {
										$role = "Agent";
									}else {
										$role = "User";
									}
								?>	
								<tr>
									<td>{{ $user->id }}</td>
									<td>{{ $user->name }}</td>
									<td>{{ $user->email }}</td>
									<td>{{ $role }}</td>
									@if(isset($user->ticketType->name))
										<td>{{ $user->ticketType->name }}</td>
									@else
										<td></td>
									@endif
									<td>{{ $user->phone_number }}</td>
									<td>{{ $user->address }}</td>
									@can('ticket_admin-access')
										<td><a href='{{"user/$user->id/edit"}}' class="btn btn-success btn-sm">Change Role</a></td>
									@endcan
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
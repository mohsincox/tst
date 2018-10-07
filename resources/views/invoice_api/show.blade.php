@extends('layouts.app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<div class="panel panel-primary">
				<div class="panel-heading">
                    <h3 class="panel-title text-center">
                    	<i class="fa fa-pencil"></i> Invoice Information of 
                    	<code>
                    		<b>{{ $mobileNo }}</b>
                    	</code>
                    </h3>
                </div>

				<div class="panel-body">
					<h4>Consumer Information</h4>
						<table class="table table-bordered table-condensed table-striped table-hover">
							<tbody>
							    <tr>
							        <td>ConsumerId</td>
							        <td><b>{{ $obj->ConsumerInfo->ConsumerId }}</b></td>
							        <td>ConsumerCode</td>
							        <td><b>{{ $obj->ConsumerInfo->ConsumerCode }}</b></td>
							        <td>ConsumerName</td>
							        <td><b>{{ $obj->ConsumerInfo->ConsumerName }}</b></td>
							    </tr>
							    <tr>
							        <td>Address</td>
							        <td><b>{{ $obj->ConsumerInfo->Address }}</b></td>
							        <td>MobileNo</td>
							        <td><b>{{ $obj->ConsumerInfo->MobileNo }}</b></td>
							        <td>PhoneNo</td>
							        <td><b>{{ $obj->ConsumerInfo->PhoneNo }}</b></td>
							    </tr>
							    <tr>
							        <td>Email</td>
							        <td><b>{{ $obj->ConsumerInfo->Email }} <?php ; ?></b></td>
							        <td>AlternativeCellNo</td>
							        <td><b>{{ $obj->ConsumerInfo->AlternativeCellNo }}</b></td>
							        <td>LastUpdateDate</td>
							        <td><b>{{ $obj->ConsumerInfo->LastUpdateDate }}</b></td>
							    </tr>
							    <tr>
							        <td>UpdateUserId</td>
							        <td><b>{{ $obj->ConsumerInfo->UpdateUserId }}</b></td>
							        <td>IsVerified</td>
							        <td><b>{{ $obj->ConsumerInfo->IsVerified }}</b></td>
							    </tr>
							</tbody>
						</table>
						<h4>Common Customer History</h4>
						<table class="table table-bordered table-condensed table-striped table-hover">
							<tbody>
							    <tr>
							        <td>ConsumerID</td>
							        <td><b>{{ $obj->CustomerHistory[0]->ConsumerID }}</b></td>
							        <td>Company</td>
							        <td><b>{{ $obj->CustomerHistory[0]->Company }}</b></td>
							        <td>System</td>
							        <td><b>{{ $obj->CustomerHistory[0]->System }}</b></td>
							    </tr>
							    <tr>
							        <td>TranType</td>
							        <td><b>{{ $obj->CustomerHistory[0]->TranType }}</b></td>
							        <td>WHCode</td>
							        <td><b>{{ $obj->CustomerHistory[0]->WHCode }}</b></td>
							        <td>SalesType</td>
							        <td><b>{{ $obj->CustomerHistory[0]->SalesType }}</b></td>
							    </tr>
							</tbody>
						</table>
						<h4>Variation Customer History</h4>
						<table class="table table-bordered table-condensed table-striped table-hover">
						    <tbody>
						      	<tr>
						      		<th>TranType</th>
						      		<th>SalesType</th>
						        	<th>TranNo</th>
						        	<th>TranDate</th>
						        	<th>ProductCode</th>
						        	<th>ProductName</th>
						        	<th>Qty</th>
						        	<th>Amount</th>
						      	</tr>
						      	<?php
						      		$CustomerHistorys = $obj->CustomerHistory;
						      	?>
						      	@foreach($CustomerHistorys as $history)
							      	<tr>
							      		<td>{{ $history->TranType }}</td>
							        	<td>{{ $history->SalesType }}</td>
							        	<td>{{ $history->TranNo }}</td>
							        	<td>{{ $history->TranDate }}</td>
							        	<td>{{ $history->ProductCode }}</td>
							        	<td>{{ $history->ProductName }}</td>
							        	<td>{{ $history->Qty }}</td>
							        	<td>{{ $history->Amount }}</td>
							      	</tr>
							    @endforeach
						    </tbody>
						</table>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection


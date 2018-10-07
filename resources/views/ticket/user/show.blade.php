@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title text-center"><code><b><i class="fa fa-eye"></i> Ticket Information of {{ $ticket->id }} No. Ticket and Phone Number {{ $ticket->phone_number }}</b></code> </h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">          
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td><b>Subject</b></td>
                                    <td>{{ $ticket->subject }}</td>
                                    <td><b>PIC</b></td>
                                    <td>{{ $ticket->assigned->name }}</td>
                                </tr>
                                <tr>
                                    <td><b>ticketType</b></td>
                                    @if(isset($ticket->ticketType->name))
                                        <td>{{ $ticket->ticketType->name }}</td>
                                    @else
                                        <td></td>
                                    @endif
                                    <td><b>ticketStatus</b></td>
                                    @if(isset($ticket->ticketStatus->name))
                                        <td>{{ $ticket->ticketStatus->name }}</td>
                                    @else
                                        <td></td>
                                    @endif
                                </tr>
                                <tr>
                                    <td><b>customer_name</b></td>
                                    <td>{{ $ticket->customer_name }}</td>
                                    <td><b>customer_address</b></td>
                                    <td>{{ $ticket->customer_address }}</td>
                                </tr>
                                <tr>
                                    <td><b>Police Station</b></td>
                                    @if(isset($ticket->policeStation->name))
                                        <td>{{ $ticket->policeStation->name }}</td>
                                    @else
                                        <td></td>
                                    @endif
                                    <td><b>District</b></td>
                                    @if(isset($ticket->district->name))
                                        <td>{{ $ticket->district->name }}</td>
                                    @else
                                        <td></td>
                                    @endif
                                </tr>
                                <tr>
                                    <td><b>product_name_with_model</b></td>
                                    <td>{{ $ticket->product_name_with_model }}</td>
                                    <td><b>invoice_no</b></td>
                                    <td>{{ $ticket->invoice_no }}</td>
                                </tr>
                                <tr>
                                    <td><b>job_no</b></td>
                                    <td>{{ $ticket->job_no }}</td>
                                    <td><b>warranty_or_paid</b></td>
                                    <td>{{ $ticket->warranty_or_paid }}</td>
                                </tr>
                                <tr>
                                    <td><b>tp_or_engineer_name</b></td>
                                    <td>{{ $ticket->tp_or_engineer_name }}</td>
                                    <td><b>Call Type</b></td>
                                    <td>{{ $ticket->call_type }}</td>
                                </tr>
                                <tr>
                                    <td><b>created_at</b></td>
                                    <td>{{ $ticket->created_at }}</td>
                                    <td><b>updated_at</b></td>
                                    <td>{{ $ticket->updated_at }}</td>
                                </tr>
                                <tr>
                                    <td><b>created_by</b></td>
                                    <td>{{ $ticket->createdBy->name }}</td>
                                    <td><b>updated_by</b></td>
                                    @if(isset($ticket->updatedBy->name))
                                        <td>{{ $ticket->updatedBy->name }}</td>
                                    @else
                                        <td></td>
                                    @endif
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

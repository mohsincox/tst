<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\Ticket;
use Illuminate\Support\Facades\Auth;

class CreatedByTicketController extends Controller
{
    public function __construct()
    {
    	$this->middleware('auth');
    }

    public function createdByDateForm()
    {
        return view('ticket.created_by.date_form');
    }

    public function createdByIndex(Request $request)
    {
        $startDate = $request->start_date.' 00:00:00'; 
        $endDate = $request->end_date.' 23:59:59';
        $authId = Auth::id();
        $tickets = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->where('created_by', $authId)->whereBetween('created_at', [$startDate, $endDate])->orderBy('id', 'desc')->get();

        return view('ticket.created_by.index', compact('tickets'));
    }
}

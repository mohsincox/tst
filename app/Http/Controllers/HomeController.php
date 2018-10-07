<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\User;
use App\Models\Ticket;
use App\Models\TicketType;
use App\Models\TicketStatus;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userCount = User::count();
        $ticketCount = Ticket::count();
        $ticketTypeCount = TicketType::count();
        $ticketType1CountLog = Ticket::where('ticket_type_id', 1)->where('ticket_status_id', '<>', 3)->count();  //old
        $ticketType2CountSal = Ticket::where('ticket_type_id', 2)->where('ticket_status_id', '<>', 3)->count();
        $ticketType3CountAC = Ticket::where('ticket_type_id', 3)->where('ticket_status_id', '<>', 3)->count();
        $ticketType4CountEle = Ticket::where('ticket_type_id', 4)->where('ticket_status_id', '<>', 3)->count();
        $ticketType5CountApp = Ticket::where('ticket_type_id', 5)->where('ticket_status_id', '<>', 3)->count();
        $ticketType6CountSB = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', '<>', 3)->count();
        $ticketType7CountMYOL = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', '<>', 3)->count();  //old MYOL Type: 8
        $ticketStatusCount = TicketStatus::count();
        //$ticketStatusNewCount = Ticket::where('ticket_status_id', 1)->count();
        $ticketStatusPendingCount = Ticket::where('ticket_status_id', 1)->count();
        $ticketStatusAnsweredCount = Ticket::where('ticket_status_id', 2)->count();
        $ticketStatusClosedCount = Ticket::where('ticket_status_id', 3)->count();
        $ticketInvoiceCallCount = Ticket::where('call_type', 'Invoice Call')->count();
        $ticketServiceCallCount = Ticket::where('call_type', 'Service Call')->count();
        return view('home', compact('userCount', 'ticketTypeCount', 'ticketCount', 'ticketStatusCount', 'ticketType1CountLog', 'ticketType2CountSal', 'ticketType3CountAC', 'ticketType4CountEle', 'ticketType5CountApp', 'ticketType6CountSB', 'ticketType7CountMYOL', 'ticketStatusAnsweredCount', 'ticketStatusPendingCount', 'ticketStatusClosedCount', 'ticketInvoiceCallCount', 'ticketServiceCallCount'));
    }
}

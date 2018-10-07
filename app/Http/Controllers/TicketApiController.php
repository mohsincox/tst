<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Config;
use App\Models\Ticket;

class TicketApiController extends Controller
{
    public function getData(Request $request)
    {
        $ADMIN_LOGIN = Config::get('constants.ADMIN_LOGIN');
        $ADMIN_PASSWORD = Config::get('constants.ADMIN_PASSWORD');
        
        // define('ADMIN_LOGIN','tel.transcombd.com'); 
        // define('ADMIN_PASSWORD','TxL=y9K'); // Could be hashed too.

        // Key: Authorization
        // Value: Basic dGVsLnRyYW5zY29tYmQuY29tOlR4TD15OUs=
          
        if (!isset($_SERVER['PHP_AUTH_USER']) || !isset($_SERVER['PHP_AUTH_PW']) 
        || ($_SERVER['PHP_AUTH_USER'] != $ADMIN_LOGIN) 
        || ($_SERVER['PHP_AUTH_PW'] != $ADMIN_PASSWORD)) { 
            header('HTTP/1.1 401 Unauthorized'); 
            header('WWW-Authenticate: Basic realm="Password For Blog"'); 
            exit("Access Denied: Username and password required."); 
        } else {
            $startDate = $request->startDate.' 00:00:00'; 
            $endDate = $request->endDate.' 23:59:59'; 
            
            $tickets = Ticket::with(['assigned', 'ticketType', 'policeStation', 'district','ticketDetails.ticketStatus'])->whereBetween('created_at', [$startDate, $endDate])->get();
    
            $data = [];

            foreach($tickets as $ticket) {
                if (isset($ticket->policeStation->name)) {
                    $policeStation = $ticket->policeStation->name;
                } else {
                    $policeStation = '';
                }
                
                $ticketInfo = [
                    'ticketId' => $ticket->id,
                    'subject' => $ticket->subject,
                    'PIC' => $ticket->assigned->name,
                    'ticketType' => $ticket->ticketType->name,
                    'callType' => $ticket->call_type,
                    'customerNumber' => $ticket->phone_number,
                    'customerName' => $ticket->customer_name,
                    'customerAddress' => $ticket->customer_address,
                    'policeStation' => $policeStation,
                    'district' => $ticket->district->name,
                    'productNameWithModel' => $ticket->product_name_with_model,
                    'invoiceNo' => $ticket->invoice_no,
                    'jobNo' => $ticket->job_no,
                    'warrantyOrPaid' => $ticket->warranty_or_paid,
                    'TPorEngineerName' => $ticket->tp_or_engineer_name,
                    'createdAt' => $ticket->created_at->toDateTimeString()
                ];

                $detailsInfo = [];

                foreach($ticket->ticketDetails as $detail) {
                    $detailsInfo[] = [
                        'detailsId' => $detail->id,
                        'status' => $detail->ticketStatus->name,
                        'verbatimOrIssue' => $detail->verbatim_or_issue,
                        'createdAt' => date('Y-m-d H:i:s', strtotime($detail->created_at))
                    ];
                }

                $data[] = [
                    'ticketInfo' => $ticketInfo,
                    'detailsInfo' => $detailsInfo
                ];
            }

            return $a = json_encode($data);
        }
    }
}

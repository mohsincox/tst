<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\District;
use App\Models\PoliceStation;
use App\Models\TicketType;
use App\Models\TicketStatus;
use App\Models\Ticket;
use App\Models\TicketDetail;
use App\Models\Option;
use App\User;
use Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Excel;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class TicketController extends Controller
{
	public function __construct()
    {
    	$this->middleware('auth');
    }

    public function agentDateForm()
    {
        return view('ticket.agent.date_form');
    }

    public function agentIndex(Request $request)
    {
        $startDate = $request->start_date.' 00:00:00'; 
        $endDate = $request->end_date.' 23:59:59';
        $tickets = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->whereBetween('created_at', [$startDate, $endDate])->orderBy('id', 'desc')->get();
        return view('ticket.agent.index', compact('tickets'));
    }

    public function userDateForm()
    {
        return view('ticket.user.date_form');
    }

    public function userIndex(Request $request)
    {
        $startDate = $request->start_date.' 00:00:00'; 
        $endDate = $request->end_date.' 23:59:59';
        $tickets = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])
                        ->where('assigned_id',  Auth::id())
                        ->whereBetween('created_at', [$startDate, $endDate])
                        ->orderBy('id', 'desc')
                        ->get();
        return view('ticket.user.index', compact('tickets'));
    }

    // public function agentCreatePhoneNumber()
    // {
    // 	if ( Auth::id() == 10 ) {
    // 		return view('ticket.agent.create_phone_number');
    // 	} else {
    // 		flash()->error('No permission to create Ticket');
    // 		return redirect()->back();
    // 	}
    	
    // }

    public function agentCreateForm(Request $request)
    {
    	// $phoneNumber=preg_replace('/\D/', '',  $request->phoneNumber);
     //    if(substr($phoneNumber, 0, 1) == "+" ) $phoneNumber=substr($phoneNumber, 1);
     //    if(substr($phoneNumber, 0, 2) == "88") $phoneNumber=substr($phoneNumber, 2);

        $agentId = array(3, 4, 5, 6, 8, 9, 10, 14, 15, 16, 17, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 36, 37, 38, 39, 40, 41, 42, 43);

        if (in_array(Auth::id(), $agentId)) {
            $districtList = District::orderBy('name', 'asc')->pluck('name', 'id');
            $ticketTypeList = TicketType::where('id', '<>', 9)->pluck('name', 'id');
            $userList = User::pluck('name', 'id');
            $callTypeList  = Option::where('select_id', 1)->where('status', 'Active')->pluck('name', 'name');
            $warrantyOrPaidList = Option::where('select_id', 2)->where('status', 'Active')->pluck('name', 'name');
            $subjectList = Option::where('select_id', 3)->where('status', 'Active')->pluck('name', 'name');
        
            return view('ticket.agent.create_form', compact('districtList', 'ticketTypeList', 'userList', 'callTypeList', 'warrantyOrPaidList', 'subjectList'));
        } else {
            flash()->error('No permission to create Ticket');
            return redirect()->back();
        }

        
    }

    // public function divisionDistrictShow(Request $request)
    // {   
    //     $districts = District::where('division_id', $request->division_id)->get();
    //     foreach ($districts as $district) {
    //         $divWiseDistrictList[$district->id] = $district->name;
    //     }
    //     return view('ticket.agent.division_district', compact('divWiseDistrictList'));
    // }

    public function districtPsShow(Request $request)
    {   
        $policeStations = PoliceStation::where('district_id', $request->district_id)->get();
        foreach ($policeStations as $policeStation) {
            $disWisePsList[$policeStation->id] = $policeStation->name;
        }
        return view('ticket.agent.district_ps', compact('disWisePsList'));
    }

    public function typeToAssign(Request $request)
    {   
        //$typeWiseUserList = [];
        $typeWiseUsers = User::where('ticket_type_id', $request->ticket_type_id)->get();
        if (count($typeWiseUsers)) {
            foreach ($typeWiseUsers as $typeWiseUser) {
                $typeWiseUserList[$typeWiseUser->id] = $typeWiseUser->name;
            }
        } else {
            $typeWiseUserList = [];
        }
        
        return view('ticket.agent.type_wise_user', compact('typeWiseUserList'));
    }

    public function typeToCC(Request $request)
    {   
        $ticketType = $request->ticket_type_id;
        //$userList = User::pluck('name', 'id');
        
        if ($ticketType == 1) {
            $ccUserList = User::whereIn('id',[8, 9, 14, 35])->pluck('name', 'id');
            $ccUserArr = [8, 9, 14, 35];
        } else if ($ticketType == 2) {
            $ccUserList = User::whereIn('id',[8, 9, 14, 35])->pluck('name', 'id');
            $ccUserArr = [8, 9, 14, 35];
        } else if ($ticketType == 3) {
            $ccUserList = User::whereIn('id',[8, 9, 14, 35])->pluck('name', 'id');
            $ccUserArr = [8, 9, 14, 35];
        } else if ($ticketType == 4) {
            $ccUserList = User::whereIn('id',[8, 9, 14, 35])->pluck('name', 'id');
            $ccUserArr = [8, 9, 14, 35];
        } else if ($ticketType == 5) {
            $ccUserList = User::whereIn('id',[8, 9, 14, 35])->pluck('name', 'id');
            $ccUserArr = [8, 9, 14, 35];
        } else if ($ticketType == 6) {
            $ccUserList = User::whereIn('id',[8, 9, 14, 16, 17, 35])->pluck('name', 'id');
            $ccUserArr = [8, 9, 14, 16, 17, 35];
        } else if ($ticketType == 7) {
            $ccUserList = User::whereIn('id',[8, 9, 14, 18, 35])->pluck('name', 'id');
            $ccUserArr = [8, 9, 14, 18, 35];
        } else if ($ticketType == 8) {
            $ccUserList = User::whereIn('id',[8, 9, 14, 12, 35])->pluck('name', 'id');
            $ccUserArr = [8, 9, 14, 12, 35];
            // $ccUserList = User::whereIn('id',[11, 13])->pluck('name', 'id');
            // $ccUserArr = [11, 13];
        } else {
            $ccUserList  = [];
            $ccUserArr = [];
        }
        
        return view('ticket.agent.type_wise_cc', compact('ticketType', 'ccUserList', 'ccUserArr'));
    }

    public function agentStore(Request $request)
    {
        //return $request->all();
        $input = Input::all();
        $rules = [
            'phone_number' => 'required|numeric|digits_between:11,11',
            'subject' => 'required',
            'customer_name' => 'required',
            'district_id' => 'required',
            'customer_address' => 'required',
            'product_name_with_model' => 'required',
            'ticket_type_id' => 'required',
            'assigned_id' => 'required',
            'cc_to' => 'required',
            'call_type' => 'required',
            'invoice_no' => 'required',
            'job_no' => 'required',
            'warranty_or_paid' => 'required',
            'tp_or_engineer_name' => 'required',
            'verbatim_or_issue' => 'required',
            'featured_mp3' => 'max:1000'
        ];
        $messages = [
            'phone_number.required' => 'The Phone Number field is required.',
            'subject.required' => 'The Subject field is required.',
            'customer_name.required' => 'The Customer Name field is required.',
            'district_id.required' => 'The District field is required.',
            'customer_address.required' => 'The Customer Address field is required.',
            'product_name_with_model.required' => 'The Product Name With Model field is required.',
            'ticket_type_id.required' => 'The Ticket Type field is required.',
            'assigned_id.required' => 'The Assigned Person field is required.',
            'cc_to.required' => 'The CC To field is required.',
            'call_type.required' => 'The Call Type field is required.',
            'verbatim_or_issue.required' => 'The Verbatim or Issue field is required.'
            
        ];
        
        $validator = Validator::make($input, $rules, $messages);
        if ($validator->fails()) {
            flash()->error('Something Wrong!');
            return redirect()->back()
                        ->withErrors($validator)
                        ->withInput(Input::except('district_id', 'ticket_type_id'));
        }

        $music_file = Input::file('featured_mp3'); 
        if(isset($music_file)){ 
            $filename = $music_file->getClientOriginalName(); 
            $location = public_path('audio/'); $music_file->move($location,$filename); 
        }
        
        // echo "ttt";
        // exit();
        $ticket = new Ticket;
        $ticket->phone_number = $request->phone_number;
        $ticket->subject = $request->subject;
        $ticket->customer_name = $request->customer_name;
        $ticket->district_id = $request->district_id;
        $ticket->police_station_id = $request->police_station_id;
        $ticket->customer_address = $request->customer_address;
        $ticket->product_name_with_model = $request->product_name_with_model;
        $ticket->ticket_status_id = 1;
        $ticket->ticket_type_id = $request->ticket_type_id;
        $ticket->assigned_id = $request->assigned_id;
        if ($request->cc_to == null) {
            $ticket->cc_to = $request->cc_to;
        } else {
            $strCcTo = implode(", ",$request->cc_to);
            //print_r (explode(", ",$strCcTo));
            $ticket->cc_to = $strCcTo;
        }
        $ticket->call_type = $request->call_type;
        $ticket->invoice_no = $request->invoice_no;
        $ticket->job_no = $request->job_no;
        $ticket->warranty_or_paid = $request->warranty_or_paid;
        $ticket->tp_or_engineer_name = $request->tp_or_engineer_name;
        //$ticket->verbatim_or_issue = $request->verbatim_or_issue;
        $ticket->created_by = Auth::id();
        $ticket->save();

        $ticketDetail = new TicketDetail;
        $ticketDetail->ticket_id = $ticket->id;
        $ticketDetail->ticket_status_id = 1;
        $ticketDetail->verbatim_or_issue = $request->verbatim_or_issue;
        $ticketDetail->created_by = Auth::id();
        $ticketDetail->save();

        
        $ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

        $varbatimFirst = TicketDetail::where('ticket_id', $ticketFind->id)->first();

        if (isset($ticketFind->policeStation->name)) {
            $policeStation = $ticketFind->policeStation->name;
        } else {
            $policeStation = '';
        }
        if (isset($ticketFind->district->name)) {
            $district = $ticketFind->district->name;
        } else {
            $district = '';
        }

        if ( ($ticketFind->ticket_type_id == 1) || ($ticketFind->ticket_type_id == 2) || ($ticketFind->ticket_type_id == 3) || ($ticketFind->ticket_type_id == 4) || ($ticketFind->ticket_type_id == 5) ) {
            $mailHeader = 'First Receipient (solve within 2 hours)';
        } else {
            $mailHeader = 'First Receipient (solve within 24 hours)';
        }

        
        $mailUser = User::find($request->assigned_id);
        $ccUsers = User::whereIn('id', $request->cc_to)->get();
        //$ccUsers = User::whereIn('id', [13])->get();

        $mail = new PHPMailer(true);                             
        try {
                                       
            $mail->isSMTP();                                      
            $mail->Host = 'smtp.gmail.com';  
            $mail->SMTPAuth = true;                               
            $mail->Username = 'mohsinsemyolbd@gmail.com';                 
            $mail->Password = 'zxcvbnm@12';                          
            $mail->SMTPSecure = 'tls';                            
            $mail->Port = 587;  

            
            $mail->setFrom('from@example.com', 'myolbd.com');
            
            $mail->addAddress($mailUser->email, $mailUser->name);
            

            $mail->addReplyTo('info@example.com', 'Information');
            
            foreach($ccUsers as $ccUser)
            {
               $mail->addCC($ccUser->email, $ccUser->name);
            }

            if(isset($filename)) {
                $mail->addAttachment('/srv/www/htdocs/transcomticket/public/audio/'.$filename);
            }
           
            $mail->isHTML(true);                                 
            $mail->Subject = 'Ticket_' . $ticketFind->id . '_' . $ticketFind->ticketType->name . '_' . $ticketFind->subject;
            $mail->Body    = '<html>
                                <head>
                                <style>
                                table, th, td {
                                    border: 1px solid black;
                                    border-collapse: collapse;
                                }
                                th, td {
                                    padding: 5px;
                                }
                                </style>
                                </head>
                                <body>
                                <h2>'.$mailHeader.'</h2>
                                <table>
                                  <tr>
                                    <td>Type</td>
                                    <td><b>'.$ticketFind->ticketType->name.'</b></td>
                                    <td>Status</td>
                                    <td><b>'.$ticketFind->ticketStatus->name.'</b></td>
                                  </tr>
                                  <tr>
                                    <td>PIC</td>
                                    <td><b>'.$ticketFind->assigned->name.'</b></td>
                                    <td>Customer Name</td>
                                    <td><b>'.$ticketFind->customer_name.'</b></td>
                                  </tr>
                                  <tr>
                                    <td>Phone No</td>
                                    <td><b>'.$ticketFind->phone_number.'</b></td>
                                    <td>Address</td>
                                    <td><b>'.$ticketFind->customer_address.'</b></td>
                                  </tr>
                                  <tr>
                                    <td>Police Station</td>
                                    <td><b>'.$policeStation.'</b></td>
                                    <td>District</td>
                                    <td><b>'.$district.'</b></td>
                                  </tr>
                                  <tr>
                                    <td>Product Model</td>
                                    <td><b>'.$ticketFind->product_name_with_model.'</b></td>
                                    <td>Call Type</td>
                                    <td><b>'.$ticketFind->call_type.'</b></td>
                                  </tr>
                                  <tr>
                                    <td>Invoice No</td>
                                    <td><b>'.$ticketFind->invoice_no.'</b></td>
                                    <td>Job No</td>
                                    <td><b>'.$ticketFind->job_no.'</b></td>
                                  </tr>
                                  <tr>
                                    <td>Warranty or Paid</td>
                                    <td><b>'.$ticketFind->warranty_or_paid.'</b></td>
                                    <td>TP</td>
                                    <td><b>'.$ticketFind->tp_or_engineer_name.'</b></td>
                                  </tr>
                                  <tr>
                                    <td>Verbatim or Issue</td>
                                    <td colspan="4"><b>'.$varbatimFirst->verbatim_or_issue.'</b></td>
                                  </tr>
                                </table>
                                </body>
                                </html>';
            $mail->send();
            echo 'Message has been sent';
        } catch (Exception $e) {
            echo 'Message could not be sent.';
            echo 'Mailer Error: ' . $mail->ErrorInfo;
        }

        // $casperUser = 'farzana';
        // $smsPhoneNumber = '01758214966';
        $casperUser = Auth::user()->name;
        $smsPhoneNumber = $ticketFind->assigned->phone_number;
        $smsBody = $mailHeader." Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

        $url = 'http://202.53.171.126/e.api/api/transcom-digital-sms-gateway/send-message';
        $data = array('MobileNo' => $smsPhoneNumber, 'SendUserName' => $casperUser, 'Message' => $smsBody);

        $client_id = 'MyOutsourcingLimited';
        $client_secret = 'TxL=y9K';

        $options = array(
            'http' => array(
                'header'  => "Content-type: application/x-www-form-urlencoded\r\n".
                            "Authorization: Basic " . base64_encode("$client_id:$client_secret"),
                'method'  => 'POST',
                'content' => http_build_query($data)
            )
        );
        $context  = stream_context_create($options);
        $result = file_get_contents($url, false, $context);
        if ($result === FALSE) { echo "Something Wrong in SMS"; }

        //var_dump($result);
       
        $obj = json_decode($result);
        //print_r($obj);
        $smsFeedBack = $obj->Message;

        //echo 'SMS: '.$smsFeedBack.', Mail sent successfully after 48 hours'; 

        flash()->success('SMS: '.$smsFeedBack.', Mail sent successfully');
        return redirect('ticket/agent/ticket-date-form');
    }

    public function agentShow($id)
    {
        $ticket = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($id);
        return view('ticket.agent.show', compact('ticket'));
    }

    public function userShow($id)
    {
        $ticket = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($id);
        return view('ticket.user.show', compact('ticket'));
    }

     public function agentDetailsShow($id)
    {
        $ticketDetails = TicketDetail::with('ticketStatus')->where('ticket_id', $id)->get();
        return view('ticket.agent.details', compact('ticketDetails'));
    }

    public function userDetailsShow($id)
    {
        $ticketDetails = TicketDetail::with(['ticketStatus'])->where('ticket_id', $id)->get();
        return view('ticket.user.details', compact('ticketDetails'));
    }

    public function agentEdit($id)
    {
        $ticket = Ticket::find($id);
        $ticketStatusList = TicketStatus::where('id', '<>', 1)->pluck('name', 'id');
        return view('ticket.agent.edit', compact('ticket', 'ticketStatusList'));
    }

    public function agentUpdate(Request $request, $id)
    {
        $ticket = Ticket::find($id);
        $input = Input::all();
        $rules = [
            'ticket_status_id' => 'required',
            'verbatim_or_issue' => 'required'
        ];
        $messages = [
            'ticket_status_id.required' => 'The Ticket Status field is required.',
            'verbatim_or_issue.required' => 'The Verbatim or Issue field is required.'
        ];
        
        $validator = Validator::make($input, $rules, $messages);
        if ($validator->fails()) {
            flash()->error('Something Wrong!');
            return redirect()->back()
                        ->withErrors($validator)
                        ->withInput();
        }
        $ticket->ticket_status_id = $request->ticket_status_id;
        $ticket->updated_by = Auth::id();
        $ticket->save();

        $ticketDetail = new TicketDetail;
        $ticketDetail->ticket_id = $ticket->id;
        $ticketDetail->ticket_status_id = $request->ticket_status_id;
        $ticketDetail->verbatim_or_issue = $request->verbatim_or_issue;
        $ticketDetail->created_by = Auth::id();
        $ticketDetail->save();

        /* $ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

        if (isset($ticketFind->policeStation->name)) {
            $policeStation = $ticketFind->policeStation->name;
        } else {
            $policeStation = '';
        }
        if (isset($ticketFind->district->name)) {
            $district = $ticketFind->district->name;
        } else {
            $district = '';
        }

        $casperUser = Auth::user()->name;
        $smsPhoneNumber = $ticketFind->assigned->phone_number;
        $smsBody = "Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Tstatus: ".$ticketFind->ticketStatus->name.",Comment: ".$ticketFind->agent_comment.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name.",Issue: ".$ticketFind->verbatim_or_issue;

        $url = 'http://202.53.171.126/e.api/api/transcom-digital-sms-gateway/send-message';
        $data = array('MobileNo' => $smsPhoneNumber, 'SendUserName' => $casperUser, 'Message' => $smsBody);

        $client_id = 'MyOutsourcingLimited';
        $client_secret = 'TxL=y9K';

        $options = array(
            'http' => array(
                'header'  => "Content-type: application/x-www-form-urlencoded\r\n".
                            "Authorization: Basic " . base64_encode("$client_id:$client_secret"),
                'method'  => 'POST',
                'content' => http_build_query($data)
            )
        );
        $context  = stream_context_create($options);
        $result = file_get_contents($url, false, $context);
        if ($result === FALSE) { echo "Something Wrong in SMS"; }

        //var_dump($result);
       
        $obj = json_decode($result);
        //print_r($obj);
        $smsFeedBack = $obj->Message;


        flash()->success('SMS: '.$smsFeedBack.', Ticket updated successfully'); */
        flash()->success('Ticket ID '.$ticket->id.' updated successfully');
        return redirect('ticket/agent/ticket-date-form');
    }

     public function userEdit($id)
    {
        $ticket = Ticket::find($id);
        if ($ticket->ticket_status_id == 3) {
            flash()->error('The Ticket has been CLOSED!');
            return redirect()->back();
        }
        $ticketStatusList = TicketStatus::whereNotIn('id', [1, 3])->pluck('name', 'id');
        return view('ticket.user.edit', compact('ticket', 'ticketStatusList'));
    }

    public function userUpdate(Request $request, $id)
    {
        $ticket = Ticket::find($id);
        $input = Input::all();
        $rules = [
            'ticket_status_id' => 'required',
            'verbatim_or_issue' => 'required'
        ];
        $messages = [
            'ticket_status_id.required' => 'The Ticket Status field is required.',
            'verbatim_or_issue.required' => 'The Verbatim or Issue field is required.'
        ];
        
        $validator = Validator::make($input, $rules, $messages);
        if ($validator->fails()) {
            flash()->error('Something Wrong!');
            return redirect()->back()
                        ->withErrors($validator)
                        ->withInput();
        }
        
        $ticket->ticket_status_id = $request->ticket_status_id;
        $ticket->updated_by = Auth::id();
        $ticket->save();

        $ticketDetail = new TicketDetail;
        $ticketDetail->ticket_id = $ticket->id;
        $ticketDetail->ticket_status_id = $request->ticket_status_id;
        $ticketDetail->verbatim_or_issue = $request->verbatim_or_issue;
        $ticketDetail->created_by = Auth::id();
        $ticketDetail->save();

        flash()->success('Ticket ID '.$ticket->id.' updated successfully');
        return redirect('ticket/user/ticket-date-form');
    }

    public function reportForm()
    {
        return view('ticket.report.form');
    }

    public function reportDownload(Request $request)
    {   //return $request->all();
        $startDate = $request->start_date.' 00:00:00';
        $endDate = $request->end_date.' 23:59:59';
        $type = $request->type;
        Excel::create('ticket'.$request->start_date.'to'.$request->end_date, function($excel) use ($startDate,  $endDate, $type) {

            $excel->sheet('Sheet1', function($sheet) use ($startDate,  $endDate, $type) {

                $tickets = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->whereBetween('updated_at', [$startDate, $endDate])->get();

                $arr =array();
                foreach($tickets as $ticket) {
                    if (isset($ticket->assigned->name)) {
                        $assigned = $ticket->assigned->name;
                    } else {
                        $assigned = null;
                    }
                    if (isset($ticket->ticketType->name)) {
                        $ticketType = $ticket->ticketType->name;
                    } else {
                        $ticketType = null;
                    }
                    if (isset($ticket->ticketStatus->name)) {
                        $ticketStatus = $ticket->ticketStatus->name;
                    } else {
                        $ticketStatus = null;
                    }
                    if (isset($ticket->createdBy->name)) {
                        $createdBy = $ticket->createdBy->name;
                    } else {
                        $createdBy = null;
                    }
                    if (isset($ticket->updatedBy->name)) {
                        $updatedBy = $ticket->updatedBy->name;
                    } else {
                        $updatedBy = null;
                    }
                    if (isset($ticket->panelFeedBackBy->name)) {
                        $panelFeedBackBy = $ticket->panelFeedBackBy->name;
                    } else {
                        $panelFeedBackBy = null;
                    }
                    if (isset($ticket->agentClosedBy->name)) {
                        $agentClosedBy = $ticket->agentClosedBy->name;
                    } else {
                        $agentClosedBy = null;
                    }
                    if (isset($ticket->policeStation->name)) {
                        $policeStation = $ticket->policeStation->name;
                    } else {
                        $policeStation = null;
                    }
                    if (isset($ticket->district->name)) {
                        $district = $ticket->district->name;
                    } else {
                        $district = null;
                    }

                    $data =  array($ticket->id, $ticket->subject, $assigned, $ticketType, $ticketStatus, $ticket->call_type, $ticket->phone_number, $ticket->customer_name, $ticket->customer_address, $policeStation, $district, $ticket->product_name_with_model, $ticket->invoice_no, $ticket->job_no, $ticket->warranty_or_paid, $ticket->tp_or_engineer_name, $ticket->created_at, $ticket->updated_at, $createdBy, $updatedBy);
                    array_push($arr, $data);
                }
                
                //set the titles
                $sheet->fromArray($arr,null,'A1',false,false)->prependRow(array(
                        'Id', 'subject', 'assigned', 'ticketType', 'ticketStatus', 'call_type', 'phone_number', 'customer_name', 'customer_address', 'policeStation', 'district', 'product_name_with_model', 'invoice_no', 'job_no', 'warranty_or_paid', 'tp_or_engineer_name', 'created_at', 'updated_at', 'createdBy', 'updatedBy'
                    )

                );

            });

        })->export($type);
    }

    public function test()
    {
        $ticketFind = Ticket::with('assigned')->find(1);
        $smsPhoneNumber = $ticketFind->user->phone_number;
        $smsBody = 'Tid: '.$ticketFind->id.',Sub: '.$ticketFind->subject.',Cno: '.$ticketFind->phone_number.',Cadd: '.$ticketFind->customer_address;

        $url = 'http://202.53.171.126/e.api/api/transcom-digital-sms-gateway/send-message';
        $data = array('MobileNo' => $smsPhoneNumber, 'SendUserName' => 'nirob', 'Message' => $smsBody);

        $client_id = 'MyOutsourcingLimited';
        $client_secret = 'TxL=y9K';
        // use key 'http' even if you send the request to https://...
        $options = array(
            'http' => array(
                'header'  => "Content-type: application/x-www-form-urlencoded\r\n".
                            "Authorization: Basic " . base64_encode("$client_id:$client_secret"),
                'method'  => 'POST',
                'content' => http_build_query($data)
            )
        );
        $context  = stream_context_create($options);
        $result = file_get_contents($url, false, $context);
        if ($result === FALSE) { echo "Something Wrong"; }

        var_dump($result);
        //echo $result->Message;
        $obj = json_decode($result);
        //print_r($obj);
        echo $obj->Message;
    }
}

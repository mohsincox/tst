<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\Ticket;
use App\User;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class CrontabController extends Controller
{
	public function serviceAC2HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 1)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

			if ($hourDiff >= 2 && $hourDiff < 3) {                                                                        //Type: 1, Hour Diff: 2 Start
    			
    			$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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
		        
		        $mailUser = User::find(9);
		        $ccUsers = User::whereIn('id', [4, 8, 14])->get();

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
		                                <h2>Second Receipient (After 2 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01701217968';   //9imtiaz
		        $smsBody = "Second Receipient (After 2 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail send & Ticket created successfully';                                 //Type: 1, Hour Diff: 2 End

    		}

    	}
	}

	public function serviceAC24HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 1)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 24 && $hourDiff < 25) {                                                                      //Type: 1, Hour Diff: 24 Start
				
				$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(19);
		        $ccUsers = User::whereIn('id', [4, 8, 9, 14])->get();

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
		                                <h2>Final Receipient (After 24 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01713009891';     //19Yeamin
		        $smsBody = "Final Receipient (After 24 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail sent successfully after 24 hours';                                    //Type: 1, Hour Diff: 24 End

			}
    	}
	}

	public function serviceHA2HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 2)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

			if ($hourDiff >= 2 && $hourDiff < 3) {                                                                      //Type: 2, Hour Diff: 2 Start
    			
    			$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(9);
		        $ccUsers = User::whereIn('id', [6, 8, 14])->get();

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
		                                <h2>Second Receipient (After 2 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01701217968';    //9imtiaz
		        $smsBody = "Second Receipient (After 2 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail send & Ticket created successfully';                                 //Type: 2, Hour Diff: 2 End

    		}
    	}
	}

	public function serviceHA24HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 2)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 24 && $hourDiff < 25) {                                                                    //Type: 2, Hour Diff: 24 Start
				
				$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(19);
		        $ccUsers = User::whereIn('id', [6, 8, 9, 14])->get();

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
		                                <h2>Final Receipient (After 24 Hours)  Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01713009891';    //19Yeamin
		        $smsBody = "Final Receipient (After 24 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail sent successfully after 24 hours';                                    //Type: 2, Hour Diff: 24 End

			}
    	}
	}

	public function serviceAV2HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 3)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

			if ($hourDiff >= 2 && $hourDiff < 3) {                                                                     //Type: 3, Hour Diff: 2 Start
    			
    			$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(9);
		        $ccUsers = User::whereIn('id', [5, 8, 14])->get();

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
		                                <h2>Second Receipient (After 2 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01701217968';    //9imtiaz
		        $smsBody = "Second Receipient (After 2 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail send & Ticket created successfully';                                 //Type: 3, Hour Diff: 2 End

    		}

    	}
	}

	public function serviceAV24HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 3)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 24 && $hourDiff < 25) {                                                                    //Type: 3, Hour Diff: 24 Start
				
				$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(19);
		        $ccUsers = User::whereIn('id', [5, 8, 9, 14])->get();

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
		                                <h2>Final Receipient (After 24 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01713009891';     //19Yeamin
		        $smsBody = "Final Receipient (After 24 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail sent successfully after 24 hours';                                    //Type: 3, Hour Diff: 24 End

			}
    	}
	}

	public function serviceFront2HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 4)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

			if ($hourDiff >= 2 && $hourDiff < 3) {                                                                    //Type: 4, Hour Diff: 2 Start
    			
    			$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(14);
		        $ccUsers = User::whereIn('id', [8, 9, 15])->get();

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
		                                <h2>Second Receipient (After 2 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01714089140';     //14manju
		        $smsBody = "Second Receipient (After 2 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail send & Ticket created successfully';                                 //Type: 4, Hour Diff: 2 End

    		}
    	}
	}

	public function serviceFront24HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 4)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 24 && $hourDiff < 25) {                                                                    //Type: 4, Hour Diff: 24 Start
				
				$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(9);
		        $ccUsers = User::whereIn('id', [8, 14, 15])->get();

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
		                                <h2>Final Receipient (After 24 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01701217968';     //9imtiaz
		        $smsBody = "Final Receipient (After 24 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail sent successfully after 24 hours';                                    //Type: 4, Hour Diff: 24 End

			}
    	}
	}

	public function serviceSamsung2HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 5)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

			if ($hourDiff >= 2 && $hourDiff < 3) {                              					                   //Type: 5, Hour Diff: 2 Start
    			
    			$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(9);
		        $ccUsers = User::whereIn('id', [7, 8, 14])->get();

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
		                                <h2>Second Receipient (After 2 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01701217968';     //9imtiaz
		        $smsBody = "Second Receipient (After 2 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail send & Ticket created successfully';                                 //Type: 5, Hour Diff: 2 End

    		}
    	}
	}

	public function serviceSamsung24HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 5)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 24 && $hourDiff < 25) {                                                                 //Type: 5, Hour Diff: 24 Start
				
				$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(19);
		        $ccUsers = User::whereIn('id', [7, 8, 9, 14])->get();

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
		                                <h2>Final Receipient (After 24 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01713009891';    //19Yeamin
		        $smsBody = "Final Receipient (After 24 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail sent successfully after 24 hours';                                    //Type: 5, Hour Diff: 24 End

			}
    	}
	}

	public function sales24HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 24 && $hourDiff < 25) {                                                                  //Type: 6, Hour Diff: 24 Start
    			
    			$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(16);
		        $ccUsers = User::whereIn('id', [3, 8, 9, 14, 17])->get();

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
		                                <h2>Second Receipient (After 24 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01713082492';     //16Aminul
		        $smsBody = "Second Receipient (After 24 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail send & Ticket created successfully';                                 //Type: 6, Hour Diff: 24 End

    		}
    	}
	}

	public function sales48HoursMail()
	{
		$todayDate = date('Y-m-d');
		echo $before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		echo "<br>";
    	$tickets = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 48 && $hourDiff < 49) {                                                                    //Type: 6, Hour Diff: 48 Start
				
				$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(19);
		        $ccUsers = User::whereIn('id', [3, 8, 9, 16, 17])->get();

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
		                                <h2>Final Receipient (After 48 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01713009891';     //19Yeamin
		        $smsBody = "Final Receipient (After 48 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail sent successfully after 48 hours';                                    //Type: 6, Hour Diff: 48 End

			}
    	}
	}

	public function logistics24HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 24 && $hourDiff < 25) {                                                                  //Type: 7, Hour Diff: 24 Start
    			
    			$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(18);
		        $ccUsers = User::whereIn('id', [2, 8, 9, 14])->get();

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
		                                <h2>Second Receipient (After 24 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01713041237';     //18Khairul
		        $smsBody = "Second Receipient (After 24 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail send & Ticket created successfully';                                 //Type: 7, Hour Diff: 24 End

    		}
    	}
	}

	public function logistics48HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 48 && $hourDiff < 49) {                                                                 //Type: 7, Hour Diff: 48 Start
				
				$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(19);
		        $ccUsers = User::whereIn('id', [2,8, 9, 14, 18])->get();

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
		                                <h2>Final Receipient (After 48 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01713009891';     //19Yeamin
		        $smsBody = "Final Receipient (After 48 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail sent successfully after 48 hours';                                    //Type: 7, Hour Diff: 48 End

			}
    	}
	}

	public function callCenter24HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 8)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 24 && $hourDiff < 25) {                                                                    //Type: 8, Hour Diff: 24 Start
    			
    			$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(12);
		        $ccUsers = User::whereIn('id', [8, 9, 11, 14])->get();

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
		                                <h2>Second Receipient (After 24 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01711505949';     //12Maruf
		        $smsBody = "Second Receipient (After 24 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail send & Ticket created successfully';                                 //Type: 8, Hour Diff: 24 End

    		}
    	}
	}

	public function callCenter48HoursMail()
	{
		$todayDate = date('Y-m-d');
		$before3DayData = date( 'Y-m-d', strtotime( $todayDate . ' -3 day' ) );
		
    	$tickets = Ticket::where('ticket_type_id', 8)->where('ticket_status_id', 1)->whereBetween('created_at', [ $before3DayData.' 00:00:00', date('Y-m-d H:i:s')])->get();

    	foreach ($tickets as $ticket) {

    		$createdAtSec = strtotime(date($ticket->created_at));
			$nowSec = strtotime(date('Y-m-d H:i:s'));
			$secDiff = $nowSec - $createdAtSec;
			$hourDiff = $secDiff / 3600;

    		if ($hourDiff >= 48 && $hourDiff < 49) {                                                                  //Type: 8, Hour Diff: 48 Start
				
				$ticketFind = Ticket::with(['assigned', 'ticketType', 'ticketStatus'])->find($ticket->id);

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

		        $mailUser = User::find(20);
		        $ccUsers = User::whereIn('id', [8, 9, 11, 12, 14])->get();

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
		                                <h2>Final Receipient (After 48 Hours) Not Yet Solved</h2>
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
		                                  
		                                </table>
		                                </body>
		                                </html>';
		            $mail->send();
		            echo 'Message has been sent';
		        } catch (Exception $e) {
		            echo 'Message could not be sent.';
		            echo 'Mailer Error: ' . $mail->ErrorInfo;
		        }

		        $casperUser = 'farzana';
		        $smsPhoneNumber = '01819239613';     //20Basher
		        $smsBody = "Final Receipient (After 48 Hours) Tid: ".$ticketFind->id.",Sub: ".$ticketFind->subject.",Cno: ".$ticketFind->phone_number.",Cname: ".$ticketFind->customer_name.",Cadd: ".$ticketFind->customer_address.",".$policeStation.",".$district.",ProductModel: ".$ticketFind->product_name_with_model.",CallType: ".$ticketFind->call_type.",Ino: ".$ticketFind->invoice_no.",Jno: ".$ticketFind->job_no.",W/P: ".$ticketFind->warranty_or_paid.",TP: ".$ticketFind->tp_or_engineer_name;

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

		        echo 'SMS: '.$smsFeedBack.', Mail sent successfully after 48 hours';                                    //Type: 8, Hour Diff: 48 End

			}
    	}
	}

}

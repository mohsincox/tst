<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\Ticket;
use App\User;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use Illuminate\Support\Facades\Input;

class Crontab2Controller extends Controller
{
    public function service()
    {
    	$todayDate = date('Y-m-d');
        $before1DayData = date( 'Y-m-d', strtotime( $todayDate . ' -1 day' ) );
        $before2DayData = date( 'Y-m-d', strtotime( $todayDate . ' -2 day' ) );
        $startDateTime = $before2DayData.' 18:00:00';
        $endDateTime = $before1DayData.' 17:59:59';
        
        // $startDateTime = $before1DayData.' 00:00:00';
        // $endDateTime = $before1DayData.' 23:59:59';
        // echo $before1DayData = date( 'Y-m-d', strtotime( $todayDate . ' -1 day' ) );
        // echo "<br>";
        $ACserAllCount  = Ticket::where('ticket_type_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        //$ACserNewCount  = Ticket::where('ticket_type_id', 1)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $ACserPenCount  = Ticket::where('ticket_type_id', 1)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $ACserAnsCount  = Ticket::where('ticket_type_id', 1)->where('ticket_status_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $ACserCloCount  = Ticket::where('ticket_type_id', 1)->where('ticket_status_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();

        $HAserAllCount  = Ticket::where('ticket_type_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        //$HAserNewCount  = Ticket::where('ticket_type_id', 2)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $HAserPenCount  = Ticket::where('ticket_type_id', 2)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $HAserAnsCount  = Ticket::where('ticket_type_id', 2)->where('ticket_status_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $HAserCloCount  = Ticket::where('ticket_type_id', 2)->where('ticket_status_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();

        $AVserAllCount  = Ticket::where('ticket_type_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        //$AVserNewCount  = Ticket::where('ticket_type_id', 3)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $AVserPenCount  = Ticket::where('ticket_type_id', 3)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $AVserAnsCount  = Ticket::where('ticket_type_id', 3)->where('ticket_status_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $AVserCloCount  = Ticket::where('ticket_type_id', 3)->where('ticket_status_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();

        $FRserAllCount  = Ticket::where('ticket_type_id', 4)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        //$FRserNewCount  = Ticket::where('ticket_type_id', 4)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $FRserPenCount  = Ticket::where('ticket_type_id', 4)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $FRserAnsCount  = Ticket::where('ticket_type_id', 4)->where('ticket_status_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $FRserCloCount  = Ticket::where('ticket_type_id', 4)->where('ticket_status_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();

        $SAserAllCount  = Ticket::where('ticket_type_id', 5)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        //$SAserNewCount  = Ticket::where('ticket_type_id', 5)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $SAserPenCount  = Ticket::where('ticket_type_id', 5)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $SAserAnsCount  = Ticket::where('ticket_type_id', 5)->where('ticket_status_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $SAserCloCount  = Ticket::where('ticket_type_id', 5)->where('ticket_status_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();

        $ACserTotalPenCount = Ticket::where('ticket_type_id', 1)->where('ticket_status_id', 1)->where('created_at', '<=', $endDateTime)->count();
        $HAserTotalPenCount = Ticket::where('ticket_type_id', 2)->where('ticket_status_id', 1)->where('created_at', '<=', $endDateTime)->count();
        $AVserTotalPenCount = Ticket::where('ticket_type_id', 3)->where('ticket_status_id', 1)->where('created_at', '<=', $endDateTime)->count();
        $FRserTotalPenCount = Ticket::where('ticket_type_id', 4)->where('ticket_status_id', 1)->where('created_at', '<=', $endDateTime)->count();
        $SAserTotalPenCount = Ticket::where('ticket_type_id', 5)->where('ticket_status_id', 1)->where('created_at', '<=', $endDateTime)->count();

    	$mailUser = User::find(9);
        $ccUsers = User::whereIn('id', [4, 5, 6, 8, 14, 35])->get();
        // $mailUser = User::find(8);
        // $ccUsers = User::whereIn('id', [11, 13])->get();

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
            //$mail->addCC('khan@example.com');
            foreach($ccUsers as $ccUser)
            {
               $mail->addCC($ccUser->email, $ccUser->name);
            }
           
            $mail->isHTML(true);                                 
            $mail->Subject = 'Service Tickets of ' . $before1DayData;
            $mail->Body    = '<html>
                <head>
                    <style>
                        table, th, td {
                            border: 1px solid black;
                            border-collapse: collapse;
                        }
                        th, td {
                            padding: 10px;
                        }
                        td {
                            text-align: right;
                        }
                    </style>
                </head>
                <body>
                    <b><p style="color: red;">Service (AC) Total Pending Ticket: '.$ACserTotalPenCount.'</p></b>
                    <b><p style="color: red;">Service (HA) Total Pending Ticket: '.$HAserTotalPenCount.'</p></b>
                    <b><p style="color: red;">Service (AV) Total Pending Ticket: '.$AVserTotalPenCount.'</p></b>
                    <b><p style="color: red;">Service (Front) Total Pending Ticket: '.$FRserTotalPenCount.'</p></b>
                    <b><p style="color: red;">Service (Samsung) Total Pending Ticket: '.$SAserTotalPenCount.'</p></b>
                    <p>Date: '.$before1DayData.'</p>
                    <table>
                        <tr>
                            <td colspan="6"><center><b>Service</b></cente></td>
                        </tr>
                        <tr>
                            <th>Section</th>
                            <th>Generated</th> 
                            <th>Pending</th>
                            <th>Feedback Given</th>
                            <th>Closed</th>
                        </tr>
                        <tr>
                            <td>AC</td>
                            <td>'.$ACserAllCount.'</td>
                            <td>'.$ACserPenCount.'</td>
                            <td>'.$ACserAnsCount.'</td>
                            <td>'.$ACserCloCount.'</td>
                        </tr>
                        <tr>
                            <td>HA</td>
                            <td>'.$HAserAllCount.'</td>
                            <td>'.$HAserPenCount.'</td>
                            <td>'.$HAserAnsCount.'</td>
                            <td>'.$HAserCloCount.'</td>
                        </tr>
                        <tr>
                            <td>AV</td>
                            <td>'.$AVserAllCount.'</td>
                            <td>'.$AVserPenCount.'</td>
                            <td>'.$AVserAnsCount.'</td>
                            <td>'.$AVserCloCount.'</td>
                        </tr>
                        <tr>
                            <td>Front</td>
                            <td>'.$FRserAllCount.'</td>
                            <td>'.$FRserPenCount.'</td>
                            <td>'.$FRserAnsCount.'</td>
                            <td>'.$FRserCloCount.'</td>
                        </tr>
                        <tr>
                            <td>Samsung</td>
                            <td>'.$SAserAllCount.'</td>
                            <td>'.$SAserPenCount.'</td>
                            <td>'.$SAserAnsCount.'</td>
                            <td>'.$SAserCloCount.'</td>
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

        echo ', Mail has been sent successfully';
    }

    public function sales()
    {
    	$todayDate = date('Y-m-d');
        $before1DayData = date( 'Y-m-d', strtotime( $todayDate . ' -1 day' ) );
        $before2DayData = date( 'Y-m-d', strtotime( $todayDate . ' -2 day' ) );
        $startDateTime = $before2DayData.' 18:00:00';
        $endDateTime = $before1DayData.' 17:59:59';

        $salesAllCount = Ticket::where('ticket_type_id', 6)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        //$salesNewCount  = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $salesPenCount = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $salesAnsCount = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $salesCloCount = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();

        $slaesTotalPenCount = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 1)->where('created_at', '<=', $endDateTime)->count();

    	// $music_file = Input::file('featured_mp3'); 
    	// if(isset($music_file)){ 
    	// 	$filename = $music_file->getClientOriginalName(); 
    	// 	$location = public_path('audio/'); $music_file->move($location,$filename);
    	// }
    	
        $mailUser = User::find(3);
        $ccUsers = User::whereIn('id', [8, 9, 14, 16, 17, 35])->get();
        // $mailUser = User::find(8);
        // $ccUsers = User::whereIn('id', [11, 13])->get();

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
            //$mail->addCC('khan@example.com');
            foreach($ccUsers as $ccUser)
            {
               $mail->addCC($ccUser->email, $ccUser->name);
            }
         //    if(isset($filename)) {
         //    	$mail->addAttachment('/srv/www/htdocs/transcomticket/public/audio/'.$filename);
        	// }
           
            $mail->isHTML(true);                                 
            $mail->Subject = 'Sales Tickets of ' . $before1DayData;
            $mail->Body    = '<html>
                <head>
                    <style>
                        table, th, td {
                            border: 1px solid black;
                            border-collapse: collapse;
                        }
                        th, td {
                            padding: 10px;
                        }
                        td {
                            text-align: right;
                        }
                    </style>
                </head>
                <body>
                    <b><p style="color: red;">Sales Total Pending Ticket: '.$slaesTotalPenCount.'</p></b>
                    <p>Date: '.$before1DayData.'</p>
                    <table>
                        <tr>
                            <td colspan="6"><center><b>Sales</b></cente></td>
                        </tr>
                        <tr>
                            <th>Section</th>
                            <th>Generated</th> 
                            <th>Pending</th>
                            <th>Feedback Given</th>
                            <th>Closed</th>
                        </tr>
                        <tr>
                            <td>Sales</td>
                            <td>'.$salesAllCount.'</td>
                            <td>'.$salesPenCount.'</td>
                            <td>'.$salesAnsCount.'</td>
                            <td>'.$salesCloCount.'</td>
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

        echo ', Mail has been sent successfully';
    }

    public function logistics()
    {
    	$todayDate = date('Y-m-d');
        $before1DayData = date( 'Y-m-d', strtotime( $todayDate . ' -1 day' ) );
        $before2DayData = date( 'Y-m-d', strtotime( $todayDate . ' -2 day' ) );
        $startDateTime = $before2DayData.' 18:00:00';
        $endDateTime = $before1DayData.' 17:59:59';

        $logisticsAllCount = Ticket::where('ticket_type_id', 7)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        //$logisticsNewCount  = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $logisticsPenCount = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $logisticsAnsCount = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $logisticsCloCount = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 4)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();

        $logisticsTotalPenCount = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 1)->where('created_at', '<=', $endDateTime)->count();

    	$mailUser = User::find(2);
        $ccUsers = User::whereIn('id', [8, 9, 14, 18, 35])->get();
        // $mailUser = User::find(8);
        // $ccUsers = User::whereIn('id', [11, 13])->get();

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
            //$mail->addCC('khan@example.com');
            foreach($ccUsers as $ccUser)
            {
               $mail->addCC($ccUser->email, $ccUser->name);
            }
           
            $mail->isHTML(true);                                 
            $mail->Subject = 'Logistics Tickets of ' . $before1DayData;
            $mail->Body    = '<html>
                <head>
                    <style>
                        table, th, td {
                            border: 1px solid black;
                            border-collapse: collapse;
                        }
                        th, td {
                            padding: 10px;
                        }
                        td {
                            text-align: right;
                        }
                    </style>
                </head>
                <body>
                    <b><p style="color: red;">Logistics Total Pending Ticket: '.$logisticsTotalPenCount.'</p></b>
                    <p>Date: '.$before1DayData.'</p>
                    <table>
                        <tr>
                            <td colspan="6"><center><b>Logistics</b></cente></td>
                        </tr>
                        <tr>
                            <th>Section</th>
                            <th>Generated</th> 
                            <th>Pending</th>
                            <th>Feedback Given</th>
                            <th>Closed</th>
                        </tr>
                        <tr>
                            <td>Logistics</td>
                            <td>'.$logisticsAllCount.'</td>
                            <td>'.$logisticsPenCount.'</td>
                            <td>'.$logisticsAnsCount.'</td>
                            <td>'.$logisticsCloCount.'</td>
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

        echo ', Mail has been sent successfully';
    }

    public function management()
    {
    	$todayDate = date('Y-m-d');
        $before1DayData = date( 'Y-m-d', strtotime( $todayDate . ' -1 day' ) );
        $before2DayData = date( 'Y-m-d', strtotime( $todayDate . ' -2 day' ) );
        $startDateTime = $before2DayData.' 18:00:00';
        $endDateTime = $before1DayData.' 17:59:59';

        $salesAllCount  = Ticket::where('ticket_type_id', 6)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        //$salesNewCount  = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $salesPenCount  = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $salesAnsCount  = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $salesCloCount  = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();

        $serviceAllCount  = Ticket::whereIn('ticket_type_id', [1, 2, 3, 4, 5])->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        //$serviceNewCount  = Ticket::whereIn('ticket_type_id', [1, 2, 3, 4, 5])->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $servicePenCount  = Ticket::whereIn('ticket_type_id', [1, 2, 3, 4, 5])->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $serviceAnsCount  = Ticket::whereIn('ticket_type_id', [1, 2, 3, 4, 5])->where('ticket_status_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $serviceCloCount  = Ticket::whereIn('ticket_type_id', [1, 2, 3, 4, 5])->where('ticket_status_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();

        $logisticsAllCount  = Ticket::where('ticket_type_id', 7)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        //$logisticsNewCount  = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $logisticsPenCount  = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 1)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $logisticsAnsCount  = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 2)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();
        $logisticsCloCount  = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 3)->whereBetween('created_at', [$startDateTime, $endDateTime])->count();

        $salesTotalPenCount = Ticket::where('ticket_type_id', 6)->where('ticket_status_id', 1)->where('created_at', '<=', $endDateTime)->count();
        $serviceTotalPenCount = Ticket::whereIn('ticket_type_id', [1, 2, 3, 4, 5])->where('ticket_status_id', 1)->where('created_at', '<=', $endDateTime)->count();
        $logisticsTotalPenCount = Ticket::where('ticket_type_id', 7)->where('ticket_status_id', 1)->where('created_at', '<=', $endDateTime)->count();

    	$mailUser = User::find(19);
        $ccUsers = User::whereIn('id', [3, 8, 9, 11, 14, 16, 17, 18, 20, 35])->get();
        // $mailUser = User::find(8);
        // $ccUsers = User::whereIn('id', [11, 13])->get();

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
            //$mail->addCC('khan@example.com');
            foreach($ccUsers as $ccUser)
            {
               $mail->addCC($ccUser->email, $ccUser->name);
            }
           
            $mail->isHTML(true);                                 
            $mail->Subject = 'Management Tickets of ' . $before1DayData;
            $mail->Body    = '<html>
                <head>
                    <style>
                        table, th, td {
                            border: 1px solid black;
                            border-collapse: collapse;
                        }
                        th, td {
                            padding: 10px;
                        }
                        td {
                            text-align: right;
                        }
                    </style>
                </head>
                <body>
                    <b><p style="color: red;">Sales Total Pending Ticket: '.$salesTotalPenCount.'</p></b>
                    <b><p style="color: red;">Service Total Pending Ticket: '.$serviceTotalPenCount.'</p></b>
                    <b><p style="color: red;">Logistics Total Pending Ticket: '.$logisticsTotalPenCount.'</p></b>
                    <p>Date: '.$before1DayData.'</p>
                    <table>
                        <tr>
                            <td colspan="6"><center><b>Management</b></cente></td>
                        </tr>
                        <tr>
                            <th>Section</th>
                            <th>Generated</th> 
                            <th>Pending</th>
                            <th>Feedback Given</th>
                            <th>Closed</th>
                        </tr>
                        <tr>
                            <td>Sales</td>
                            <td>'.$salesAllCount.'</td>
                            <td>'.$salesPenCount.'</td>
                            <td>'.$salesAnsCount.'</td>
                            <td>'.$salesCloCount.'</td>
                        </tr>
                        <tr>
                            <td>Service</td>
                            <td>'.$serviceAllCount.'</td>
                            <td>'.$servicePenCount.'</td>
                            <td>'.$serviceAnsCount.'</td>
                            <td>'.$serviceCloCount.'</td>
                        </tr>
                        <tr>
                            <td>Logistics</td>
                            <td>'.$logisticsAllCount.'</td>
                            <td>'.$logisticsPenCount.'</td>
                            <td>'.$logisticsAnsCount.'</td>
                            <td>'.$logisticsCloCount.'</td>
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

        echo ', Mail has been sent successfully';
    }
}

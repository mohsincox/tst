<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\Department;
use App\Models\Ticket;
use Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Config;

class DepartmentController extends Controller
{
    public function __construct()
    {
        //$this->middleware('auth');
    }

    public function index()
    {
        $departments = Department::get();
        return view('department.index', compact('departments'));
    }

    public function create()
    {
        return view('department.create');
    }

    public function store(Request $request)
    {
        $input = Input::all();
        $rules = [
            'name' => 'required|unique:departments'
        ];
        $messages = [
            'name.required' => 'The Department field is required.',
            'name.unique' => 'The Department already exist.'
        ];
        
        $validator = Validator::make($input, $rules, $messages);
        if ($validator->fails()) {
            flash()->error('Something Wrong!');
            return redirect()->back()
                        ->withErrors($validator)
                        ->withInput();
        }
        $department = new Department;
        $department->name = $request->name;
        $department->created_by = Auth::id();
        $department->save();
        flash()->success($department->name.' Department created successfully');
        return redirect('department');
    }

    public function edit($id)
    {
        $department = Department::find($id);
        return view('department.edit', compact('department'));
    }
    
    public function update(Request $request, $id)
    {
        $department = Department::find($id);
        $input = Input::all();
        $rules = [
            'name' => 'required|unique:departments,name,'.$department->id,
        ];
        $messages = [
            'name.required' => 'The Department field is required.',
            'name.unique' => 'The Department already exist.'
        ];
        
        $validator = Validator::make($input, $rules, $messages);
        if ($validator->fails()) {
            flash()->error('Something Wrong!');
            return redirect()->back()
                        ->withErrors($validator)
                        ->withInput();
        }
        $department->name = $request->name;
        $department->updated_by = Auth::id();
        $department->save();
        flash()->success($department->name.' Department updated successfully');
        return redirect('department');
    }

    public function apiTest(Request $request)
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
            // $tickets = Ticket::with(['assigned'])->whereBetween('created_at', [$startDate, $endDate])->get();

            // $someArray = [];

            // foreach ($tickets as $ticket) {
            //     array_push($someArray, [
            //         'id' => $ticket->id,
            //         'subject' => $ticket->subject,
            //         'customer_name' => $ticket->customer_name,
            //         'phone_number' => $ticket->phone_number,
            //         'assigned' => $ticket->assigned->name
                    
            //     ]);
            // }

            // $someJSON = json_encode($someArray);
            //echo $someJSON;

            //return $comment = Ticket::find(39)->comments()->get();

            //return $tickets = Ticket::select(['id', 'subject', 'assigned_id'])->with(['assigned', 'ticketDetails', 'ticketDetails.ticketStatus'])->whereBetween('created_at', [$startDate, $endDate])->get();

    //         Post::with(array('user'=>function($query){
    //     $query->select('id','username');
    // }))->get();

            // return $tickets = Ticket::select(['id', 'subject', 'assigned_id'])->with(array('assigned'=>function($query){
            //     $query->select('name','email');
            // }))->whereBetween('created_at', [$startDate, $endDate])->get();

            /* $tickets = Ticket::with(['assigned', 'ticketDetails', 'ticketDetails.ticketStatus'])->whereBetween('created_at', [$startDate, $endDate])->get();

            $someArray = [];
            $someArray2 = [];

            foreach ($tickets as $ticket) {

                $someArray['ticketInfo'] = [
                    'ticketId' => $ticket->id,
                    'subject' => $ticket->subject,
                    'customer_name' => $ticket->customer_name,
                    'phone_number' => $ticket->phone_number,
                    'assigned' => $ticket->assigned->name
                ];

                foreach ($ticket->ticketDetails as $ticketDetail) {
                    //echo $ticketDetail->ticketStatus->name;
                    $someArray['detailsInfo'][] = [
                        'detailsId' => $ticketDetail->id,
                        'status' => $ticketDetail->ticketStatus->name,
                        'createdAt' => $ticketDetail->created_at->toDateTimeString()
                    ];
                    //array_push($someArray, $someArray);
                }

                array_push($someArray2, $someArray); //all push in last error
            }

             $someJSON = json_encode($someArray2);
             echo $someJSON; */


            $tickets = Ticket::with(['assigned', 'ticketType', 'policeStation', 'district','ticketDetails.ticketStatus'])->whereBetween('created_at', [$startDate, $endDate])->get();
    
            $data = [];

            foreach($tickets as $ticket) {
                
                $ticketInfo = [
                    'ticketId' => $ticket->id,
                    'subject' => $ticket->subject,
                    'PIC' => $ticket->assigned->name,
                    'ticketType' => $ticket->ticketType->name,
                    'callType' => $ticket->call_type,
                    'customerNumber' => $ticket->phone_number,
                    'customerName' => $ticket->customer_name,
                    'customerAddress' => $ticket->customer_address,
                    'policeStation' => $ticket->policeStation->name,
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
            // $a = json_encode($data);
            // $str = substr($a, 1, -1);
            // echo '{'.$str.'}'; 
        }
    }

    public function file()
    {
        echo '<form method="post" action="http://192.168.100.9/transcomticket/index.php/sales-wise-mail" enctype="multipart/form-data">'.csrf_field().'
  <input type="file" name="featured_mp3" id="featured_mp3" />
  
  <input type="submit" value="Submit">
</form>';
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Models\SmsToPhoneNumber;

class SmsSendController extends Controller
{
    public function __construct()
    {
    	$this->middleware('auth');
    }

    public function index()
    {
        $messages = SmsToPhoneNumber::with('createdBy')->orderBy('created_at', 'desc')->get();
        return view('sms.index', compact('messages'));
    }

    public function create()
    {
    	return view('sms.create');
    }

    public function store(Request $request)
    {
    	$input = Input::all();
        $rules = [
        	'phone_number' => 'required|numeric|digits_between:11,11',
            'message' => 'required|max:120'
        ];
        $messages = [

       	];
        
        $validator = Validator::make($input, $rules, $messages);
        if ($validator->fails()) {
            flash()->error('Something Wrong!');
            return redirect()->back()
                        ->withErrors($validator)
                        ->withInput();
        }

        
        $casperUser = Auth::user()->name;
        $smsPhoneNumber = $request->phone_number;
        $smsBody = $request->message;

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

        $sms = new SmsToPhoneNumber;
        $sms->phone_number = $smsPhoneNumber;
        $sms->message = $smsBody;
        $sms->created_by = Auth::id();
        $sms->save();

        flash()->success('SMS: '.$smsFeedBack.', message sent successfully to '.$smsPhoneNumber);
        //flash()->success(', message sent successfully');
        return redirect('sms-send');
    }
}

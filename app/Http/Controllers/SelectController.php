<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\Select;
use Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Session;

class SelectController extends Controller
{
    public function __construct()
    {
    	$this->middleware('auth');
    }

    public function postExe()
    {
        //1st Get approach   
        // $ch = curl_init();
        // curl_setopt($ch, CURLOPT_URL, 'http://localhost/transcom-ticketing/select-get-store');
        // curl_setopt($ch, CURLOPT_HEADER, 0);
        // curl_exec($ch);
        // curl_close($ch);

        //2nd Get approach 
        //file_get_contents('http://localhost/transcom-ticketing/select-get-store?name=value2222');



        //1st POST approach excep laravel token
        
        $url = 'http://202.53.171.126/e.api/api/transcom-digital-sms-gateway/send-message';
        $data = array('MobileNo' => '01758214966', 'SendUserName' => 'niwwwwwrob', 'Message' => 'Hamba International Message');

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

        //$token = csrf_token();      //not warking in laravel post
        //'_token'=>urlencode($token)

        //2nd POST approach excep laravel token
        /*
        $url = 'http://localhost/testing/like-api/post-insert.php';
        $fields = array(
                    'name'=>urlencode('hamba')
                );

        //url-ify the data for the POST
        $fields_string='';
        foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
        $fields_string = rtrim($fields_string,'&');

        //open connection
        $ch = curl_init();

        //set the url, number of POST vars, POST data
        curl_setopt($ch,CURLOPT_URL,$url);
        curl_setopt($ch,CURLOPT_POST,count($fields));
        curl_setopt($ch,CURLOPT_POSTFIELDS,$fields_string);

        //execute post
        $result = curl_exec($ch);
        print $result;
        */
       

    }

    public function getStore(Request $request)
    {
        
        $select = new Select;
        $select->name = $request->name;
        //$select->created_by = Auth::id();
        $select->save();
        flash()->success($select->name.' Select Name created successfully');
        return redirect('select');
    }

    public function index()
    {
    	$selects = Select::get();
    	return view('select.index', compact('selects'));
    }

    public function create()
    {
    	return view('select.create');
    }

    public function store(Request $request)
    {
        //return $request->all();
    	$input = Input::all();
	    $rules = [
	    	'name' => 'required|unique:selects'
	    ];
	    $messages = [
            'name.required' => 'The Select Name field is required.',
            'name.unique' => 'The Select Name already exist.'
        ];
	    
    	$validator = Validator::make($input, $rules, $messages);
        if ($validator->fails()) {
        	flash()->error('Something Wrong!');
            return redirect()->back()
                        ->withErrors($validator)
                        ->withInput();
        }
        $select = new Select;
        $select->name = $request->name;
        $select->created_by = Auth::id();
        $select->save();
        flash()->success($select->name.' Select Name created successfully');
    	return redirect('select');
    }

    public function edit($id)
    {
    	$select = Select::find($id);
    	return view('select.edit', compact('select'));
    }
    
    public function update(Request $request, $id)
    {
    	$select = Select::find($id);
    	$input = Input::all();
	    $rules = [
	    	'name' => 'required|unique:selects,name,'.$select->id,
	    ];
	    $messages = [
            'name.required' => 'The Select Name field is required.',
            'name.unique' => 'The Select Name already exist.'
        ];
	    
    	$validator = Validator::make($input, $rules, $messages);
        if ($validator->fails()) {
        	flash()->error('Something Wrong!');
            return redirect()->back()
                        ->withErrors($validator)
                        ->withInput();
        }
        $select->name = $request->name;
        $select->updated_by = Auth::id();
        $select->save();
        flash()->success($select->name.' Select Name updated successfully');
    	return redirect('select');
    }
}

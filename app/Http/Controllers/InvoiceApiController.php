<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class InvoiceApiController extends Controller
{
	public function __construct()
    {
    	$this->middleware('auth');
    }

    public function index()
    {
    	return view('invoice_api.index');
    }

    public function show(Request $request)
    {
    	//return $request->all();
    	//$mobileNo = 01676260176;
		//$mobileNo = 01713041240;
		//$mobileNo = 01730340633;
    	$mobileNo = $request->mobileNo;
    	$api_url = 'http://202.53.171.126/e.API/api/consumer-details/get-consumer-details?mobileNo=' . $mobileNo;

		$client_id = 'MyOutsourcingLimited';
		$client_secret = 'TxL=y9K';

		$context = stream_context_create(array(
		    'http' => array(
		        'header' => "Authorization: Basic " . base64_encode("$client_id:$client_secret"),
		    ),
		));

		$json = file_get_contents($api_url, false, $context);

		$obj = json_decode($json);
    	return view('invoice_api.show', compact('obj', 'mobileNo'));
    }
}

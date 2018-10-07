<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::auth();

Route::get('/home', 'HomeController@index');

Route::get('/user', 'UserController@index');

Route::get('/department', 'DepartmentController@index');

Route::get('/ticket-type', 'TicketTypeController@index');

Route::get('/ticket-status', 'TicketStatusController@index');

Route::get('/division', 'DivisionController@index');

Route::get('/district', 'DistrictController@index');

Route::get('/testing', 'PoliceStationController@testing');

Route::get('/police-station', 'PoliceStationController@index');

Route::get('/select', 'SelectController@index');

Route::get('/option', 'OptionController@index');

Route::get('/invoice-api', 'InvoiceApiController@index');
Route::post('/invoice-api/show', 'InvoiceApiController@show');

//Route::get('/status-wise-mail', 'CrontabController@statusWiseMail');
Route::get('/service-ac-2hours-mail-sms', 'CrontabController@serviceAC2HoursMail');
Route::get('/service-ac-24hours-mail-sms', 'CrontabController@serviceAC24HoursMail');
Route::get('/service-ha-2hours-mail-sms', 'CrontabController@serviceHA2HoursMail');
Route::get('/service-ha-24hours-mail-sms', 'CrontabController@serviceHA24HoursMail');
Route::get('/service-av-2hours-mail-sms', 'CrontabController@serviceAV2HoursMail');
Route::get('/service-av-24hours-mail-sms', 'CrontabController@serviceAV24HoursMail');
Route::get('/service-front-2hours-mail-sms', 'CrontabController@serviceFront2HoursMail');
Route::get('/service-front-24hours-mail-sms', 'CrontabController@serviceFront24HoursMail');
Route::get('/service-samsung-2hours-mail-sms', 'CrontabController@serviceSamsung2HoursMail');
Route::get('/service-samsung-24hours-mail-sms', 'CrontabController@serviceSamsung24HoursMail');
Route::get('/sales-24hours-mail-sms', 'CrontabController@sales24HoursMail');
Route::get('/sales-48hours-mail-sms', 'CrontabController@sales48HoursMail');
Route::get('/logistics-24hours-mail-sms', 'CrontabController@logistics24HoursMail');
Route::get('/logistics-48hours-mail-sms', 'CrontabController@logistics48HoursMail');
Route::get('/call-center-24hours-mail-sms', 'CrontabController@callCenter24HoursMail');
Route::get('/call-center-48hours-mail-sms', 'CrontabController@call-center48HoursMail');

Route::get('/service-daily-mail', 'Crontab2Controller@service');
Route::get('/sales-daily-mail', 'Crontab2Controller@sales');
Route::get('/logistics-daily-mail', 'Crontab2Controller@logistics');
Route::get('/management-daily-mail', 'Crontab2Controller@management');

Route::get('/api', 'TicketApiController@getData');

Route::get('/api2', 'DepartmentController@apiTest');
Route::get('/form-file', 'DepartmentController@file');

Route::group([ 'middleware' => 'can:ticket_admin-access'], function () {
	
	Route::get('/user/{id}/edit', 'UserController@edit');
	Route::put('/user/{id}', 'UserController@update');

	Route::get('/department/create', 'DepartmentController@create');
	Route::post('/department', 'DepartmentController@store');
	Route::get('/department/{id}/edit', 'DepartmentController@edit');
	Route::put('/department/{id}', 'DepartmentController@update');

	Route::get('/ticket-type/create', 'TicketTypeController@create');
	Route::post('/ticket-type', 'TicketTypeController@store');
	Route::get('/ticket-type/{id}/edit', 'TicketTypeController@edit');
	Route::put('/ticket-type/{id}', 'TicketTypeController@update');

	Route::get('/ticket-status/create', 'TicketStatusController@create');
	Route::post('/ticket-status', 'TicketStatusController@store');
	Route::get('/ticket-status/{id}/edit', 'TicketStatusController@edit');
	Route::put('/ticket-status/{id}', 'TicketStatusController@update');

	Route::get('/division/create', 'DivisionController@create');
	Route::post('/division', 'DivisionController@store');
	Route::get('/division/{id}/edit', 'DivisionController@edit');
	Route::put('/division/{id}', 'DivisionController@update');

	Route::get('/district/create', 'DistrictController@create');
	Route::post('/district', 'DistrictController@store');
	Route::get('/district/{id}/edit', 'DistrictController@edit');
	Route::put('/district/{id}', 'DistrictController@update');

	Route::get('/division-district-show', 'PoliceStationController@divisionDistrictShow');
	Route::get('/police-station/create', 'PoliceStationController@create');
	Route::post('/police-station', 'PoliceStationController@store');
	Route::get('/police-station/{id}/edit', 'PoliceStationController@edit');
	Route::put('/police-station/{id}', 'PoliceStationController@update');

	Route::get('/select/create', 'SelectController@create');
	Route::post('/select', 'SelectController@store');
	Route::get('/select/{id}/edit', 'SelectController@edit');
	Route::put('/select/{id}', 'SelectController@update');
	Route::get('/select-post-exe', 'SelectController@postExe');
	Route::post('/select-get-store', 'SelectController@getStore');

	Route::get('/option/create', 'OptionController@create');
	Route::post('/option', 'OptionController@store');
	Route::get('/option/{id}/edit', 'OptionController@edit');
	Route::put('/option/{id}', 'OptionController@update');

	Route::get('/ticket-report/form', 'TicketController@reportForm');
	Route::post('/ticket-report/download', 'TicketController@reportDownload');

	Route::get('/testZZ', 'TicketController@test');

	Route::get('/mail-test','MailTestController@index'); //Working
	
});

Route::group([ 'middleware' => 'can:agent-access'], function () {

	//Route::get('/ticket/agent/ticket-create-phone-number', 'TicketController@agentCreatePhoneNumber');
	Route::get('/ticket/agent/ticket-create-form', 'TicketController@agentCreateForm');
	Route::get('/ticket/agent/district-ps-show', 'TicketController@DistrictPsShow');
	Route::get('/ticket/agent/type-to-assign', 'TicketController@typeToAssign');
	Route::get('/ticket/agent/type-to-cc', 'TicketController@typeToCC');
	Route::post('/ticket/agent/ticket-store', 'TicketController@agentStore');
	Route::get('/ticket/agent/ticket-date-form', 'TicketController@agentDateForm');
	Route::get('/ticket/agent/ticket', 'TicketController@agentIndex');
	Route::get('/ticket/agent/ticket/{id}', 'TicketController@agentShow');
	Route::get('/ticket/agent/ticket-details/{id}', 'TicketController@agentDetailsShow');
	Route::get('/ticket/agent/ticket/{id}/edit', 'TicketController@agentEdit');
	Route::put('/ticket/agent/ticket/{id}', 'TicketController@agentUpdate');

	Route::get('/ticket/created-by/ticket-date-form', 'CreatedByTicketController@createdByDateForm');
	Route::get('/ticket/created-by/ticket', 'CreatedByTicketController@createdByIndex');
});

Route::group([ 'middleware' => 'can:user-access'], function () {

	Route::get('/ticket/user/ticket-date-form', 'TicketController@userDateForm');
	Route::get('/ticket/user/ticket', 'TicketController@userIndex');
	Route::get('/ticket/user/ticket/{id}', 'TicketController@userShow');
	Route::get('/ticket/user/ticket-details/{id}', 'TicketController@userDetailsShow');
	Route::get('/ticket/user/ticket/{id}/edit', 'TicketController@userEdit');
	Route::put('/ticket/user/ticket/{id}', 'TicketController@userUpdate');
	
	Route::get('/sms-send', 'SmsSendController@index');
	Route::get('/sms-send/create', 'SmsSendController@create');
	Route::post('/sms-send', 'SmsSendController@store');
});


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Transcom</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700">

    <!-- Styles -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    {{-- <link href="{{ elixir('css/app.css') }}" rel="stylesheet"> --}}
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
    <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet">

    <style>
        body {
            font-family: 'Lato';
        }

        .fa-btn {
            margin-right: 6px;
        }
    </style>
    <style type="text/css">
        .alert {
            padding: 2px; 
            margin-bottom: 5px;
        }
    </style>
     @yield('style')
</head>
<body id="app-layout">
    <nav class="navbar navbar-inverse navbar-static-top">
        <div class="container">
            <div class="navbar-header">

                <!-- Collapsed Hamburger -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Branding Image -->
                <a class="navbar-brand" href="{{ url('/home') }}" style="color: #FFFFFF;">
                    Transcom T.S.
                </a>
            </div>

            <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Left Side Of Navbar -->
                <!-- <ul class="nav navbar-nav">
                    <li><a href="{{ url('/home') }}">Home</a></li>
                </ul> -->

                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
                    @if (Auth::guest())
                        <li><a href="{{ url('/login') }}">Login</a></li>
                        <!-- <li><a href="{{ url('/register') }}">Register</a></li> -->
                    @else
                        <li  {{ ( Request::is('division') || Request::is('division/*') || Request::is('district') || Request::is('district/*') || Request::is('police-station') || Request::is('police-station/*') ? 'class=active' : '' ) }}>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                Area <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li {{ ( Request::is('division') || Request::is('division/*') ? 'class=active' : '' ) }} ><a href="{{ url('/division') }}">Division</a></li>
                                <li {{ ( Request::is('district') || Request::is('district/*') ? 'class=active' : '' ) }} ><a href="{{ url('/district') }}">District</a></li>
                                <li {{ ( Request::is('police-station') || Request::is('police-station/*') ? 'class=active' : '' ) }} ><a href="{{ url('/police-station') }}">Police Station</a></li>
                            </ul>
                        </li>
                        <li {{ ( Request::is('user') || Request::is('user/*') ? 'class=active' : '' ) }} ><a href="{{ url('/user') }}">User</a></li>
                        <!-- <li {{ ( Request::is('department') || Request::is('department/*') ? 'class=active' : '' ) }} ><a href="{{ url('/department') }}">Department</a></li> -->
                        <li {{ ( Request::is('ticket-type') || Request::is('ticket-type/*') ? 'class=active' : '' ) }} ><a href="{{ url('/ticket-type') }}">Ticket Type</a></li>
                        <li {{ ( Request::is('ticket-status') || Request::is('ticket-status/*') ? 'class=active' : '' ) }} ><a href="{{ url('/ticket-status') }}">Ticket Status</a></li>
                        <li {{ ( Request::is('ticket') || Request::is('ticket/*') ? 'class=active' : '' ) }}>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                Ticket <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                @can('agent-access')
                                    <li {{ ( Request::is('ticket/agent/ticket-create-form') ? 'class=active' : '' ) }} ><a href="{{ url('/ticket/agent/ticket-create-form') }}">Agent Ticket Create</a></li>
                                    <li {{ ( Request::is('ticket/agent/ticket-date-form') ? 'class=active' : '' ) }} ><a href="{{ url('/ticket/agent/ticket-date-form') }}">Agent Ticket Show</a></li>
                                @endcan
                                @can('user-access')
                                    <li {{ ( Request::is('ticket/user/ticket-date-form') ? 'class=active' : '' ) }} ><a href="{{ url('/ticket/user/ticket-date-form') }}">User Ticket Show</a></li>
                                @endcan
                            </ul>
                        </li>
                        @can('agent-access')
                            <li {{ ( Request::is('ticket/created-by/ticket-date-form') ? 'class=active' : '' ) }} ><a href="{{ url('/ticket/created-by/ticket-date-form') }}">CreatedBy</a></li>
                        @endcan
                        <li {{ ( Request::is('sms-send/create') || Request::is('sms-send/*') ? 'class=active' : '' ) }} ><a href="{{ url('/sms-send') }}">SMS Send</a></li>
                        <li {{ ( Request::is('select') || Request::is('select/*') ? 'class=active' : '' ) }} ><a href="{{ url('/select') }}">Select</a></li>
                        <li {{ ( Request::is('option') || Request::is('option/*') ? 'class=active' : '' ) }} ><a href="{{ url('/option') }}">Option</a></li>
                        <li {{ ( Request::is('invoice-api') || Request::is('invoice-api/*') ? 'class=active' : '' ) }} ><a href="{{ url('/invoice-api') }}">Invoice API</a></li>
                        @can('ticket_admin-access')
                            <li {{ ( Request::is('ticket-report') || Request::is('ticket-report/*') ? 'class=active' : '' ) }} ><a href="{{ url('/ticket-report/form') }}">Download</a></li>
                        @endcan
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                {{ Auth::user()->name }} <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li><a href="{{ url('/logout') }}"><i class="fa fa-btn fa-sign-out"></i>Logout</a></li>
                            </ul>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="col-sm-8 col-sm-offset-2">
            @include('flash::message')
        </div>
    </div>

    @yield('content')

    <div class="container-fluid" style="padding-right: 0px; padding-left: 0px;">
        <div style="background: #222;">
            <center><p style="font-family: 'Open Sans', serif; font-size: 12px; margin-top: 0px; padding: 10px;"><span style="color: #FFFFFF">Developed by</span> <a href="http://myolbd.com/" target="_blank" style="color: red;">MY Outsoursing Limited.</a> <span style="color: #FFFFFF">All Rights Reserved.</span></p></center>
        </div>
    </div>

    <!-- JavaScripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js" integrity="sha384-I6F5OKECLVtK/BL+8iSLDEHowSAfUo76ZL9+kGAgTRdiByINKJaqTPH/QVNS1VDb" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    {{-- <script src="{{ elixir('js/app.js') }}"></script> --}}
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    @yield('script')
    @yield('subscript')
</body>
</html>

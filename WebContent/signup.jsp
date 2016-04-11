<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign Up for PHOTOshare</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/form-elements.css">
        <link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/demo.css">
		<link rel="stylesheet" href="css/header-user-dropdown.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body background="img/bg-home.jpg">
	<header class="header-user-dropdown">

		<div class="header-limiter">
			<h1><a href="">PHOTO<span>share</span></a></h1>
		</div>

	</header>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>Sign Up Form</strong></h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Signup to our site</h3>
                        		</div>
                        		
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="Registration" method="post" class="login-form">
			                    <div style="color:red" >${ErrorInSignup}</div>
			                    	<div class="form-group">
			                    		<label class="sr-only" for="firstname">First Name</label>
			                        	<input type="text" style="color:black" name="firstname" placeholder="First name" class="form-username form-control" id="form-username">
			                        </div>
									<div class="form-group">
			                    		<label class="sr-only" for="lastname">Last name</label>
			                        	<input type="text" style="color:black" name="lastname" placeholder="Last Name" class="form-username form-control" id="form-username">
			                        </div>
									<div class="form-group">
			                    		<label class="sr-only" for="dob">Date of Birth</label>
			                        	<input type="text" name="dob" style="color:black" placeholder="Enter Date of Birth(yyyy-mm-dd)" class="form-username form-control" id="form-username">
			                        </div>
									<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="text" name="userid" style="color:black" placeholder="Username..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                    		<label class="sr-only" for="form-email">Email</label>
			                        	<input type="text" name="emailid" style="color:black" placeholder="Email ID" class="form-username form-control" id="form-username">
			                        </div>
									<div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="password" style="color:black" placeholder="Password" class="form-password form-control" id="form-password">
			                        </div>
									<div class="form-group">
			                        	<label class="sr-only" for="form-repassword">Retype Password</label>
			                        	<input type="password" name="repassword" style="color:black" placeholder="Retype Password" class="form-password form-control" id="form-password">
			                        </div>
			                        <button type="submit" class="btn">Sign Up!</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    
                </div>
            </div>
			            
        </div>
	<div class="panel-footer-inverse">@Copyright || Designed BY</div>

        <!-- Javascript -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>
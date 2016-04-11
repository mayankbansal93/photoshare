<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Share pic</title>

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

    <body  background="img/bg-home.jpg">
    <%String otpcompare=(String)request.getAttribute("otp");
    System.out.println(otpcompare);
    String firstname=(String)request.getAttribute("firstname");
    String lastname=(String)request.getAttribute("lastname");
    String emailid=(String)request.getAttribute("emailid");
    String dob=(String)request.getAttribute("dob");
    String userid=(String)request.getAttribute("userid");
    String password=(String)request.getAttribute("password");
    	%>
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
                            <h1><strong>OTP Fill</strong></h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Enter the OTP</h3>
                            		
                        		</div>
                        		
                            </div>
                            <div class="form-bottom">
                            <div style="color:red" >${ErrorInSignup}</div>
			                    <form role="form" action="Otpcheck" method="post" class="login-form">
			                    <input type="hidden" name="otpcompare" value="<%=otpcompare%>">
			                    <input type="hidden" name="firstname" value="<%=firstname%>">
			                    <input type="hidden" name="lastname" value="<%=lastname%>">
			                    <input type="hidden" name="userid" value="<%=userid%>">
			                    <input type="hidden" name="emailid" value="<%=emailid%>">
			                    <input type="hidden" name="password" value="<%=password%>">
			                    <input type="hidden" name="dob" value="<%=dob%>">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-otp">OTP</label>
			               
			                        	<input type="text" name="otp" placeholder="Enter the OTP sent to your E-mail" class="form-username form-control" id="form-username">
			                        </div>
			                        
			                        <button type="submit" class="btn">Submit</button>
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
        <script src="js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>
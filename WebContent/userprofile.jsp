<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="home.css" rel="stylesheet">
	
	<link rel="stylesheet" href="css/home/demo.css">
	<link rel="stylesheet" href="css/home/header-user-dropdown.css">
	<link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
	
	<link href="css/gallery/gallery.css" rel="stylesheet">
	
	<link rel="stylesheet" href="css/form-elements.css">

	
	<title>Profile Information</title>
	
	

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
</head>

<body background="img/bg-home.jpg">

<header class="header-user-dropdown">
	<%
		String firstname=(String)request.getAttribute("firstname");
		String lastname=(String)request.getAttribute("lastname");
		String userid=(String)request.getAttribute("userid");
		String emailid=(String)request.getAttribute("emailid");
		String fullname=(String)request.getAttribute("fullname");
		String dob=(String)request.getAttribute("dob");
		String imagename=(String)request.getAttribute("imagename");
		String image16array=(String)request.getAttribute("image16array");
	 	
		String image_16array[]=image16array.split(",");
		String image_name[]=imagename.split(",");
		
	%>
	<div class="header-limiter">
		<h1><a href="homenew.html">PHOTO<span>share</span></a></h1>

		<div class="header-user-menu" >
			<img src="img/userpic.png" alt="User Image"/>

			<ul style="margin-top:15px;">
				<li><button href="profileview.html" class="btn-sm" style="background:transparent; border:0px;">Profile</button></li>
				<li><button href="#" class="btn-sm" style="background:transparent; border:0px;"><span style="color:#ff8000">Log Out</span></button></li>
			</ul>
		</div>

	</div>

</header>


<div class="container" style="padding-top:40px;">
	<div class="jumbotron">
		
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
			
			<a data-toggle="modal" data-target="#userpic"><img src="img/userpic.png" class="img-rounded"></a>
			
			
			<div class="modal fade" id="userpic"  role="dialog" aria-labelledby="profilePic" aria-hidden="true">
				
				<div class="modal-dialog">
				
					<div class="modal-content">
				
						<div class="modal-header">
							<h4 class="modal-title" id="profilePic"></h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								&times;
							</button>
						</div>
				
						<div class="modal-body" >
								<img src="img/userpic.png" height="400px" width="400px" class="img img-responsive img-rounded center-block" >
						</div>
					</div>
				
				</div>
				
			</div>
			
			
			</div>
			<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
			<br>
			<br>
			<br>
			<br>
			<br>
			<p style="font-size:20px;"><b><%=fullname %></b></p>
			<p style="font-size:15px;">@<%=userid %></p>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<p align="right" style="font: 20px;"><b><%=image_name.length %></b> posts</p>
			</div>
		</div>
		
		
		<div class="container-fluid">
		<br>
		<br>
		<br>
			<a data-toggle="modal" data-target="#updateProfile" class="btn btn-danger" align="right">Update Information</a>
		
				<div class="modal fade" id="updateProfile"  role="dialog" aria-labelledby="updateModal" aria-hidden="true">
				
					<div class="modal-dialog">
				
						<div class="modal-content">
				
						<div class="modal-header">
							<h4 class="modal-title" id="updateModal">Enter New Information</h4>
						</div>
				
						<div class="modal-body">
						
						
						<div class="form-bottom">
			                    <form role="form" action="UpdateUserProfile" method="post" class="login-form">
			                    <div style="color:red">${errorMessage}</div>
			                    <input type="hidden" name="userid" value="<%=userid %>">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="firstname">First Name</label>
			                        	<input type="text" name="firstname" placeholder="<%=firstname %>" class="form-username form-control" id="form-username">
			                        </div>
									<div class="form-group">
			                    		<label class="sr-only" for="lastname">Last name</label>
			                        	<input type="text" name="lastname" placeholder="<%=lastname %>" class="form-username form-control" id="form-username">
			                        </div>
									<div class="form-group">
			                    		<label class="sr-only" for="dob">Date of Birth</label>
			                        	<input type="text" name="dob" placeholder="<%=dob %>" class="form-username form-control" id="form-username">
			                        </div>
									<div class="form-group">
			                        	<label class="sr-only" for="form-password">New Password</label>
			                        	<input type="password" name="password" placeholder="New Password" class="form-password form-control" id="form-password">
			                        </div>
									<div class="form-group">
			                        	<label class="sr-only" for="form-repassword">Retype New Password</label>
			                        	<input type="password" name="repassword" placeholder="Retype New Password" class="form-password form-control" id="form-password">
			                        </div>
			                        <button type="submit" class="btn" data-dismiss="modal">Update!</button>
			                    </form>
		                    </div>
						
										
						</div>
				
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
				
						</div>
				
					</div>
				
				</div>
		
		
		
		
		<br>
		<br>

		<table class="table table-hover">
		<tbody>
			<tr>
				<td><b>Name:</td>
				<td><%=fullname %></td>
			</tr>
			<tr>
				<td><b>DOB:</td>
				<td><%=dob %></td>
			</tr>
			<tr>
				<td><b>E-mail:</td>
				<td><%=emailid %></td>
			</tr>
		</tbody>
		</table>
		<br>
		<br>
		<span style="font:bold 20px Arial, Helvetica, sans-serif;"><u>Uploaded Images</u></span>
		<br>
		</div>
		
		
	<!-- Gallery Carousel Start -->
	<div class="container">
    <div id="main_area">
        <!-- Slider -->
        <div class="row">
            <div class="col-sm-6" id="slider-thumbs">
                <!-- Bottom switcher of slider -->
                <ul class="hide-bullets">
                <%for(int i=0;i<16;i+=4){ %>
                <div class="row">
                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-0"><img src="${pageContext.request.contextPath}/image/<%=image_16array[i]%>"></a>
                    </li>
					
                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-1"><img src="${pageContext.request.contextPath}/image/<%=image_16array[i+1]%>"></a>
                    </li>

                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-2"><img src="${pageContext.request.contextPath}/image/<%=image_16array[i+2]%>"></a>
                    </li>

                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-3"><img src="${pageContext.request.contextPath}/image/<%=image_16array[i+3]%>"></a>
                    </li></div>
                    <%} %>
					
                </ul>
            </div>
            <div class="col-lg-6">
                <div class="col-xs-12" id="slider">
                    <!-- Top part of the slider -->
                    <div class="row">
                        <div class="col-sm-12" id="carousel-bounding-box">
                            <div class="carousel slide" id="myCarousel">
                                <!-- Carousel items -->
                                <div class="carousel-inner">
                                    <div class="active item" data-slide-number="0">
                                        <img src="${pageContext.request.contextPath}/image/<%=image_16array[0] %>" ></div>
									<%for(int i=1;i<image_name.length;i++){ %>
                                    <div class="item" data-slide-number="<%=i%>">
                                        <img src="${pageContext.request.contextPath}/image/<%=image_16array[i] %>"></div>
									<%} %>
                                    
                                </div>
                                <!-- Carousel nav -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/Slider-->
        </div>

    </div>
</div>

<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#all-view">View All Images</button>
	
	<div class="jumbotron collapse" id="all-view" height="0px" width="0px">
		<%int count=image_name.length%3;
		%>
		<% for(int i=0;i<image_name.length-count;i+=3){ %>
		<div class="row" style="padding-top:20px;">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
			<img src="${pageContext.request.contextPath}/image/<%=image_name[i] %>" alt="" id="1" style="width: 200px; height: 120px">
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
            <img src="${pageContext.request.contextPath}/image/<%=image_name[i+1] %>" alt="" id="2" style="width: 200px; height: 120px">
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
            <img src="${pageContext.request.contextPath}/image/<%=image_name[i+2] %>" alt="" id="3" style="width: 200px; height: 120px">
			</div>
		</div>
		<%} %>
		<%if(count==2){
			%>
		<div class="row" style="padding-top:20px;">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
			<img src="${pageContext.request.contextPath}/image/<%=image_name[image_name.length-2] %>" alt="" id="4" style="width: 200px; height: 120px">
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
			<img src="${pageContext.request.contextPath}/image/<%=image_name[image_name.length-1] %>" alt="" id="5" style="width: 200px; height: 120px">
			</div>
		</div>
		<%}else if(count==1){
			%>
			<div class="row" style="padding-top:20px;">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
			<img src="${pageContext.request.contextPath}/image/<%=image_name[image_name.length-1] %>" alt="" id="4" style="width: 200px; height: 120px">
			</div>
		</div>	
		<%} %>	
	</div>

	</div>
</div>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.backstretch.min.js"></script>
<script src="js/scripts.js"></script>

<script language="JavaScript" type="text/javascript">
  $(document).ready(function(){
    $('.carousel').carousel({
      interval: 3000
    })
  });    
</script>  
<script>
    $("#view-all-toggle").click(function(e) {
        e.preventDefault();
        $("#all-view").toggleClass("toggled");
    });
</script>

</body>

</html>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
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

	
	<link rel="stylesheet" href="css/home/demo.css">
	<link rel="stylesheet" href="css/home/header-user-dropdown.css">
	<link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
	
	<link href="css/3dgallery/3dgallery.css" rel="stylesheet">

	
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
	<%String username=(String)request.getAttribute("username");
		String userid=(String)request.getAttribute("userid");
		String imagename=(String)request.getAttribute("imagename");
		String image8array=(String)request.getAttribute("image8array");
	 	int counter=(Integer)request.getAttribute("counter");
		String image_8array[]=image8array.split(",");
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
			<p style="font-size:20px;"><b><%=username %></b></p>
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
			<p align="right" style="font: 20px;"><b><%=counter %></b> posts</p>
			</div>
		</div>
		
		
		<div class="container-fluid">
<!--
		<br>
		<br>
		<br>		
		<br>
		<br>
		<span style="font:bold 25px Arial, Helvetica, sans-serif;">Name:</span><span style="font: 20px Arial, Helvetica, sans-serif;">  Shivi Vats</span>
		<br>
		<span style="font:bold 25px Arial, Helvetica, sans-serif;">DOB:</span><span style="font: 20px Arial, Helvetica, sans-serif;">  07/09/1996</span>
		<br>
		<span style="font:bold 25px Arial, Helvetica, sans-serif;">E-mail:</span><span style="font: 20px Arial, Helvetica, sans-serif;">  shivivats7@gmail.com</span>
		<br>
		<span style="font:bold 25px Arial, Helvetica, sans-serif;">Phone:</span><span style="font: 20px Arial, Helvetica, sans-serif;">  8860008291</span>
		<br>
		-->
		<br>
		<br>
		<span style="font:bold 20px Arial, Helvetica, sans-serif;"><u>Recently Uploaded Images</u></span>
		<br>
		</div>
		
		<div class="container2">
        <div id="carousel">
        <%for(int i=0;i<8;i++){ %>
            <figure><img src="${pageContext.request.contextPath}/image/<%=image_8array[i] %>" alt="" id="<%=i+1 %>" style="width: 200px; height: 120px"></figure>
		<%} %>
        </div>
    </div>
	
	<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#all-view">View All Images</button>
	
	<div class="jumbotron collapse" id="all-view" height="0px" width="0px">
		<%int count=counter%3;
		%>
		<% for(int i=0;i<counter-count;i+=3){ %>
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
			<img src="${pageContext.request.contextPath}/image/<%=image_name[counter-2] %>" alt="" id="4" style="width: 200px; height: 120px">
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
			<img src="${pageContext.request.contextPath}/image/<%=image_name[counter-1] %>" alt="" id="5" style="width: 200px; height: 120px">
			</div>
		</div>
		<%}else if(count==1){
			%>
			<div class="row" style="padding-top:20px;">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
			<img src="${pageContext.request.contextPath}/image/<%=image_name[counter-1] %>" alt="" id="4" style="width: 200px; height: 120px">
			</div>
		</div>	
		<%} %>	
	</div>
	
	</div>
</div>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
 
<script>
    $("#view-all-toggle").click(function(e) {
        e.preventDefault();
        $("#all-view").toggleClass("toggled");
    });
</script>
 
</body>

</html>

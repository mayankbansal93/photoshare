<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.*"%>
<%@page import="org.apache.catalina.Server"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/home/home2.css" rel="stylesheet">
	
	<title>PHOTOshare Home Page</title>
	
    <link rel="stylesheet" href="css/home/demo.css">
	<link rel="stylesheet" href="css/home/header-user-dropdown.css">
	<link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
	

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
   function previewFile(){
       var preview = document.querySelector('img'); //selects the query named img
       var file    = document.querySelector('input[type=file]').files[0]; //sames as here
       var reader  = new FileReader();

       reader.onloadend = function () {
           preview.src = reader.result;
       }

       if (file) {
           reader.readAsDataURL(file); //reads the data as a URL
       } else {
           preview.src = "";
       }
  }

  previewFile();  //calls the function named previewFile()
  </script>
	
</head>

<body background="img/bg-home.jpg">
<%
String password= (String)request.getAttribute("password");
String userid=(String)request.getAttribute("userid");
String useridtopass=(String)request.getAttribute("useridpass");
String like=(String)request.getAttribute("likepass");
String dislike=(String)request.getAttribute("dislikepass");
String usernamepass=(String)request.getAttribute("usernamepass");
String image=(String)request.getAttribute("imagepass");

String useridpass[]=useridtopass.split(",");
String likepass[]=like.split(",");
String dislikepass[]=dislike.split(",");
String imagepass[]=image.split(",");
String usernametopass[]=usernamepass.split(",");

int len=useridpass.length%2;
%>

<header class="header-user-dropdown">

	<div class="header-limiter">
		<h1><a href="homenew.html">PHOTO<span>share</span></a></h1>

		<nav>
			<button type="button" class-"btn btn-link" style="background-color: Transparent; background-repeat:no-repeat; border: none; cursor:pointer; overflow: hidden;">
			<div class="glyphicon glyphicon-random"><a href="#">Random</a></div>
			</button>
			<button type="button" class-"btn btn-link" style="background-color: Transparent; background-repeat:no-repeat; border: none; cursor:pointer; overflow: hidden;">
			<div class="glyphicon glyphicon-heart-empty"><a href="#">Trending</a></div>
			</button>
			<button type="button" class-"btn btn-link" style="background-color: Transparent; background-repeat:no-repeat; border: none; cursor:pointer; overflow: hidden;">
			<div class="glyphicon glyphicon-time"><a href="#">Latest</a></div>
			</button>
			
			<button type="button" class-"btn btn-link" style="background-color: Transparent; background-repeat:no-repeat; border: none; cursor:pointer; overflow: hidden;">
			<div class="glyphicon glyphicon-upload"><a data-toggle="modal" data-target="#upload">Upload</a></div>
			</button>
			
			<div class="modal fade" id="upload"  role="dialog" aria-labelledby="uploadModal" aria-hidden="true">
				
				<div class="modal-dialog">
				<form method="post" enctype="multipart/form-data" action="insertimage">	
					
					<div class="modal-content">
				
						<div class="modal-header">
							<h4 class="modal-title" id="uploadModal"></h4>	
						</div>
				
						<div class="modal-body" >
							<div class="form-group">
								<p class="help-block"><b>Choose image to be uploaded</b></p>
									<input type="file" onchange="previewFile()" name="imagefile" id="imagefile"/><br><!--file name will be in type=file (url saved here)-->
									<img src="" height="200" alt="Image preview...">
							</div>
						</div>
				
						<div class="modal-footer">
						<input type="hidden" name="password" value="<%=password%>"/>
						<input type="hidden" name="userid" value="<%=userid %>" />
					<input type="hidden" name="useridpass" value="<%=useridtopass %>" />
					<input type="hidden" name="likepass" value="<%=like %>" />
					<input type="hidden" name="dislikepass" value="<%=dislike %>" />
					<input type="hidden" name="usernamepass" value="<%=usernamepass %>" />
					<input type="hidden" name="imagepass" value="<%=image %>" />
						<input type="submit" name="submit" value="submit" class="btn btn-default pull-left" />
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
				
					</div>
				</form>
				</div>
				
			</div>
			
			
			
			<!--
			<a href="#"></a>
			<a href="#">Reports</a>
			<a href="#">Roles <span class="header-new-feature">new</span></a>
			-->
		</nav>


		<div class="header-user-menu" >
			<img src="img/userpic.png" alt="User Image"/>

			<ul style="margin-top:15px;">
				<li><form action="userprofile" method="POST" name="username">
				<input type="hidden" name="userid" value="<%=userid %>" />
				<input type="submit" value="Profile" style="background:transparent;">
				</form></li>
				<li><a href="profileview.html">Settings</a></li>
				<li><a href="#" class="highlight">Logout</a></li>
			</ul>
		</div>

	</div>

</header>




<div class="container" style="margin-top:100px;">
<%  for(int i=0;i<(useridpass.length-1);i+=2){
%>
	<div class="row form-group">
        <div class="col-xs-12 col-md-6 col-lg-6">
            <div class="panel panel-default">
			
				<div class="panel-heading">
                    <h3 class="panel-title text-center"><%=usernametopass[i] %><br><a data-toggle="modal" data-target="#aboutShivi" ><span style="font-size:12px;">@<%=useridpass[i] %></span></a></h3>
                </div>
				
				
				<div class="modal fade" id="aboutShivi"  role="dialog" aria-labelledby="shiviModal" aria-hidden="true">
				
				<div class="modal-dialog">
				
				<div class="modal-content">
				
			    <div class="modal-header">
			        <h4 class="modal-title" id="shiviModal">About <%=usernametopass[i] %></h4>
			    </div>
				
			    <div class="modal-body" style="text-align:center;">
										<img src="img/userpic.png" name="about" width="140" height="140" border="0" class="img-circle">
										<h3 class="media-heading"><%=usernametopass[i] %><small>@<%=useridpass[i] %></small></h3>
										<hr>
										<center>
										<form action="otherprofile" method="post">
											<input type="hidden" name="userid" value="<%=useridpass[i] %>" />
											<input type="hidden" name="username" value="<%=usernametopass[i] %>" />
											<input type="submit" value="Visit Profile" >
										</form>
										<br>
										
										</center>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				
			    </div>
				
				</div>
				
				</div>
				
				
				
				
				
				
                <div class="panel-image">
                    <img src="${pageContext.request.contextPath}/image/<%=imagepass[i] %>" class="panel-image-preview" />
                    
                </div>
				
                			
				<div class="panel-footer text-center">
                    <a href="#like"><span class="glyphicon glyphicon-thumbs-up"></span></a>
					<span><%=likepass[i] %></span> <!-- like button -->
                    <a href="#dislike"><span class="glyphicon glyphicon-thumbs-down"></span></a>
					<span><%=dislikepass[i] %></span>  <!-- dislike button -->
					
                </div>
				
            </div>
        </div>
        <div class="col-xs-12 col-md-6 col-lg-6">
            <div class="panel panel-default">
			
				<div class="panel-heading">
                    <h3 class="panel-title text-center"><%=usernametopass[i+1] %><br><a data-toggle="modal" data-target="#aboutAvantika" ><span style="font-size:12px;">@<%=useridpass[i+1] %></span></a></h3>
                </div>
				
				
				
				
				
				<div class="modal fade" id="aboutAvantika"  role="dialog" aria-labelledby="avantikaModal" aria-hidden="true">
				
				<div class="modal-dialog">
				
				<div class="modal-content">
				
			    <div class="modal-header">
			        <h4 class="modal-title" id="avantikaModal">About <%=usernametopass[i+1] %></h4>
			    </div>
				
			    <div class="modal-body" style="text-align:center;">
										<img src="${pageContext.request.contextPath}/image/<%=imagepass[i+1] %>" name="about" width="140" height="140" border="0" class="img-circle">
										<h3 class="media-heading"><%=usernametopass[i+1] %><small> @<%=useridpass[i+1] %></small></h3>
										<hr>
										<center>
										<form action="otherprofile" method="post">
											<input type="hidden" name="userid" value="<%=useridpass[i+1] %>" />
											<input type="hidden" name="username" value="<%=usernametopass[i+1] %>" />
											<input type="submit" value="Visit Profile" >
										</form>
										<br>
										
										</center>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				
			    </div>
				
				</div>
				
				</div>
				
				
				
				
				
				
                <div class="panel-image">
                    <img src="${pageContext.request.contextPath}/image/<%=imagepass[i+1] %>" class="panel-image-preview" />
                    <label for="toggle-2"></label>
                </div>
				
                <input type="checkbox" id="toggle-2" class="panel-image-toggle">
				
				<div class="panel-footer text-center">
                    <a href="#like"><span class="glyphicon glyphicon-thumbs-up"></span></a>
					<span><%=likepass[i+1] %></span>
                    <a href="#dislike"><span class="glyphicon glyphicon-thumbs-down"></span></a>
					<span><%=dislikepass[i+1] %></span>
                </div>
				
            </div>
        </div>   
	</div>
	<%} %>
	<% if(len==1){%>
		<div class="row form-group">
        <div class="col-xs-12 col-md-6 col-lg-6">
            <div class="panel panel-default">
			
				<div class="panel-heading">
                    <h3 class="panel-title text-center"><%=usernametopass[useridpass.length-1] %><br><a data-toggle="modal" data-target="#aboutShivi" ><span style="font-size:12px;">@<%=useridpass[useridpass.length-1] %></span></a></h3>
                </div>
				
				
				<div class="modal fade" id="aboutShivi"  role="dialog" aria-labelledby="shiviModal" aria-hidden="true">
				
				<div class="modal-dialog">
				
				<div class="modal-content">
				
			    <div class="modal-header">
			        <h4 class="modal-title" id="shiviModal">About <%=usernametopass[useridpass.length-1] %></h4>
			    </div>
				
			    <div class="modal-body" style="text-align:center;">
										<img src="${pageContext.request.contextPath}/image/<%=imagepass[useridpass.length-1] %>" name="about" width="140" height="140" border="0" class="img-circle">
										<h3 class="media-heading"><%=usernametopass[useridpass.length-1] %><small>@shivivats</small></h3>
										<hr>
										<center>
										<form action="otherprofile" method="post">
											<input type="hidden" name="userid" value="<%=useridpass[useridpass.length-1] %>" />
											<input type="hidden" name="username" value="<%=usernametopass[useridpass.length-1] %>" />
											<input type="submit" value="Visit Profile" >
										</form>
										<br>
										
										</center>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				
			    </div>
				
				</div>
				
				</div>
				
				
				
				
				
				
                <div class="panel-image">
                    <img src="${pageContext.request.contextPath}/image/<%=imagepass[useridpass.length-1] %>" class="panel-image-preview" />
                    
                </div>
				
                			
				<div class="panel-footer text-center">
                    <a href="#like"><span class="glyphicon glyphicon-thumbs-up"></span></a>
					<span><%=likepass[useridpass.length-1] %></span> <!-- like button -->
                    <a href="#dislike"><span class="glyphicon glyphicon-thumbs-down"></span></a>
					<span><%=dislikepass[useridpass.length-1] %></span>  <!-- dislike button -->
					
                </div>
				
            </div>
        </div>
	</div>
	<%} %>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>

<!--
<script src="js/modal.js"></script>
<script src="js/transition.js"></script>
<script src="js/tab.js"></script>
<script src="js/alert.js"></script>
<script src="js/carousel.js"></script>
<script src="js/popover.js"></script>
-->

</body>

</html>

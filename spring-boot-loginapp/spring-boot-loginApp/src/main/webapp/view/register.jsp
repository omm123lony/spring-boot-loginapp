<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"><title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body style="background-color: #b0ba99">

<div align="center">

<div class="row" style="margin-top:100px;margin-bottom: 100px; ">
<div class="col-sm-2" ></div>
<div class="col-sm-8">
<div class="card">
<div class="card-header"><h2>User Registration</h2> </div>
<div class="card-body">
<form  action="userRegister" method="post" enctype="multipart/form-data"> 
				
        <div class="row" style="margin-top:30px; ">
        <div class="col-sm-2" ><label for="usernamesignup" class="uname" data-icon="u">Your Name</label></div> 
        <div class="col-sm-4" >
        <div class="form-group" >     
					
					<input class="form-control" id="usernamesignup" name="name" required="required" type="text" placeholder="Enter name" />
				</div>
				</div>
				 <div class="col-sm-2" ><label for="usernamesignup" class="uname" data-icon="u">Your E-mail</label></div> 
                 <div class="col-sm-4" >
                 <div class="form-group" >     
					
					<input class="form-control" id="emailsignup" name="email" required="required" type="email" placeholder="mysupermail@mail.com"/>
				</div>
				</div>
				</div>
				   <div class="row" style="margin-top:30px; ">
        <div class="col-sm-2" >					<label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
</div> 
        <div class="col-sm-4" >
        <div class="form-group" >     
					
					<input class="form-control" id="passwordsignup" name="password" required="required" type="password" placeholder="eg. X8df!90EO" />
				</div>
				</div>
				 <div class="col-sm-2" ><label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label></div> 
                 <div class="col-sm-4" >
                 <div class="form-group" >     
					
					<input class="form-control" id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
				</div>
				</div>
				</div>
				
				   <div class="row" style="margin-top:30px; ">
        <div class="col-sm-2" ><label for="fileUpload" data-icon="p">Upload profile picture(.jpg image) </label></div> 
        <div class="col-sm-4" >
        <div class="form-group" >     
					
					<input type="file" id="myFile" name="image"  accept=".jpg"/>
				</div>
				</div>
				 <div class="col-sm-2" ></div> 
                 <div class="col-sm-4" >
                 <div class="form-group" >     
					
                     <input type="submit" class="btn btn-sm btn-success" value="Sign up"/> 
				</div>
				</div>
				</div>
				
				
				<p class="change_link">  
					Login Using Facebook
					<a href="#"> Go and log in </a>
				</p>
        
        </form>
        <div class="col-sm-4" >
                 <div class="form-group" >     
					<form action="logdin" method="post">
                     <input type="submit" class="btn btn-sm btn-secondary" value="Back"/> 
                     </form>
				</div>
				</div>
</div>
</div>
</div>
</div>

        </div>
</body>
</html>
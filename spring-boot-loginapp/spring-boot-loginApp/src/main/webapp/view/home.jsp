<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.demo.test.model.Register"
     import="java.io.*"
      import="java.util.*"
    %>
    <%
    Register req=(Register)request.getAttribute("userdetails");
    byte[ ] imgData =req.getImage();
    String base64Image = Base64.getEncoder().encodeToString(imgData);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/w3css/3/w3.css">
<title>Home</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">


body {
  margin: 0;
  padding: 0;
  background-color: #17a2b8;
  height: 100vh;
}
.uname{
	font-size: 25px;
	color: #4cabe6;
}
#login .container #login-row #login-column #login-box {
  margin-top: 120px;
  background-color: #EAEAEA;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -85px;
}
</style>
</head>
<body>

	<div id="login">
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form id="login-form" class="form" action="logout">
							<h3 class="text-center text-info">
								<u>User Details</u>
							</h3>
							<div class="form-group">
								<label for="usernamesignup" class="uname" data-icon="u">Name:</label> 
								<label><%=req.getName() %></label>
							</div>
							<div class="form-group">
								<label for="usernamesignup" class="uname" data-icon="u">Email_Id:</label>
								 <label><%=req.getEmail() %></label>
							</div>

							<div class="form-group">
								<label for="usernamesignup" class="uname" data-icon="u">Profile Picture :</label> 
								<img src="data:image/jpg;base64,<%=base64Image %>" width="200"
									height="200" />
							</div>

							<div class="form-group">
								<br>
								<button type="submit" class="btn btn-info btn-md">Logout</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*" %>

<html>
   <head>
      <title>Login</title>
   </head>
   <body>
  <h1>New Users Registration Portal </h1>
	<br>
	<br>

	<form action="register.jsp" method="post">
		Username :<input type="text" name="username"> <br>
		New Password :<input type="password" name="password"><br>
		First Name:<input type="text" name="fname"><br>
		Last Name: <input type="text" name="lname"><br>
		Email: <input type="text" name="email"><br>
		Address: <input type="text" name="addr"><br>
		Phone Number: <input type="text" name="phone"><br>
		User Type <select name="usertype">
		    <option value="home">Home Users</option>
			<option value="agricultural">Agricultural User</option>
			<option value="industrial">Industrial User</option>
			<option value="admin">Administrators</option>
			<option value="officer">Officers</option>
			<option value="mnc">Municipalities</option></select><br>
		<input type="submit" value="Register">
	</form>
	<p> Already a user? Sign in <a href= index.jsp>here</a></p>
   </body>
</html>
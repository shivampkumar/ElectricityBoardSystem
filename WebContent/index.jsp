<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*" %>

<html>
   <head>
      <title>Login</title>
   </head>
   <body>
  <h1> Welcome to the Electricity board</h1>
	<br>
	<br>

	<form action="login.jsp" method="post">
		Enter username :<input type="text" name="username"> <br>
		Enter password :<input type="password" name="password"><br>
		<input type="submit" value="Login">
	</form>
	<p> New user? Register <a href= regform.jsp>here</a></p>
   </body>
</html>
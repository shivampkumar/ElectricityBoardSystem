<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*" %>

<html>
   <head>
      <title>Login</title>
     
     <link rel="stylesheet" type="text/css" href="style.css" />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script>
   $(document).ready(function(){
    $("button").click(function(){
    $("h3").remove();
  });
});
</script>
   </head>
   <body>
  <h1> Welcome to the Electricity board</h1>
 <!--  <h3> I dont know whats happening</h3> -->
	<br>
	<br>

	<form action="login.jsp" method="post">
		Enter username :<input type="text" name="username"> <br>
		Enter password :<input type="password" name="password"><br>
		<input type="submit" value="Login">
	</form>
	<!--  <button>Remove all h3 elements</button> -->
	<p> New user? Register <a href= regform.jsp>here</a></p>
   </body>
</html>
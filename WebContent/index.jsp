<html>
   <head>
      <title>Login</title>
     
     <link rel="stylesheet" type="text/css" href="lr.css" />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
</head>
<body background="power.jpg">

<div class="login-page">
  <div class="form">
    <form class="register-form" method="post" action="register.jsp">
         <h1> Register</h1>
        <input type="text" name="username" placeholder="username"> 
		<input type="password" name="password" placeholder="password">
		<input type="text" name="fname" placeholder="first name">
		<input type="text" name="lname" placeholder="last name">
		<input type="text" name="email" placeholder="email id">
		<input type="text" name="addr" placeholder="address">
		<input type="text" name="phone" placeholder="phone number">
		<select name="usertype">
		    <option value="home">Home Users</option>
			<option value="agricultural">Agricultural User</option>
			<option value="industrial">Industrial User</option>
			<option value="admin">Administrators</option>
			<option value="officer">Officers</option>
			<option value="mnc">Municipalities</option></select><br>
		<input type="submit" value="Register">
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    <form class="login-form" method="post" action="login.jsp">
   <h1> Login</h1>
       <input type="text" name="username" placeholder="name"/>
      <input type="password" name="password" placeholder="password"/>
      <input type="submit" value="Login">
      <p class="message">Not registered? <a href="#">Create an account</a></p>
    </form>
  </div>
</div>
 <script>
     $('.message a').click(function(){
    	 //alert("Cilecl");
    	   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    	});</script>
</body>

</html>
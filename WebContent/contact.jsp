<html>
<head><title>Contact Form</title>
<link rel="stylesheet" type="text/css" href="contact.css" />
</head>

<body>
<div class="container">
  <form action="userhome.jsp" >
	<h1>Contact Us</h1>
	<br>
    <label for="fname">First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name..">

    <label for="lname">Last Name</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name..">
    
     <label for="uname">User Name</label>
    <input type="text" id="uname" name="username" placeholder="Username">

    <label for="subject">Issues/Feedback</label>
    <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

   <input type="submit" value="Submit" onClick="history.go(-1);"> 

  </form>
</div>
</body>
</html>
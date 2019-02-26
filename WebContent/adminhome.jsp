<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*" %>
    
    
    <%
Connection dbConnection = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    //out.println("Driver hai");
} 
catch (ClassNotFoundException e) {
    // TODO Auto-generated catch block
    out.println(e.getMessage());
    e.printStackTrace();
} 
try {
  String url = "jdbc:mysql://localhost/myusers";
  Properties info = new Properties();
  info.put("user", "spk");
  info.put("password", "qwerasdf");

  dbConnection = DriverManager.getConnection(url, info);

  if (dbConnection != null) {
    //out.println("Successfully connected to MySQL database test");
  }

} catch (SQLException ex) {
  out.println(ex.getMessage());
  ex.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Path</title>
 <link rel="stylesheet" type="text/css" href="style.css" />
 <script src="./adminhome.js"></script>

</head>
<body>
<div class="contain">
<h1> Welcome Admin!</h1>
<% //Check any users status
//Generate any users bill
//Give list of all unpaid users
%>

<button id ="b1">Check User Status</button>
<button id= "b3">List of Due Bills</button>
<% 
   // String st="<script>document.writeln(v)</script>";
   // out.println("value="+st); 
%>
<div id="Content"> 

</div>
<% String username= request.getParameter("username");
//out.println(username);
Statement st= dbConnection.createStatement();
ResultSet rs=st.executeQuery("select * from users where username= '"+username+"' "); %>
<p id="stat" >  
        
<% 
while (rs.next()) { 
	out.println("<h3>Username:"+ rs.getString("username")+"<br>");
    out.println("FirstName:"+rs.getString("firstname")+"<br>"); 
    out.println("LastName:"+rs.getString("lastname")+"<br>"); 
    out.println("Email:"+rs.getString("email")+"<br>"); 
    out.println("Phone:"+rs.getString("phone")+"<br>"); 
    out.println("Usertype:"+rs.getString("usertype")+"<br>"); 
    out.println("Units Consumed:"+rs.getString("units")+"<br></h3>"); 
    Cookie cookier = new Cookie("uname",rs.getString("username"));
   	Cookie cookiest= new Cookie("usertype", rs.getString("usertype"));
   	Cookie cooki= new Cookie("units", rs.getString("units"));
   	cookier.setMaxAge(60*60*24);
	cookiest.setMaxAge(60*60*24);
	response.addCookie(cookier);
	response.addCookie(cookiest);
	response.addCookie(cooki);
    out.println("<a href= adminviewbill.jsp> Generate this user's bill</a>" );
} 
%>
</p>

</div>
 <form>
<input type="button" style="margin:auto;display:block"class="button" value="Logout" onclick="window.location.href='logout.jsp'" />
</form>
<div class="navbar">
  <a href="#home" class="active">Home</a>
  SK Tech
</div>

</body>
</html>
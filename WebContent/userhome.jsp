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
<title>User Page</title>
</head>
<body>
<h1> Welcome User!</h1>
<% Cookie cookie = null;
   Cookie[] cookies = null;
   cookies=request.getCookies();
   String us="";
   for(int i=0; i<cookies.length; i++)
   {
	   System.out.println(cookies[i].getValue());
	   cookie= cookies[i];
	   if(cookie.getName().equals("uname"))
{
	System.out.println("found");
	us= cookies[i].getValue();
}
   }
   
  // String us= cookie.getValue();
   out.println("<h2> Hello "+ us+ "</h2>");
   Statement st= dbConnection.createStatement();
   ResultSet rs=st.executeQuery("select * from users where username='"+us+"'");
   String units;
   String usertype;
   String phone;
   while (rs.next()) {
   	units= rs.getString("units");
   	usertype=rs.getString("usertype");
   	phone=rs.getString("phone");
   	Cookie cookier = new Cookie("uname",us);
   	Cookie cookiest= new Cookie("usertype", usertype);
   	Cookie cooki= new Cookie("units", units);
   	Cookie cokis= new Cookie("phone",phone);
	cookier.setMaxAge(60*60*24);
	cookiest.setMaxAge(60*60*24);
	response.addCookie(cookier);
	response.addCookie(cookiest);
	response.addCookie(cooki);
	response.addCookie(cokis);
   	out.println("The number of units you have consumed till date is:"+units+"<br>");
   	int paid= rs.getInt("paid");
   	if(paid==0)
   	{
   		out.println("You have not paid for previous month<br>");
   		out.println("<form action='paybill.jsp'> <input type='submit' value='Pay Bill' //><//form>");
   	}
   	else
   	{
   		out.println("Bill already paid!!");
   	}
   }
   //your units consumed this month
   //total amount due as of now 
   //pay bill
   
 %>
 
</body>
</html>
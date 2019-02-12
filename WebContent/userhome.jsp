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
<title>Insert title here</title>
</head>
<body>
<h1> Welcome User!</h1>
<% Cookie cookie = null;
   Cookie[] cookies = null;
   cookies=request.getCookies();
   cookie= cookies[1];
   out.println("<marquee><h2> Yo "+ cookie.getValue()+ "</h2></marquee>");
 %>
</body>
</html>
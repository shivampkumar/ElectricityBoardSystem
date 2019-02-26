<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*" %>
    
<%
Connection dbConnection = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
} 
catch (ClassNotFoundException e) {
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



	 //Class.forName("com.mysql.jdbc.Driver").newInstance();
	 //Connection con= (Connection)DriverManager.getConnection("jdbc:mysql/myusers?user=spk&password=qwerasdf");
Statement st= dbConnection.createStatement();
String username= request.getParameter("username");
String units= request.getParameter("units");
st.executeUpdate("update users set units='"+units+"'where username='"+username+"'"); 
st.executeUpdate("update users set paid=0 where username='"+username+"'"); 
response.sendRedirect("premeter.jsp");
%>


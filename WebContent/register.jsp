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
String us= request.getParameter("username");
String pw= request.getParameter("password");
String fn= request.getParameter("fname");
String ln= request.getParameter("lname");
String em= request.getParameter("email");
String ad= request.getParameter("addr");
String ph= request.getParameter("phone");
String ut= request.getParameter("usertype");
java.util.Date date= new java.util.Date(); // your date
Calendar cal = Calendar.getInstance();
cal.setTime(date);
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int day = cal.get(Calendar.DAY_OF_MONTH);
int paid=0;
int units=0;
st.executeUpdate("insert into users values('"+us+"','"+pw+"','"+fn+"','"+ln+"','"+em+"','"+ad+"','"+ph+"','"+ut+"','"+day+"','"+month+"','"+year+"','"+units+"','"+paid+"')");
out.println("Registration Successful!");

response.sendRedirect("index.jsp");
	 
%>
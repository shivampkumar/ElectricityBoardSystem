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



	 //Class.forName("com.mysql.jdbc.Driver").newInstance();
	 //Connection con= (Connection)DriverManager.getConnection("jdbc:mysql/myusers?user=spk&password=qwerasdf");
Statement st= dbConnection.createStatement();
String us= request.getParameter("username");
String pw= request.getParameter("password");
ResultSet rs=st.executeQuery("select * from users where username='"+us+"' and password='"+pw+"'");
if (rs.next()) {
	String uset= rs.getString("usertype");
	//System.out.println(uset);
	//Thread.sleep(5000); // sleep 5 seconds	
	String go;
	if(uset.equals("home")||uset.equals("agricultural")||uset.equals("industrial"))
	{
		go="userhome.jsp";
	}
	else if(uset.equals("admin"))
	{
		go="adminhome.jsp";
	}
	else
	{
		go="officehome.jsp";
	}
	Cookie cookie = new Cookie("uname",us);
	cookie.setMaxAge(60*60*24); 
	response.addCookie(cookie);
	response.sendRedirect(go);
}
else
out.println("Not there i think");
//response.sendRedirect("error.html");

	 
%>
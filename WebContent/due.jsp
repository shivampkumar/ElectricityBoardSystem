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
<head> <title>Due bills</title>
 <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div class="table">
<h1>Due Bills</h1>
<% 
	 //Class.forName("com.mysql.jdbc.Driver").newInstance();
	 //Connection con= (Connection)DriverManager.getConnection("jdbc:mysql/myusers?user=spk&password=qwerasdf");
Statement st= dbConnection.createStatement();
ResultSet rs=st.executeQuery("select * from users where paid=0 and (usertype='industrial' or usertype='agricultural' or usertype='home')");
%> <table><tr><th>Username<th>FirstName<th>LastName<th>Email<th>Phone</tr>
<% 
int i=0;
while (rs.next()) { %> <h3>
	<tr><td><%out.println(rs.getString("username")); %></td>
    <td><%out.println(rs.getString("firstname")); %></td>
    <td><%out.println(rs.getString("lastname")); %></td>
     <td><%out.println(rs.getString("email")); %></td>
      <td><%out.println(rs.getString("phone")); %></td>
    </tr> </h3>
<% 
} 
%>
</table>
</div>
  <form>
<input type="button" style="margin:auto;display:block"class="button" value="Logout" onclick="window.location.href='logout.jsp'" />
</form>
<div class="navbar">
  <a href="adminhome.jsp" class="active">Home</a>
  
  <a href="contact.jsp">Contact</a>
</div>
</body>
	
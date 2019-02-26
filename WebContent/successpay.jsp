<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "java.net.*"%>;

    
    
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



Cookie cookie = null;
    Cookie[] cookies = null;
    cookies=request.getCookies();
    String us="",phone="",amt="";
    for(int i=0; i<cookies.length; i++)
    {
 	   //System.out.println(cookies[i].getValue());
 	   cookie= cookies[i];
 	   if(cookie.getName().equals("uname"))
 	   {
 	         //System.out.println("found");
 	         us= cookies[i].getValue();
       }
 	  if(cookie.getName().equals("phone"))
	   {
	         //System.out.println("found");
	         phone= cookies[i].getValue();
      }
 	 if(cookie.getName().equals("amt"))
	   {
	         //System.out.println("found");
	         amt= cookies[i].getValue();
     }
}
    
    
java.util.Date date= new java.util.Date(); // your date
Calendar cal = Calendar.getInstance();
cal.setTime(date);
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int day = cal.get(Calendar.DAY_OF_MONTH);
PreparedStatement ps = null;
int i=0;
while(i<=0){
String sql="Update users set date=?,month=?,year=?,units=?,paid=? where username='"+us+"'";
ps = dbConnection.prepareStatement(sql);
ps.setString(1,Integer.toString(day));
ps.setString(2, Integer.toString(month));
ps.setString(3, Integer.toString(year));
ps.setString(4, "0");
ps.setString(5, "1");
 i = ps.executeUpdate();
}

    // TODO code application logic here
    
    
    
    
    
    String key="gdO9C4afUMrbADv23LZVeG6RiQBlFJ8cjwInyxYhEKHqsuTo5P7Zvkcg2epqd9R5W4ai0VzJbxus8LGA";
    	String message="Dear%20"+us+"%20Thank%20you%20for%20paying%20your%20bill%20amount%20of%20Rupees%20"+amt+"%20via%20the%20Electricity%20board%20payment%20gateway.";
    //	HttpResponse response = Unirest.get("https://www.fast2sms.com/dev/bulk?authorization="+key+"&sender_id=FSTSMS&message="+message+"&language=english&route=p&numbers="+phone) .header("cache-control", "no-cache").asString();
    //phone="7779877280";
    // message="Yo%20sushmith%20it%20works!";
     String req="https://www.fast2sms.com/dev/bulk?authorization="+key+"&sender_id=FSTSMS&message="+message+"&language=english&route=p&numbers="+phone+"";

     URL url = null;
     
     try{
    url= new URL("https://www.fast2sms.com/dev/bulk?authorization="+key+"&sender_id=FSTSMS&message="+message+"&language=english&route=p&numbers="+phone+"");
    //url = URLEncoder.encode(req, "UTF-8");
    //url.replaceAll(" " ,"%20");
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("GET");
    
    conn.setReadTimeout(15*1000);
    conn.connect();
    StringBuilder result = new StringBuilder();
    
    
    BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    String line;
    while ((line = rd.readLine()) != null) {
       result.append(line);
    }
    rd.close();
     }
     catch(Exception e)
     {
    	 System.out.println(e.getMessage());
     }
    
    //URL url = new URL("https://smsapi.engineeringtgr.com/send/?Mobile=8976648824&Password=need4speed&Message="+message+"&To="+phone+"&Key=shiva3FtiKxyUPcvACgQoJBN");
      //  URLConnection urlcon = url.openConnection();
      //  InputStream stream = urlcon.getInputStream();
    //    String responser="";
    //    while ((i = stream.read()) != -1) {
   //         responser+=(char)i;
   //     }
    //    if(responser.contains("success")){
    //        System.out.println("Successfully send SMS");
            //your code when message send success
    //    }else{
     //       System.out.println("response="+response);
            //your code when message not send
     //   }
   // } catch (IOException e) {
   //     System.out.println(e.getMessage());
    
  
  
 

response.sendRedirect("userhome.jsp");
%>



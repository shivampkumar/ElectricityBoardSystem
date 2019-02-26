<%@ page import= "java.io.FileWriter" %>
<%@ page import= "java.io.FileReader" %>
<%@ page import= "java.io.File" %>
<%@ page import= "java.io.*" %>
<%@ page import = "java.awt.Desktop" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="style.css" />
<meta charset="UTF-8">
<title>Payment Gateway</title>
</head>
<body> <div class= "contain">
    <%
    
    Cookie cookie = null;
    Cookie[] cookies = null;
    cookies=request.getCookies();
    String us="";
    String usertype="";
    String phone="";
    int units = 0;
    for(int i=0; i<cookies.length; i++)
    {
 	   //System.out.println(cookies[i].getValue());
 	   cookie= cookies[i];
 	   if(cookie.getName().equals("usertype"))
 	   {
 	         //System.out.println("found");
 	         usertype= cookies[i].getValue();
       }
 	   else if(cookie.getName().equals("phone"))
	   {
	         //System.out.println("found");
	         phone= cookies[i].getValue();
      }
 	   else if(cookie.getName().equals("uname"))
 	  {
 		// 	System.out.println("found");
 		 	us= cookies[i].getValue();
 		 }
      else if(cookie.getName().equals("units"))
	  {
		 	//System.out.println("found");
		 	units= Integer.parseInt(cookies[i].getValue());
		 }
}
    
    double ba=0;
    if(usertype.equals("home"))
    {
    	if(units<200)
    	{
    		ba=(5.5)*units;
    	}
    	else{
    		ba=6*units;
    	}
    }
    else if(usertype.equals("industrial"))
    {
    	if(units<200)
    	{
    		ba=6*units;
    	}
    	else{
    		ba=6.8*units;
    	}
    }
    else if(usertype.equals("agricultural"))
    {
    	ba=5*units;
    }
   
    
    FileWriter fw= null;
    try
    {
    	fw=new FileWriter("/home/sk/Desktop/Npopo/Electricity/WebContent/output.txt");
    }
    catch(Exception e)
    {
   	 System.out.println("Wroor")	;
    }
    
    fw.write("Username:"+us+"\nUsertype:"+usertype+"\nUnits Consumed:"+units+"\n\nBill amount:"+ba);
    System.out.println("Succes");
    fw.close();
    
    File file = new File("/home/sk/Desktop/Npopo/Electricity/WebContent/output.txt");
    
    //first check if Desktop is supported by Platform or not
    if(!Desktop.isDesktopSupported()){
        System.out.println("Desktop is not supported");
        return;
    }
    
    Desktop desktop = Desktop.getDesktop();
    if(file.exists()) desktop.open(file);
    
   
    //File file = new File("something");
    //System.out.println(file.getAbsolutePath());

    // read from FileReader till the end of file 
    out.println("<h3>Username:"+us+"<br>Usertype:"+usertype+"<br>Units Consumed:"+units+"<br><br>Bill amount: "+ba+"</h3");
    Cookie cookier = new Cookie("uname",us);
   	Cookie cookiest= new Cookie("amt", Double.toString(ba));
   	Cookie cookiesh= new Cookie("phone", (phone));
	cookier.setMaxAge(60*60*24);
	cookiest.setMaxAge(60*60*24);
	response.addCookie(cookier);
	response.addCookie(cookiest);
	response.addCookie(cookiesh);
    %>
    
<form>
<input type="button" class="tr" style="margin:auto;display:block"class="button" value="Make Payment" onclick="window.location.href='billing.jsp'" /></form>
</div>
</body>
  <form>
<input type="button" style="margin:auto;display:block"class="button" value="Logout" onclick="window.location.href='logout.jsp'" />
</form>
<div class="navbar">
  <a href="userhome.jsp" class="active">Home</a>
  
  <a href="contact.jsp">Contact</a>
</div>
</html>
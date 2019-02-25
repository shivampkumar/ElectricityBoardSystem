<%@ page import= "java.io.FileWriter" %>
<%@ page import= "java.io.FileReader" %>
<%@ page import= "java.io.File" %>
<%@ page import= "java.io.IOException" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Cookie cookie = null;
    Cookie[] cookies = null;
    cookies=request.getCookies();
    String us="";
    String usertype="";
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
   
    
    
    
    out.println("Username:"+us+"<br>Usertype:"+usertype+"<br>Units Consumed:"+units+"<br><br>Bill amount:"+ba);
    System.out.println("Succes");
    
   
    //File file = new File("something");
    //System.out.println(file.getAbsolutePath());

    // read from FileReader till the end of file 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Gateway</title>
</head>
<body>

</body>
</html>
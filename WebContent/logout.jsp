<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*" %>


<%  

   


Cookie[] cookies = request.getCookies();

// Delete all the cookies
if (cookies != null) {

    for (int i = 0; i < cookies.length; i++)
    {

        Cookie cookie = cookies[i];
        System.out.println(cookie.getValue());
        cookies[i].setValue(null);
        cookies[i].setMaxAge(0);
        
        response.addCookie(cookie);
    }
}

    	response.sendRedirect("index.jsp");
    	%>
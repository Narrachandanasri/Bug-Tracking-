<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Cookie[] cookies = request.getCookies();
if (cookies != null)
{
	  String targetCookieName = "name";
	    for (Cookie cookie : cookies) {
	       
	            out.println(cookie.getValue());
	            // Use the retrieved cookie value as needed
	       }
	    
}
 String u = String.valueOf(request.getParameter("uname"));
    String p = String.valueOf(request.getParameter("psw"));
    out.println(u+"" +p);
    	//response.sendRedirect("emphome.jsp");
    	
    	
   
    	 // response.sendRedirect("index.jsp?error=true");
    	
   
    
 %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%
 try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandanadb", "root","abcd");
     
     String sql = "DELETE FROM projects WHERE projectname= ?";
     PreparedStatement stmt = connection.prepareStatement(sql);
     stmt.setString(1, request.getParameter("prj"));
     int rowsDeleted = stmt.executeUpdate();
 }
    catch (SQLException e) {
        out.println(e);
    }
 
 %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<%@ include file="projecttable.jsp" %><br/>
</body>
</html>
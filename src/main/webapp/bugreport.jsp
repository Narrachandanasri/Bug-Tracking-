<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@page import="java.sql.*" %>
    <%
    String url = "jdbc:mysql://localhost:3306/chandanadb";
    String username = "root";
    String password = "abcd";
    String driver = "com.mysql.jdbc.Driver";
    String sql = "insert into bugs (bugname,project,testercode,bugdate,bugpriority,buglevel,bugstatus,bugdescription) values (?, ?,?, ?,?,?,?,?)";
    String bgname=request.getParameter("bgname");
    String project=request.getParameter("prj");
    String testercode=request.getParameter("testercode");
    String bugdate=request.getParameter("bgdate");
    String bugpri=request.getParameter("bgpri");
    String bglevel=request.getParameter("bglevel");
    String bgstatus=request.getParameter("bgstatus");
    String bgdescri=request.getParameter("bgdescrip");

    
    
    try {
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(url, username, password);
        
        PreparedStatement pst = connection.prepareStatement(sql);
       pst.setString(1,bgname);
       pst.setString(2, project);
       pst.setString(3, testercode);
       pst.setString(4, bugdate);
       pst.setString(5,bugpri);
       pst.setString(6,bglevel);
       pst.setString(7,bgstatus);
       pst.setString(8,bgdescri);
       pst.executeUpdate();
        
    } catch (Exception e) {
        out.println(e);
    }
        %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

<%@ include file="bugtable.jsp" %><br/>
</body>
</html>
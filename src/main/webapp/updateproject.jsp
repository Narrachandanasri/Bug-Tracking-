<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.sql.*" %>
   <%
    String url = "jdbc:mysql://localhost:3306/chandanadb";
    String username = "root";
    String password = "abcd";
    String driver = "com.mysql.jdbc.Driver";
    String sql = "update projects set submission_date=?, projectLead=?,client_name=?,clientPhonenumber=?,duration=?,address=?,email=?,dept=?,members=?,description=? where projectname=? ";
    String prj1=request.getParameter("prj");
    
  
    String lead=request.getParameter("prjlead");
    String subdate=request.getParameter("subdate");
    String clientname=request.getParameter("client name");
    String clientphn=request.getParameter("clientphn");
    String duration=request.getParameter("duration");
    String addr=request.getParameter("clientaddr");
    String email=request.getParameter("clientemail");
    String dept=request.getParameter("depname");
    String members=request.getParameter("members" );
    String descri=request.getParameter("pdescrip");
   
    try {
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(url, username, password);
        
        PreparedStatement pst = connection.prepareStatement(sql);
       
       pst.setString(1, subdate);
       pst.setString(2, lead);
      pst.setString(3, clientname);
      pst.setString(4,clientphn);
      pst.setString(5,duration);
      pst.setString(6, addr);
      pst.setString(7, email);
      pst.setString(8, dept);
      pst.setString(9,members);
      pst.setString(10,descri);
       pst.setString(11,prj1);
      int rowsAffected=pst.executeUpdate();
      out.println(rowsAffected + " rows were updated.");
     
    } catch (Exception e) {
        out.println(e);
    }
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="projecttable.jsp"%>
</body>
</html>
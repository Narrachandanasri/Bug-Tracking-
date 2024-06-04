<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
   <%
    String url = "jdbc:mysql://localhost:3306/chandanadb";
    String username = "root";
    String password = "abcd";
    String driver = "com.mysql.jdbc.Driver";
    String sql = "insert into users (name, role, phonenumber,email,project,pswd,fname,lname,gender,dob,address) values (?, ?, ?,?,?,?,?,?,?,?,?)";
    String name=request.getParameter("uname");
    String role=request.getParameter("role");
    String phn=request.getParameter("uphn");
    String email=request.getParameter("uemail");
    String project=request.getParameter("projectwork");
    String pswd=request.getParameter("upswd");
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String gender=request.getParameter("gender");
    String dob=request.getParameter("dob");
    String addr=request.getParameter("addr");
    
    try {
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(url, username, password);
        
        PreparedStatement pst = connection.prepareStatement(sql);
       pst.setString(1,name);
       pst.setString(2, role);
       pst.setString(3, phn);
     pst.setString(4, email);
      pst.setString(5,project);
      pst.setString(6,pswd);
      pst.setString(7, fname);
      pst.setString(8, lname);
    pst.setString(9,gender);
     pst.setString(10,dob);
     pst.setString(11,addr);
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
<%@include file="usertable.jsp" %>
</body>
</html>
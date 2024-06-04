<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%
 try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandanadb", "root","abcd");
     Statement stmt = con.createStatement();

     int id1=Integer.parseInt(request.getParameter("id"));
     PreparedStatement pst = con.prepareStatement("insert into comment (name,title,description,bugid) values(?,?,?,?)");
     pst.setString(1,"hii");
     pst.setString(2,request.getParameter("title"));
     pst.setString(3,request.getParameter("description"));
     pst.setInt(4, id1);
     pst.executeUpdate();
     PreparedStatement pst1 = con.prepareStatement("select * from comment where bugid=?");
     pst1.setInt(1,id1);
     ResultSet rs1=pst1.executeQuery();
     
 
 %>
<!DOCTYPE html>
<html>
<head>
<style>
td
{ 
  border:0.5px solid black;
}
</style>
</head>
<body>
<%@ include file="viewbug.jsp" %>
<table>
<%while (rs1.next()) {
	  // Retrieve the values for each column in the row
	  
 %>
 <tr >
 <td rowspan="2"><%=rs1.getString("name") %></td>
 <td><%=rs1.getString("title") %></td>
 </tr>
 <tr >
 
 <td><%=rs1.getString("description") %></td>
 </tr>
 <%} 
 
 }
 catch(Exception e)
 {
	 out.println(e);
 }
 %>
 </table>
</body>
</html>
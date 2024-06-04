<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<style>
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
table
{
 border:2px solid black;
 margin: 0 auto;
  display: table;
      table-layout: auto;
  
}
.styled-table {
    border-collapse: collapse;
   
    font-size: 0.9em;
    font-family: sans-serif;
    
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}

td,th
{
   padding:10px;
   border:1px solid black;
}
input[type="button"]
{ 
  background-color:#1a8cff;
  color:white;
  border-radius: 5px;
  border:none;
}
</style>
</head>
<body>
<%@ include file="login.jsp" %><br/>
<table class="styled-table">


<thead>
 <tr>
 <th  style="width: 100px;">Name
 </th>
  <th style="width: 100px;">Role
 </th>
  <th  style="width: 150px;">Phonenumber
 </th>
  <th style="width: 150px;">email
 </th>
  <th style="width: 100px;">Project
 </th>
 <th></th>
 <th></th>
 </tr>
 </thead>
 <%
 try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandanadb", "root","abcd");
     Statement stmt = connection.createStatement();
     ResultSet rs = stmt.executeQuery("SELECT * FROM users");
     
 
 %>
 
 <%while (rs.next()) {
	  // Retrieve the values for each column in the row
	   int id=rs.getInt("id");
 %>
 <tbody>
 <tr>
 <td><%=rs.getString("name") %></td>
 <td><%=rs.getString("role") %></td>
 <td><%=rs.getString("phonenumber") %></td>
 <td><%=rs.getString("email") %></td>
 <td><%=rs.getString("project") %></td>
 <td><a href="edituser.jsp?id=<%=id%>"><input type="button" value="edit" /></a></td>
 <td><a href="deleteuser.jsp?id=<%=id%>"><input type="button" value="delete"/></a></td>
 </tr>
 </tbody>
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
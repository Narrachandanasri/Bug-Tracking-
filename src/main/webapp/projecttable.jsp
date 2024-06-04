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

</style>
</head>
<body>
<%@ include file="login.jsp" %><br/>
<table class="styled-table">


<thead>
 <tr>
 <th  style="width: 100px;">ProjectName
 </th>
  <th style="width: 100px;">SubmissionDate
 </th>
  <th  style="width: 100px;">ProjectLead
 </th>
  <th style="width: 100px;">Client_name
 </th>
  <th style="width: 150px;">Client_phonenumber
 </th>
 <th>
 </th>
 <th>
 </th>
 </tr>
 </thead>
 <%
 try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandanadb", "root","abcd");
     Statement stmt = connection.createStatement();
     ResultSet rs = stmt.executeQuery("SELECT * FROM projects");
     
 
 %>
 
 <%while (rs.next()) {
	  // Retrieve the values for each column in the row
	  String prj=rs.getString("projectname");
 %>
 <tbody>
 <tr>
 <td><%=rs.getString("projectname") %></td>
 <td><%=rs.getString("submission_date") %></td>
 <td><%=rs.getString("projectLead") %></td>
 <td><%=rs.getString("client_name") %></td>
 <td><%=rs.getString("clientPhonenumber") %></td>
 <td><a href="editproject.jsp?prj=<%=prj%>"><input type="button" value="edit" /></a></td>
 <td><a href="deleteproject.jsp?prj=<%=prj%>"><input type="button" value="delete"/></a></td>
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
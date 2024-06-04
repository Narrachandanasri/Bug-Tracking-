<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%
 try {
	 Class.forName("com.mysql.jdbc.Driver");
     Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandanadb", "root","abcd");
     
     int id=Integer.parseInt(request.getParameter("id"));
     PreparedStatement pst2 = connection.prepareStatement("select * from bugs where id=?");
     pst2.setInt(1,id);
     ResultSet rs=pst2.executeQuery();
     
     
    
     PreparedStatement pst = connection.prepareStatement("insert into comment (name,title,description,bugid) values(?,?,?,?)");
     pst.setString(1,"hii");
     pst.setString(2,request.getParameter("title"));
     pst.setString(3,request.getParameter("description"));
     pst.setInt(4, id);
     pst.executeUpdate();
     
     
 
 %>
 
<!DOCTYPE html>
<html>
<head>
<style>
table
{
 border:none;
 display: table;
      table-layout: auto;
  
 
  
}
td
{
   padding:10px;
   border:none;
   font-weight:bold;
}
input[type="text"]
{
width:100%; 
 margin-left:10px;
  padding:10px;
}

textarea
{ 
margin-left:10px;
 width:100%;
 padding:20px;
}
button
{ 
text-decoration:none;
  background-color:blue;
  color:white;
  border:none;
 float:left;
  padding:10px;
}
</style>
</head>
<body>
<%@ include file="login.jsp" %><br/>
<form method="post">
  <table>
  <% while (rs.next()) {
	  // Retrieve the values for each column in the row

 %>
  <tr>
  <td>BugName:</td>
  <td><%=rs.getString("bugname") %></td>
  </tr>
  <tr> <td>Project</td>
  <td><%=rs.getString("project") %></td></tr>
  <tr> <td>testerCode</td>
  <td><%=rs.getString("testercode") %></td></tr>
  <tr> <td>Bugdate</td>
  <td><%=rs.getString("bugdate") %></td></tr>
  <tr> <td>Priority</td>
  <td><%=rs.getString("bugpriority") %></td></tr>
  <tr> <td>Level</td>
  <td><%=rs.getString("buglevel") %></td></tr>
  <tr> <td>Status</td>
  <td><%=rs.getString("bugstatus") %></td></tr>
  <tr> <td>Description</td>
  <td><%=rs.getString("bugdescription") %></td></tr>
  </table>
  <hr/>
    <%} 
 
 }
 catch(Exception e)
 {
	 out.println(e);
 }
    int id=Integer.parseInt(request.getParameter("id"));

 %>
   <h4>Add Comment</h4>
   <input type="text" name="title" placeholder="Title" />
   <br/><br/>
   <textarea name="description" placeholder="Description"></textarea>
   <button>Message</button>
   </form>
   <%
   
   
   
   %>
   <br/>
   
   <table>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandanadb", "root","abcd");
PreparedStatement pst1 = connection.prepareStatement("select * from comment where bugid=?");
pst1.setInt(1,id);
ResultSet rs1=pst1.executeQuery();
while (rs1.next()) {
	  // Retrieve the values for each column in the row
	  
 %>
 <tr >
 <td rowspan="2"><%=rs1.getString("name") %></td>
 <td><%=rs1.getString("title") %></td>
 </tr>
 <tr >
 
 <td><%=rs1.getString("description") %></td>
 </tr>
 <%
 } 
}
 
 catch(Exception e)
 {
	 out.println(e);
 }
 %>
 </table>
   
</body>
</html>
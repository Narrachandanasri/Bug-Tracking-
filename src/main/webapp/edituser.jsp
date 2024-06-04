<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <%
 try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandanadb", "root","abcd");
     Statement stmt = connection.createStatement();
     int id=Integer.parseInt(request.getParameter("id"));
     PreparedStatement pst = connection.prepareStatement("select * from users where id=?");
     pst.setInt(1,id);
     ResultSet rs=pst.executeQuery();

     
 %>
<!DOCTYPE html>
<html>
<head>
<style>
form {

height:350px;
margin-left:100px;
width:800px;
height:auto;

font-family: sans-serif;
}
select {
  background-color: white;
  color: black;
  font-size: 16px;
  padding: 10px;
  width: 100%;
}

  table {
    width: 100%;
  }
  td {
    width: 50%;
    
  }
  input[type="text"] ,input[type="date"],textarea,input[type="file"],input[type="password"],input[type="email"]
  {
  width:360px;
  
  padding:10px;
  }
  

</style>
</head>
<body>
<%@ include file="login.jsp" %>
<h3 style="text-align:center;color:blue;font-weight:bold;"> AddNew User</h3>
<form action="updateuser.jsp" method="post">
<br/>
<br/>
<%while (rs.next()) {
	  // Retrieve the values for each column in the row
	  

 %>
Select User<br/>
<select name="role">
  <option value="" disabled selected><%=rs.getString("role")%></option>
  <option value="Manager">Manager</option>
  <option value="Developer">Developoer</option>
  <option value="Admin">Admin</option>
   <option value="Tester">Tester</option>
</select>

<table>
    <tr>
      <td>Username:</td>
      <td>Password:</td>
    </tr>
    <tr>
      <td><input type="text" name="uname" required value="<%= rs.getString("name")%>"></td>
      <td><input type="password" name="upswd" required value="<%= rs.getString("pswd")%>"></td>
    </tr>
    <tr>
      <td>First Name</td>
      <td>Last Name</td>
    </tr>
    <tr>
      <td><input type="text" name="fname" required value="<%=rs.getString("fname")%>"></td>
      <td><input type="text" name="lname"required value="<%= rs.getString("lname")%>"></td>
    </tr>
    <tr>
      <td>PhoneNumber:</td>
      <td>Email Id:</td>
    </tr>
    <tr>
      <td><input type="text" name="uphn" value="<%=rs.getString("phonenumber")%>"></td>
      <td><input type="email" name="uemail" value="<%= rs.getString("email")%>"></td>
    </tr>
    <tr>
      <td>Gender:</td>
      <td>Dateofbirth:</td>
    </tr>
    <tr>
      <td><select name="gender">
  <option value="" disabled selected><%= rs.getString("gender")%></option>
  <option value="Male">Male</option>
  <option value="Female">Female</option>
  <option value="Other">Other</option>
   
</select></td>
      <td><input type="date" name="dob" value="<%= rs.getString("dob")%>"></td>
    </tr>
    <tr>
      <td>Address:</td>
      <td>Image:</td>
    </tr>
    <tr>
      <td><textarea name="addr"><%= rs.getString("address")%></textarea></td>
      <td><input type="file" name="photo"></td>
    </tr>
    
  </table>
  Currently Working Project
  <input type="text" name="projectwork" value="<%= rs.getString("project")%>"/>
 <%}
 }
 catch(Exception e)
 {
	 out.println(e);
 }
 %>
 <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
<div style="text-align: center;">
  <button style="display: inline-block;padding:10px;background-color:blue;color:white;border:none;">Update User</button>
</div>
</form>
</body>
</html>
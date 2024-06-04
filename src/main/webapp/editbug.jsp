<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <%
 try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandanadb", "root","abcd");
     Statement stmt = connection.createStatement();
     int id=Integer.parseInt(request.getParameter("id"));
     PreparedStatement pst = connection.prepareStatement("select * from bugs where id=?");
     pst.setInt(1,id);
     ResultSet rs=pst.executeQuery();

     
 %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
form {

height:350px;
margin-left:100px;
width:800px;
height:auto;
background-color: #ffffff;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
font-family: sans-serif;
}
input[type="text"] ,input[type="date"],textarea,input[type="email"]
  {
  width:750px;
  margin-left:10px;
  
  padding:10px;
  }
  label
  {
   margin-left:10px;
   margin-top:5px;
  }
  select {
  background-color: white;
  color: black;
  font-size: 16px;
  padding: 10px;
  width: 750px;
  
  margin-left:10px;
}
</style>
</head>
<body>
<%@ include file="login.jsp" %><br/>
<br/>
<h3 style="text-align:center;color:blue;font-weight:bold;"> AddNew Bug</h3>
<form action="updatebug.jsp" method="post">
<br/>
<br/>
 <%while (rs.next()) {
	  // Retrieve the values for each column in the row

 %>
<label>Bug Name:</label><br/>
  <input type="text" name="bgname" value="<%=rs.getString("bugname") %>"/><br/><br/>
  <label>Project</label>
  <select name="prj">
  <option value="<%=rs.getString("project") %>" disabled selected><%=rs.getString("project") %></option>
  <option value="option1">Chandana</option>
  <option value="option2">Ram</option>
  <option value="option3">Sai</option>
   <option value="option3">Sreeleela</option>
</select><br/><br/>
  <label>Tester Code</label><br/>
  <input type="text" name="testercode" value="<%=rs.getString("testercode") %> "/><br/><br/>
  <label>Bugdate</label><br/>
  <input type="date" name="bgdate" value="<%=rs.getString("bugdate") %>"/><br/><br/>
  <label>Bug level</label><br/>
  <input type="text" name="bglevel" value="<%=rs.getString("buglevel") %>"/><br/><br/>
  <label>Bug Priority</label><br/>
  <input type="text" name="bgpri" value="<%=rs.getString("bugpriority") %>"/><br/><br/>
  <label>Bug status</label><br/>
  <select name="bgstatus">
  <option value="" disabled selected><%=rs.getString("bugstatus") %></option>
  <option value="open">Open</option>
  <option value="close">Close</option>
  <option value="In progress">In progress</option>
  
</select><br/><br/>
<label>Bug Description</label>
<textarea name="bgdescrip"  ><%=rs.getString("bugdescription")%></textarea>
<%}
 }
 catch(Exception e)
 {
	 out.println(e);
 }
 %>
 <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
<div style="text-align: center;">
  <button style="display: inline-block;padding:10px;background-color:blue;color:white;border:none;">edit Bug </button>
 </div>
  </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<form action="bugreport.jsp" method="post">
<br/>
<br/>
<label>Bug Name:</label><br/>
  <input type="text" name="bgname"/><br/><br/>
  <label>Project</label>
  <select name="prj">
  <option value="" disabled selected>Select Project</option>
  <option value=chandana">Chandana</option>
  <option value="Ram">Ram</option>
  <option value="Sai">Sai</option>
   <option value="Sreeleela">Sreeleela</option>
</select><br/><br/>
  <label>Tester Code</label><br/>
  <input type="text" name="testercode"/><br/><br/>
  <label>Bugdate</label><br/>
  <input type="date" name="bgdate"/><br/><br/>
  
  
   <label>Bug Priority</label><br/>
  <select name="bgpri">
  <option value="" disabled selected>Select priority</option>
  <option value="Critical">Critical</option>
  <option value="High">High</option>
  <option value="Medium">Medium</option>
  <option value="Low">Low</option>
  </select><br/><br/>
  <label>Bug status</label><br/>
  <select name="bgstatus">
  <option value="" disabled selected>Select status</option>
  <option value="open">Open</option>
  <option value="close">Close</option>
  <option value="In progress">In progress</option>
  
</select><br/><br/>
<label>Bug Description</label>
<textarea name="bgdescrip"></textarea>
<div style="text-align: center;">
  <button style="display: inline-block;padding:10px;background-color:blue;color:white;border:none;">Submit</button>
  </form>
</body>
</html>
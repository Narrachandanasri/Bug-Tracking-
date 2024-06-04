<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<form action="userreport.jsp" method="post">
<br/>
<br/>
Select User<br/>
<select name="role">
  <option value="" disabled selected>Select an user</option>
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
      <td><input type="text" name="uname" required></td>
      <td><input type="password" name="upswd" required></td>
    </tr>
    <tr>
      <td>First Name</td>
      <td>Last Name</td>
    </tr>
    <tr>
      <td><input type="text" name="fname" required ></td>
      <td><input type="text" name="lname"required></td>
    </tr>
    <tr>
      <td>PhoneNumber:</td>
      <td>Email Id:</td>
    </tr>
    <tr>
      <td><input type="text" name="uphn"></td>
      <td><input type="email" name="uemail"></td>
    </tr>
    <tr>
      <td>Gender:</td>
      <td>Dateofbirth:</td>
    </tr>
    <tr>
      <td><select name="gender">
  <option value="" disabled selected>Select gender</option>
  <option value="option1">Male</option>
  <option value="option2">Female</option>
  <option value="option3">Other</option>
   
</select></td>
      <td><input type="date" name="dob"></td>
    </tr>
    <tr>
      <td>Address:</td>
      <td>Image:</td>
    </tr>
    <tr>
      <td><textarea name="addr"></textarea></td>
      <td><input type="file" name="photo"></td>
    </tr>
    
  </table>
  Currently Working Project
  <input type="text" name="projectwork"/>
<div style="text-align: center;">
  <button style="display: inline-block;padding:10px;background-color:blue;color:white;border:none;">Click Me</button>
</div>
</form>
</body>
</html>

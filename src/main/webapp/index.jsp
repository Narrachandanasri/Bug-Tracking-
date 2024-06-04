<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {
border: 3px solid #f1f1f1;
height:350px;
margin-left:220px;
width:750px;
}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
  
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  
  background-color:coral;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}




.container {
  padding: 16px;
  margin-left:200px;
  margin-right:200px;
}



h2
{
  text-align:center;
}
</style>
</head>
<body>
<%-- Check if an error parameter is present in the URL --%>
    <% if ("true".equals(request.getParameter("error"))) { %>
        <p>Wrong username or password. Please try again.</p>
    <% } %>
<form action='logincheck.jsp'>
<h2> Login Form</h2>
<div class="container">
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
        
    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" >
    <button type="button" class="cancelbtn">Cancel</button>
  <button type="button" class="cancelbtn">forgot password</button>
  </div>
</form>


</body>
</html>
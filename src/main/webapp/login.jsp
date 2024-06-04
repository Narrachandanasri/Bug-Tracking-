<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
   overflow: hidden;
    box-shadow: 2px 2px 5px #ccc;
   width: 100%;
  
  
}

.navbar a {
  float: right;
  font-size: 16px;
  color: black;
  text-align: center;
  padding: 20px 16px;
  text-decoration: none;
}

.dropdown {
  float: right;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: black;
  padding: 20px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover {
  color: blue;
  
  border-bottom: 2px solid blue;
}


.navbar a:active {
  color: blue;
  
  border-bottom: 2px solid blue;
}


.dropdown button:hover
{
 color: blue;
  
  border-bottom: 2px solid blue;
}




.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}
p{display:inline;
  margin-left:40px;
  font-size:24px;
  float:left;
  font-weight:bold;}
.dropdown-content a:hover {
  border-bottom:none;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>

<div class="navbar">
<p>Bug Tracking System<p>



<div class="dropdown">
    <button class="dropbtn">Reports </button>
    <div class="dropdown-content">
      <a href="usertable.jsp">Users</a>
      <a href="bugtable.jsp">Bugs</a>
      <a href="projecttable.jsp">Projects</a>
    </div>
 </div> 
<div class="dropdown">
    <button class="dropbtn">Add New </button>
    <div class="dropdown-content">
      <a href="addbug.jsp">Add New Bug</a>
      <a href="adduser.jsp">Add New User</a>
      <a href="addproject.jsp">Add New Project</a>
    </div>
 </div> 
   
    <a href="#home">Home</a>
     <a href="#home">Logout</a>   
</div>


</body>
</html>
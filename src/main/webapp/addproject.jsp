<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<script>
      
function addMember(event) {
	// Get the textarea and new member input field
	event.preventDefault();
	var membersTextArea = document.getElementById("members");
	var newMemberInput = document.getElementById("new-member");

	// Get the existing members from the textarea
	var existingMembers = membersTextArea.value;

	// Get the new member to add
	var newMember = newMemberInput.value.trim();

	// Add the new member to the existing members
	if (newMember !== '') {
		if (existingMembers !== '') {
			existingMembers += '\n';
		}
		existingMembers += newMember;

		// Set the value of the textarea to the new members list
		membersTextArea.value = existingMembers;

		// Clear the new member input field
		newMemberInput.value = '';
	}
}
    </script>
<style>
select {
  background-color: white;
  color: black;
  font-size: 16px;
  padding: 10px;
  width: 750px;
  
  margin-left:10px;
}
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
  button
  {
   background-color:blue;color:white;border:none;
   margin-left:10px;
   padding:10px;
  }
</style>
</head>
<body>
<%@ include file="login.jsp" %><br/>
<br/>
<h3 style="text-align:center;color:blue;font-weight:bold;"> AddNew Project</h3>
<form action="projectreport.jsp" method="post" >
<br/>
<br/>
 <label>Project Name:</label><br/>
  <input type="text" name="pname"/><br/><br/>
  <label>Submission Date</label>
  <input type="date" name="subdate"/><br/><br/>
  <label>Project duration</label><br/>
  <input type="text" name="duration"/><br/><br/>
  <label>client Name</label><br/>
  <input type="text" name="client name"/><br/><br/>
  <label>client Address</label><br/>
  <input type="text" name="clientaddr"/><br/><br/>
  <label>Phone Number</label><br/>
  <input type="text" name="clientphn"/><br/><br/>
  <label>client Email</label><br/>
  <input type="email" name="clientemail"/><br/><br/>
  <label>Department Name</label><br/>
  <input type="text" name="depname"/><br/><br/>
  <label>Project Lead</label><br/>
  <select name="prjlead">
  <option value="" disabled selected>Select Project Lead</option>
  <option value="Chandana">Chandana</option>
  <option value="Ram">Ram</option>
  <option value="sai">Sai</option>
   <option value="Sreeeleela">Sreeleela</option>
</select><br/>
<br/>

      <label for="new-member">New Member:</label>
 
    <input type="text" id="new-member" name="new-member">
      <br/><br/>
    <button onclick="addMember(event)">Add Member</button>
    <br/><br/>
    <label for="members">Project Members:</label>
    <textarea id="members" name="members" rows="4" cols="50" readonly style="font-weight:bold;"></textarea>
    <br>
  
    <br/><br/>
<label>Project Description</label>
<textarea name="pdescrip"></textarea>
  <div style="text-align: center;">
  <button style="display: inline-block;padding:10px;background-color:blue;color:white;border:none;">Submit</button>
  </div>
</form>

</body>
</html>
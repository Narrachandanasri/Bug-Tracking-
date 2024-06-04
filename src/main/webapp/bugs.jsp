<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<script>
        function goToAnotherPage() {
            window.location.href = "addbug.jsp";
        }
    </script>
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
    background-color:#009879;
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
del
{
   background-color:#ff0000;
  color:white;
  border-radius: 5px;
  border:none;
}
input[type="button"]
{ 
  background-color:#1a8cff;
  color:white;
  border-radius: 5px;
  border:none;
}
button
{
  margin-left:90px;
  padding:9px;
  color:white;
  border-radius:3px;
  width:100px;
  background-color:#4169E1		;
}
      .menu {
            display: flex;
            align-items: center;
        }

        .menu-item {
            cursor: pointer;
            padding: 8px;
            margin-right: 8px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .menu-item:hover {
            background-color: #e0e0e0;
        }

        #sortingOptions {
            display: none;
        }

        .sorting-option {
            display: flex;
            align-items: center;
            padding: 8px;
            margin-right: 8px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .sorting-option:first-child {
            margin-left: 8px;
        }
</style>
 <script>
        window.onload = function() {
            // Toggle visibility of sorting options
            function toggleSortingOptions() {
                var sortingOptions = document.getElementById("sortingOptions");
                sortingOptions.style.display = (sortingOptions.style.display === "none") ? "flex" : "none";
            }

            // Generic function to sort the table by column index
            function sortTableByColumn(columnIndex) {
                var table, rows, switching, i, x, y, shouldSwitch;
                table = document.getElementById("myTable");
                switching = true;

                while (switching) {
                    switching = false;
                    rows = table.rows;
                    var rowCount = rows.length - 1;

                    for (i = 1; i < rowCount; i++) {
                        shouldSwitch = false;
                        x = rows[i].getElementsByTagName("TD")[columnIndex];
                        y = rows[i + 1].getElementsByTagName("TD")[columnIndex];

                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }

                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }
                }
            }

            // Event listener for "Sort By" button click
            document.getElementById("sortByButton").addEventListener("click", function() {
                toggleSortingOptions();
            });

            // Event listeners for sorting options
            var sortingOptions = document.getElementsByClassName("sorting-option");
            for (var i = 0; i < sortingOptions.length; i++) {
                sortingOptions[i].addEventListener("click", function() {
                    var columnIndex = parseInt(this.getAttribute("data-column"));
                    sortTableByColumn(columnIndex);
                });
            }
        };
    </script>
    
  
</head>
<body>
       <div class="menu">
        <button id="sortByButton">Sort By</button>
        <div id="sortingOptions">
            <div class="sorting-option" data-column="0">Sort by Name</div>
            <div class="sorting-option" data-column="1">Sort by Country</div>
            <!-- Add more sorting options as needed -->
        </div>
    </div>
      <button onclick="goToAnotherPage()">create a bug</button><br/><br/>
  

<table class="styled-table" id="myTable">


<thead>
 <tr>
 <th  style="width: 100px;">Bug
 </th>
  <th style="width: 100px;">Project
 </th>
  <th  style="width: 100px;">BugDate
 </th>
  <th style="width: 100px;">BugPriority
 </th>
  <th style="width: 150px;">Status
 </th>
 <th></th>
 <th></th>
 <th></th>
 </tr>
 </thead>
 <%
 try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandanadb", "root","abcd");
     Statement stmt = connection.createStatement();
     ResultSet rs = stmt.executeQuery("SELECT * FROM bugs");
     
 
 %>
 
 <%while (rs.next()) {
	  // Retrieve the values for each column in the row
	  int id=rs.getInt("id");
 %>
 <tbody>
 <tr>
 <td><%=rs.getString("bugname") %></td>
 <td><%=rs.getString("project") %></td>
 <td><%=rs.getString("bugdate") %></td>
 <td><%=rs.getString("bugpriority") %></td>
 <td><%=rs.getString("bugstatus") %></td>
 <td><a href="viewbug.jsp?id=<%=id%>"><input type="button" value="view"/></a></td>
 <td><a href="editbug.jsp?id=<%=id%>"><input type="button" value="edit" class="del"/></a></td>
 <td><a href="deletebug.jsp?id=<%=id%>"><input type="button" value="delete"/></a></td>
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
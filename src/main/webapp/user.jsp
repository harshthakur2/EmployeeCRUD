<%@ page import="service.employeeService" %>
<%@ page import="entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="styles.css">
<style>
/* Styles for the container */
.button-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  margin-top: 50px; /* Adjust the top margin as needed */
  height: 100vh; /* Set the container to take the full viewport height */
}

/* Styles for the logout button */
.logoutButton {
  background-color: red;
  color: #fff;
  padding: 20px 25px;
  border: none;
  margin-top:100px;
  margin-left:400px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.UpdateCtl {
  background-color: #ff6600;
  color: #fff;
}


/* Hover effect */
.logoutButton:hover {
  background-color: #0056b3;
}


  /* Define styles for the container */
  .container {
    background-color: rgba(255, 255, 255, 0.8); /* Add transparency for a blur effect */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Add a subtle shadow */
    margin: 20px auto;
    max-width: 1000px; /* Adjust the maximum width to your preference */
  }

  /* Style the table */
   table {
    width: 100%;
    border-collapse: collapse;
    background-color: rgba(255, 255, 255, 0.9); /* Add transparency for a blur effect */
  }

  table, th, td {
    border: 1px solid #ccc; /* Add a border */
  }

  th, td {
    padding: 10px;
    text-align: left;
  }

  /* Style the table header row */
  th {
    background-color: #f2f2f2;
    font-size: 15px;
  } */

  /* Style alternating rows for better readability */
  tr:nth-child(even) {
    background-color: #f2f2f2;
  }
  /* styles.css */
.table {
  width: 100%;
  border-collapse: collapse;
  font-family: Arial, sans-serif;
}

.table th, .table td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ccc;
}

.table thead th {
  background-color: #007BFF;
  color: #fff;
}

.table tbody td {
  background-color: #f2f2f2;
}

.UpdateCtl {
  background-color: #28a745;
  color: #fff;
  padding: 5px 10px;
  border: none;
  cursor: pointer;
}
  

  /* Style links */
  a.btn {
    text-decoration: none;
    background-color: #007bff; /* Blue button background color */
    color: #fff; /* Button text color */
    padding: 5px 10px;
    border-radius: 5px;
  }

  a.btn:hover {
    background-color: #0056b3; /* Darker blue on hover */
  }

  /* Center the Add Employee button */
  .center {
    text-align: center;
  }
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>All Employees</title>
</head>
<body>
        <% 
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
	
        Employee e = (Employee)session.getAttribute("emp");
        if(e == null){
        response.sendRedirect("login.jsp");
        }
        
        Employee emp = (Employee) session.getAttribute("emp");
           if (emp != null && !emp.isAdmin()) { %>
           <form action="LogoutCtl" method="get">
          <button class="logoutButton" type="submit">Logout</button>
</form> 
<form action="userUpdateCtl" method="post">
<div class="container">
  <h2>Normal User </h2>      
       
  <table class="table">
   <tbody>
    <thead>
      <tr>
      	<th><label for="empId">Employee ID: <%= emp.getEmpId() %></label></th>
        <th><label for="username">UserName: <%= emp.getUserName() %></label></th>
        <th><label for="firstname">First Name: <%= emp.getFirstName() %></label></th>
		<th><label for="lastname">Last Name: <%= emp.getLastName() %></label></th>
		<th><label for="salary">Salary: <%= emp.getSalary() %></label></th>
      </tr>
 	 </thead>
 	 <thead>
      <tr> 
  	<td><input type="hidden" name="empId" value="<%= emp.getEmpId() %>">
      	</td>
        <td><label for="username">New UserName:</label>
                <input type="text" name="username" value="<%= emp.getUserName() %>"></td>
        <td><label for="firstname">New First Name:</label>
                <input type="text" name="firstname" value="<%= emp.getFirstName() %>"></td>
       	<td><label for="lastname">New Last Name:</label>
                <input type="text" name="lastname" value="<%= emp.getLastName() %>"></td>
         
        <td><input type="hidden" name="salary" value="<%= emp.getSalary() %>"></td>
                
       	<td><input class="UpdateCtl" type="submit" value="Update"></td>
        </tr>
   	</thead>
   </tbody>
  </table>
  
</div>
<% }
%>
</form>
</body>
</html>
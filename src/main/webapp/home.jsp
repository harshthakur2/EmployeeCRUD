<%@ page import="service.employeeService" %>
<%@ page import="entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
  /* Define styles for the container */
  .container {
    background-color: rgba(255, 255, 255, 0.8); /* Add transparency for a blur effect */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Add a subtle shadow */
    margin: 20px auto;
    max-width: 800px; /* Adjust the maximum width to your preference */
  }

  /* Style the table */
  table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #D6EEEE;
}
</table>
</style>
</head>
<body>

<center><h2>Management Table</h2></center>

<script>
    function confirmDelete(empId) {
        var confirmation = confirm("Are you sure you want to delete this employee?");

        if (confirmation) {
            window.location.href = "EmpDelCtl?EmpId=" + empId;
        }
    }
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>All Employees</title>
</head>
<body>
<%! Employee emp; 
%>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

emp = (Employee)session.getAttribute("emp");
if(emp!=null){
employeeService es = new employeeService();
List<Employee> list = es.getEmployee();
%>
<%
if(emp.isAdmin()){
	HttpSession session1 = request.getSession(true);
	session1.setAttribute("isAdmin", true);
%>
	<div class="container">
  <h2> You are Admin </h2>
  <h4>All Employee Details</h4>      
  <form action="LogoutCtl" method="get">
    <button type="submit">Logout</button>
</form>      
  <table class="table">
    <thead>
      <tr>
        <th>Id</th>
        <th>User Name</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Salary</th>
        <th>Is Admin</th>
      </tr>
    </thead>
    <% for(int i = 0; i < list.size(); i++) {%>
      <tr>
      <td ><%= list.get(i).getEmpId() %></td>
      <td ><%= list.get(i).getUserName() %></td>
        <td ><%= list.get(i).getFirstName() %></td>
        <td ><%= list.get(i).getLastName() %></td>
       	<td ><%= list.get(i).getSalary() %></td>
       	<td><%= list.get(i).isAdmin() %></td>
       	<td><a class="btn btn-default" href="updateEmp.jsp?EmpId=<%= list.get(i).getEmpId() %>">Update Employee Details</a></td>
  <%if(!list.get(i).isAdmin()){ %>
  <td>
    <a class="btn btn-default" href="javascript:void(0);" onclick="confirmDelete(<%= list.get(i).getEmpId() %>)">Delete</a>
</td>

<%} %>
<%if(list.get(i).isAdmin()){ %>
  <td>
    <a class="btn btn-default" disabled>Delete</a>
</td>

<%} %>
        </tr>
        <%} %>
  </table>
  <center>
  	<button  type="submit" style="align-content: center;" class="btn btn-default" name="operation" value="addEmp" ><a href="addEmp.jsp">Add Employee</a></button>
  </center>
  </div>

<% } else { 
	HttpSession session1 = request.getSession(true);
	session1.setAttribute("isAdmin", false);
	response.sendRedirect("user.jsp");
} } else { response.sendRedirect("login.jsp"); }%>
</body>
</html>
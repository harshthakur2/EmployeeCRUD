<%@ page import="service.employeeService" %>
<%@ page import="entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
  padding: 0;
  margin: 0;
  color: #1a1f36;
  box-sizing: border-box;
  word-wrap: break-word;
  font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Ubuntu,sans-serif;
}
body {
    min-height: 100%;
    background-color: #ffffff;
}
h1 {
    letter-spacing: -1px;
}
a {
  color: #5469d4;
  text-decoration: unset;
}
.login-root {
    background: #fff;
    display: flex;
    width: 100%;
    min-height: 100vh;
    overflow: hidden;
}
.loginbackground {
    min-height: 692px;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    top: 0;
    z-index: 0;
    overflow: hidden;
}
.flex-flex {
    display: flex;
}
.align-center {
  align-items: center; 
}
.center-center {
  align-items: center;
  justify-content: center;
}
.box-root {
    box-sizing: border-box;
}
.flex-direction--column {
    -ms-flex-direction: column;
    flex-direction: column;
}
.loginbackground-gridContainer {
    display: -ms-grid;
    display: grid;
    -ms-grid-columns: [start] 1fr [left-gutter] (86.6px)[16] [left-gutter] 1fr [end];
    grid-template-columns: [start] 1fr [left-gutter] repeat(16,86.6px) [left-gutter] 1fr [end];
    -ms-grid-rows: [top] 1fr [top-gutter] (64px)[8] [bottom-gutter] 1fr [bottom];
    grid-template-rows: [top] 1fr [top-gutter] repeat(8,64px) [bottom-gutter] 1fr [bottom];
    justify-content: center;
    margin: 0 -2%;
    transform: rotate(-12deg) skew(-12deg);
}
.box-divider--light-all-2 {
    box-shadow: inset 0 0 0 2px #e3e8ee;
}
.box-background--blue {
    background-color: #5469d4;
}
.box-background--white {
  background-color: #ffffff; 
}
.box-background--blue800 {
    background-color: #212d63;
}
.box-background--gray100 {
    background-color: #e3e8ee;
}
.box-background--cyan200 {
    background-color: #7fd3ed;
}
.padding-top--64 {
  padding-top: 64px;
}
.padding-top--24 {
  padding-top: 24px;
}
.padding-top--48 {
  padding-top: 48px;
}
.padding-bottom--24 {
  padding-bottom: 24px;
}
.padding-horizontal--48 {
  padding: 48px;
}
.padding-bottom--15 {
  padding-bottom: 15px;
}


.flex-justifyContent--center {
  -ms-flex-pack: center;
  justify-content: center;
}

.formbg {
    margin: 0px auto;
    width: 100%;
    max-width: 448px;
    background: white;
    border-radius: 4px;
    box-shadow: rgba(60, 66, 87, 0.12) 0px 7px 14px 0px, rgba(0, 0, 0, 0.12) 0px 3px 6px 0px;
}
span {
    display: block;
    font-size: 20px;
    line-height: 28px;
    color: #1a1f36;
}
label {
    margin-bottom: 10px;
}
.reset-pass a,label {
    font-size: 14px;
    font-weight: 600;
    display: block;
}
.reset-pass > a {
    text-align: right;
    margin-bottom: 10px;
}
.grid--50-50 {
    display: grid;
    grid-template-columns: 50% 50%;
    align-items: center;
}

.field input {
    font-size: 16px;
    line-height: 28px;
    padding: 8px 16px;
    width: 100%;
    min-height: 44px;
    border: unset;
    border-radius: 4px;
    outline-color: rgb(84 105 212 / 0.5);
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.16) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px;
}

input[type="submit"] {
    background-color: rgb(84, 105, 212);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, 
                rgb(84, 105, 212) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}
.field-checkbox input {
    width: 20px;
    height: 15px;
    margin-right: 5px; 
    box-shadow: unset;
    min-height: unset;
}
.field-checkbox label {
    display: flex;
    align-items: center;
    margin: 0;
}
a.ssolink {
    display: block;
    text-align: center;
    font-weight: 600;
}
.footer-link span {
    font-size: 14px;
    text-align: center;
}
.listing a {
    color: #697386;
    font-weight: 600;
    margin: 0 10px;
}

</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update Employee Details</title>
</head>
<body>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

String empIdParam = request.getParameter("EmpId");
if (empIdParam != null) {
    int empId = Integer.parseInt(empIdParam);
    employeeService es = new employeeService();
    Employee emp = es.getEmployeeById(empId);

    if (emp != null) {
%>
<div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
      
      <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
          <h1><a href="http://blog.stackfindover.com/" rel="dofollow">Update Details -> </a></h1>
        </div>
 <div class="formbg-outer">
    <div class="formbg">
        <div class="formbg-inner padding-horizontal--48">
            <span class="padding-bottom--15">Edit Employee Details</span>
            <form action="UpdateEmp" method="post">
                <div class="field padding-bottom--24">
                    <label for="empId">Employee ID</label>
                    <input type="text" name="empId" value="<%= emp.getEmpId() %>" readonly>
                </div>
                <div class="field padding-bottom--24">
                    <label for="username">User Name</label>
						<input type="text" name="username" value="<%= emp.getUserName() %>">
                </div>
                <div class="field padding-bottom--24">
                    <label for="firstname">First Name</label>
						<input type="text" name="firstname" value="<%= emp.getFirstName() %>">
                </div>
                <div class="field padding-bottom--24">
                    <label for="lastname">Last Name</label>
						<input type="text" name="lastname" value="<%= emp.getLastName() %>">
                </div>
                 <% if (emp.isAdmin()) { %>
                <div class="field padding-bottom--24">
                    <label for="salary">Salary</label>
						<input type="text" name="salary" value="<%= emp.getSalary() %>" readonly>
                </div>
                <% } else { %>
                <div class="field padding-bottom--24">
                    <label for="salary">Salary</label>
						<input type="text" name="salary" value="<%= emp.getSalary() %>">
                </div>
                <% } %>
               <% if (!emp.isAdmin()) { %>
			    <div class="form-group" style="display: inline-block;">
			        <label for="isAdmin">Role :</label>
			        <input type="radio" class="form-control" id="isAdmin" name="isAdmin" value="true" > Admin
			        <input type="radio" class="form-control" id="isAdmin" name="isAdmin" value="false" checked> Normal User
			    </div>
				<% } else { %>
				    <label for="isAdmin">Role :</label>
				    <p>You do not have permission to change your role.</p>
				    <input type="hidden" name="isAdmin" value="<%= emp.isAdmin() %>">
				    </br>
				<% } %>
                <div class="field padding-bottom--24">
                    <div class="grid--50-50">
                        <label for="password">User Password</label>
                    </div>
						<input type="password" name="password" value="<%= emp.getPassword() %>">
                </div>

                <!-- Add hidden field to specify the operation -->
                <input type="hidden" name="operation" value="update">
				<div class="field padding-bottom--24">
                   <button "type="submit" class="btn btn-default" name="operation" value="update">UPDATE</button>
                </div>

            </form>
        </div>
    </div>
</div>
        </div>
        </div>
        </div>
        
<%
    } else {
        out.println("Employee not found for EmpId: " + empId);
    }
} else {
    out.println("EmpId parameter is missing from the URL.");
}
%>
</body>
</html>
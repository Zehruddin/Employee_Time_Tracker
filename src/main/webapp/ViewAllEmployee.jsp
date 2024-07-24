<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="employee.model.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Employee Details - SB ENTERPRISES</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* Global Styles */
.download-button{
    display: block;
    margin: 20px auto;
    padding: 10px 20px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    transition: background 0.3s;
    
}

.download-button:hover {
    background-color: #0056b3;
    
}
body, html {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	font-family: 'Arial', sans-serif;
	position: relative;
}
.background {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: url('https://free4kwallpapers.com/uploads/originals/2015/10/11/well-furnished-office-wallpaper.jpg') no-repeat center center fixed;
	background-size: cover;
	filter: blur(8px);
	z-index: -1;
}
.overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 0;
}
.container {
	margin: 20px auto;
	padding: 20px;
	width: 90%;
	flex-grow: 1;
	z-index: 1;
	position: relative;
	text-align: center;
}
h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}
.employee-tile {
	background: white;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin: 20px;
	width: 28%;
	box-sizing: border-box;
	display: inline-block;
	vertical-align: top;
	text-align: center;
	transition: transform 0.3s, box-shadow 0.3s;
}
.employee-tile:hover {
	transform: translateY(-10px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}
.employee-tile h3 {
	margin: 10px 0;
	color: #333;
}
.employee-tile p {
	margin: 5px 0;
	color: #777;
}
</style>
</head>
<body>
	<div class="background"></div>
	<div class="overlay"></div>
	<div class="container">
		<h2>View Employee Details</h2>
		<div id="employee-tiles">
			<%
				List<Employee> employees = (List<Employee>) request.getAttribute("employees");
				if (employees != null && !employees.isEmpty()) {
					for (Employee employee : employees) {
			%>
			<div class="employee-tile">
				<h3><%= employee.getFirstName() %> <%= employee.getLastName() %></h3>
				<p>ID: <%= employee.getEmpId() %></p>
				<p>Email: <%= employee.getEmail() %></p>
				<p>Role: <%= employee.getRole() %></p>

			</div>
			<%
					}
				} else {
			%>
			<p>No employees available.</p>
			<%
				}
			%>
		</div>
		<a href="AdminDashboard.jsp"><button class="download-button" >Admin Dashboard</button></a>
	</div>
	
</body>
</html>
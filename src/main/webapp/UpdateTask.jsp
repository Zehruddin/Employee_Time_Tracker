<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="employee.doa.DBConnection" %>
<%@ page import="employee.servlets.FetchTaskServlet" %>
<%@ page import="employee.model.Task_model" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Task - SB ENTERPRISES</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* Global Styles */
body, html {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    font-family: 'Arial', sans-serif;
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

.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

p,input, select {
    margin: 10px 0;
    padding: 10px;
    width: 80%;
    max-width: 400px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

button {
    margin: 20px 0;
    padding: 10px 20px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
    <div class="background"></div>
    <div class="container">
        <h2>Update Task</h2>
        <% List<Task_model> task_model=(List<Task_model>) request.getAttribute("task_model");
			for(Task_model list:task_model){        
        %>
        <form action="UpdateTaskServlet" method="post">
        	<p>Task Id</p><input type="text" name="task_id" placeholder="Employee ID" value="<%=list.getTask_id() %>">
            <p>Employee Id</p><input type="text" name="emp_id" placeholder="Employee ID" value="<%=list.getEmp_id() %>">
            <p>Start Date</p><input type="text" name="s_date" placeholder="Start Date (YYYY-MM-DD)" value="<%=list.getS_date() %>">
            <p>Start Time</p><input type="text" name="s_time" placeholder="Start Time (HH:MM:SS)" value="<%=list.getS_time() %>">
            <p>End Date</p><input type="text" name="e_date" placeholder="End Date (YYYY-MM-DD)" value="<%=list.getE_date() %>">
            <p>End Time</p><input type="text" name="e_time" placeholder="End Time (HH:MM:SS)" value="<%=list.getE_time() %>">
            <p>Task</p><input type="text" name="task" placeholder="Task Description" value="<%=list.getTask() %>">
            <p>Duration</p><input type="number" name="duration" placeholder="Duration (hours)" value="<%=list.getDuration() %>">
            <button type="submit">Update Task</button>
        </form>
    </div><%} %>
</body>
</html>
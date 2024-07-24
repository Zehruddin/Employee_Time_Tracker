<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="employee.doa.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Task - SB ENTERPRISES</title>
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

input, select {
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
        <h2>Delete Task</h2>
        <%String TASK_ID=(String)session.getAttribute("t_id"); %>
        <form action="DeleteTaskServlet" method="post">
            <input type="text" name="emp_id" placeholder="Employee ID" value="<%=TASK_ID%>"readonly>
            <input type="text" name="task_id" placeholder="Task ID" required>
            <button type="submit">Delete Task</button>
        </form>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
            position: relative;
            overflow: hidden;
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

        .login-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            z-index: 1;
        }

        .login-container h1 {
            margin-bottom: 20px;
            text-align: center;
        }

        .login-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .input-container {
            position: relative;
            margin-bottom: 20px;
        }

        .input-container input[type="text"], 
        .input-container input[type="password"] {
            width: calc(100% - 50px); /* Adjust width to fit inside container with icon */
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            padding-left: 40px; /* Add padding for icon */
        }

        .input-container .icon {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            font-size: 20px;
            color: #666;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
        }

        .login-container button {
            width: 48%;
            padding: 10px;
            background-color: orange;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s;
        }

        .login-container button:hover {
            background-color: darkorange;
        }

        .reset-button {
            background-color: #333;
        }

        .reset-button:hover {
            background-color: #555;
        }

        .forget-password {
            text-align: center;
            margin-top: 10px;
        }

        .forget-password a {
            color: #191970;
            text-decoration: none;
        }

        .forget-password a:hover {
            text-decoration: underline;
        }

        .tab-container {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }

        .tab {
            width: 50%;
            text-align: center;
            padding: 10px;
            cursor: pointer;
            border-bottom: 2px solid transparent;
            font-weight: 500;
        }

        .tab.active {
            border-bottom: 2px solid orange;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="background"></div>
    <div class="login-container">
        <div class="tab-container">
            <div class="tab active" id="adminTab" onclick="switchTab('admin')">Admin</div>
            <div class="tab" id="employeeTab" onclick="switchTab('employee')">Employee</div>
        </div>
        <h1 id="loginTitle">Admin Login</h1>
        <form action="LoginServlet" method="post">
            <div class="input-container">
                <label for="username">Username:</label>
                <i class="fas fa-user icon"></i>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="input-container">
                <label for="password">Password:</label>
                <i class="fas fa-lock icon"></i>
                <input type="password" id="password" name="password" required>
            </div>

            <input type="hidden" id="role" name="role" value="admin">

            <div class="button-container">
                <button type="submit">Login</button>
                <button type="button" class="reset-button" onclick="resetForm()">Reset</button>
            </div>
        </form>
    </div>

    <script>
        function switchTab(role) {
            document.getElementById('adminTab').classList.remove('active');
            document.getElementById('employeeTab').classList.remove('active');
            document.getElementById('role').value = role;
            document.getElementById(role + 'Tab').classList.add('active');
            document.getElementById('loginTitle').textContent = role.charAt(0).toUpperCase() + role.slice(1) + ' Login';
        }

        function resetForm() {
            document.getElementById('username').value = '';
            document.getElementById('password').value = '';
        }
    </script>
</body>
</html>
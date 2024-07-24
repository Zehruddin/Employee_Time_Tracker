<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Dashboard - SB ENTERPRISES</title>
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
}

.operations {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    margin-top: 20px;
}

.operation-box {
    width: 150px;
    height: 150px;
    border-radius: 10px;
    background: rgba(255, 255, 255, 0.8);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    cursor: pointer;
    transition: background 0.3s;
    text-align: center;
    margin: 10px;
}

.operation-box:hover {
    background: rgba(255, 255, 255, 1);
}

.operation-box i {
    font-size: 40px;
    color: #333;
    font-weight: bold;
}

.operation-box p {
    margin: 0;
    font-size: 14px;
    font-weight: bold;
}

.nav {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}

a {
    font-size: 1.6rem;
    text-decoration: none;
    font-family: monospace;
    font-weight: bold;
}

button {
    background-color: transparent;
    border: none;
    cursor: pointer;
    font-weight: bold;
}

.status-box {
    width: 100%;
    display: flex;
    justify-content: space-around;
    margin-top: 20px;
}

.status-box div {
    width: 30%;
    padding: 10px;
    border-radius: 5px;
    text-align: center;
    color: white;
}

.status-box .completed {
    background: green;
}

.status-box .pending {
    background: orange;
}

.status-box .not-started {
    background: red;
}

.chart-container {
    width: 100%;
    height: 400px;
    margin-top: 20px;
}

.logout {
    text-align: center;
    margin-top: 20px;
}
</style>
</head>
<body>
    <div class="background"></div>
    <div class="container">
        <div class="nav">
            <a>Employee Dashboard</a>
            <a href="Login.jsp">Logout</a>
        </div>
        <div class="operations">
            <div class="operation-box" onclick="viewTasks()">
                <i class="fas fa-tasks"></i>
                <p>View Tasks</p>
            </div>
            
        </div>
        
        <div class="chart-container" id="chart-container">
            <canvas id="chart"></canvas>
        </div>
        <div class="logout">
            <button onclick="logout()">Logout</button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        function viewTasks() {
            window.location.href = 'ViewOneEmployeeTask.jsp';
        }

        function taskCompletion() {
            document.getElementById('completed-status').innerText = 5;
            document.getElementById('pending-status').innerText = 3;
            document.getElementById('not-started-status').innerText = 2;
        }

        function viewReports() {
            const ctx = document.getElementById('chart').getContext('2d');
            const chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Hourly', 'Weekly', 'Monthly'],
                    datasets: [{
                        label: 'Task Duration',
                        data: [12, 50, 200],
                        backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
                        borderColor: ['rgba(75, 192, 192, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)'],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }

        function logout() {
            window.location.href = 'Login.jsp';
        }
    </script>
</body>
</html>
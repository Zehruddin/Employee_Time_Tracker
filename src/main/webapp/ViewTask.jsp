<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="employee.doa.DBConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Tasks - SB ENTERPRISES</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
    background: url('https://static.vecteezy.com/system/resources/previews/000/633/705/original/abstract-gradient-geometric-background-simple-shapes-with-trendy-gradients-vector.jpg') no-repeat center center fixed;
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

.table-container {
    width: 100%;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}
.update-button,.delete-button{
    display: flex;
    margin: 8px;
    padding: 10px 20px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    transition: background 0.3s;
    
}



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

#chart-container {
    width: 100%;
    max-width: 500px;
    margin: 50px auto;
}

.chart-canvas {
    width: 100%;
    max-width: 400px;
    margin: 50px auto;
}
</style>
</head>
<body>
    <div class="background"></div>
    <div class="container">
        <h2>Tasks Details</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                    	<th>Task Id</th>
                        <th>Employee Id</th>                   
                        <th>Start Date</th>
                        <th>Start Time</th>
                        <th>End Date</th>
                        <th>End Time</th>
                        <th>Task</th>
                        <th>Duration (hours)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="task-table-body">
                    <%
                        Connection con = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        String jsonData = "";
                        String jsonHourly = "";
                        String jsonWeekly = "";
                        String jsonMonthly = "";

                        try {
                            DBConnection obj = new DBConnection();
                            rs = obj.View_Employee_tasks();

                            jsonData = "[";
                            jsonHourly = "[";
                            jsonWeekly = "[";
                            jsonMonthly = "[";

                            while (rs.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs.getString("task_id") + "</td>");
                                
                                out.println("<td>" + rs.getString("emp_id") + "</td>");
                                out.println("<td>" + rs.getString("s_date") + "</td>");
                                out.println("<td>" + rs.getString("s_time") + "</td>");
                                out.println("<td>" + rs.getString("e_date") + "</td>");
                                out.println("<td>" + rs.getString("e_time") + "</td>");
                                out.println("<td>" + rs.getString("task") + "</td>");
                                out.println("<td>" + rs.getInt("duration") + "</td>");
                                out.println("<td>");
                                out.println("<form action='FetchTaskServlet' method='get' style='display:inline;'>");
                                out.println("<input type='hidden' name='task_id' value='" + rs.getString("task_id") + "'>");
                                out.println("<input type='hidden' name='emp_id' value='" + rs.getString("emp_id") + "'>");
                                out.println("<button type='submit' class='update-button'>Update</button>");
                                out.println("</form>");
                                out.println("<form action='DeleteTaskServlet' method='post' style='display:inline;'>");
                                out.println("<input type='hidden' name='task_id' value='" + rs.getString("task_id") + "'>");
                                out.println("<input type='hidden' name='emp_id' value='" + rs.getString("emp_id")+ "'>");
                                out.println("<button type='submit' class='delete-button'>Delete</button>");
                                out.println("</form>");
                                out.println("</td>");
                                out.println("</tr>");

                                jsonData += "{\"task\":\"" + rs.getString("task") + "\", \"duration\":" + rs.getInt("duration") + "},";
                                jsonHourly += "{\"hour\":\"" + rs.getString("s_time").substring(0, 2) + "\", \"duration\":" + rs.getInt("duration") + "},";
                                jsonWeekly += "{\"week\":\"" + rs.getString("s_date").substring(0, 7) + "\", \"duration\":" + rs.getInt("duration") + "},";
                                jsonMonthly += "{\"month\":\"" + rs.getString("s_date").substring(0, 7) + "\", \"duration\":" + rs.getInt("duration") + "},";
                            }

                            jsonData = jsonData.substring(0, jsonData.length() - 1) + "]";
                            jsonHourly = jsonHourly.substring(0, jsonHourly.length() - 1) + "]";
                            jsonWeekly = jsonWeekly.substring(0, jsonWeekly.length() - 1) + "]";
                            jsonMonthly = jsonMonthly.substring(0, jsonMonthly.length() - 1) + "]";
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                            if (con != null) try { con.close(); } catch (SQLException ignore) {}
                        }
                    %>
                </tbody>
            </table>
        </div>
        
        <button class="download-button" onclick="downloadStatus()">Download Status</button>


    <div id="chart-container">
        <canvas id="taskChart"></canvas>
    </div>

    <div class="chart-canvas">
        <h3>Hourly Task Duration</h3>
        <canvas id="hourlyChart"></canvas>
    </div>
    <div class="chart-canvas">
        <h3>Weekly Task Duration</h3>
        <canvas id="weeklyChart"></canvas>
    </div>
    <div class="chart-canvas">
        <h3>Monthly Task Duration</h3>
        <canvas id="monthlyChart"></canvas>
    </div>

    <script>
        function downloadStatus() {
            const { jsPDF } = window.jspdf;

            const doc = new jsPDF();

            doc.text("Task Status Report", 20, 20);

            const tableHeaders = ["Employee Id", "Start Date", "Start Time", "End Date", "End Time", "Task", "Duration (hours)"];

            const tableData = Array.from(document.querySelectorAll("#task-table-body tr")).map(row => {
                return Array.from(row.querySelectorAll("td")).map(cell => cell.textContent);
            });

            doc.autoTable({
                head: [tableHeaders],
                body: tableData,
            });

            doc.save('tasks_status.pdf');
        }

        document.addEventListener('DOMContentLoaded', function() {
            const jsonData = <%= jsonData %>;
            const jsonHourly = <%= jsonHourly %>;
            const jsonWeekly = <%= jsonWeekly %>;
            const jsonMonthly = <%= jsonMonthly %>;

            const taskDurations = jsonData.reduce((acc, item) => {
                if (acc[item.task]) {
                    acc[item.task] += item.duration;
                } else {
                    acc[item.task] = item.duration;
                }
                return acc;
            }, {});

            const hourlyDurations = jsonHourly.reduce((acc, item) => {
                if (acc[item.hour]) {
                    acc[item.hour] += item.duration;
                } else {
                    acc[item.hour] = item.duration;
                }
                return acc;
            }, {});

            const weeklyDurations = jsonWeekly.reduce((acc, item) => {
                if (acc[item.week]) {
                    acc[item.week] += item.duration;
                } else {
                    acc[item.week] = item.duration;
                }
                return acc;
            }, {});

            const monthlyDurations = jsonMonthly.reduce((acc, item) => {
                if (acc[item.month]) {
                    acc[item.month] += item.duration;
                } else {
                    acc[item.month] = item.duration;
                }
                return acc;
            }, {});

            const tasks = Object.keys(taskDurations);
            const durations = Object.values(taskDurations);

            const hours = Object.keys(hourlyDurations);
            const hourlyData = Object.values(hourlyDurations);

            const weeks = Object.keys(weeklyDurations);
            const weeklyData = Object.values(weeklyDurations);

            const months = Object.keys(monthlyDurations);
            const monthlyData = Object.values(monthlyDurations);

            const ctxTask = document.getElementById('taskChart').getContext('2d');
            new Chart(ctxTask, {
                type: 'pie',
                data: {
                    labels: tasks,
                    datasets: [{
                        data: durations,
                        backgroundColor: [
                            '#FF6384',
                            '#36A2EB',
                            '#FFCE56',
                            '#4BC0C0',
                            '#9966FF',
                            '#FF9F40'
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    const label = context.label || '';
                                    const value = context.raw || 0;
                                    return `${label}: ${value} hours`;
                                }
                            }
                        }
                    }
                }
            });

            const ctxHourly = document.getElementById('hourlyChart').getContext('2d');
            new Chart(ctxHourly, {
                type: 'bar',
                data: {
                    labels: hours,
                    datasets: [{
                        label: 'Hourly Task Duration',
                        data: hourlyData,
                        backgroundColor: '#36A2EB'
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Hours'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Duration (hours)'
                            }
                        }
                    }
                }
            });

            const ctxWeekly = document.getElementById('weeklyChart').getContext('2d');
            new Chart(ctxWeekly, {
                type: 'bar',
                data: {
                    labels: weeks,
                    datasets: [{
                        label: 'Weekly Task Duration',
                        data: weeklyData,
                        backgroundColor: '#FF6384'
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Weeks'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Duration (hours)'
                            }
                        }
                    }
                }
            });

            const ctxMonthly = document.getElementById('monthlyChart').getContext('2d');
            new Chart(ctxMonthly, {
                type: 'bar',
                data: {
                    labels: months,
                    datasets: [{
                        label: 'Monthly Task Duration',
                        data: monthlyData,
                        backgroundColor: '#FFCE56'
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Months'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Duration (hours)'
                            }
                        }
                    }
                }
            });
        });
    </script>
    <a href="AdminDashboard.jsp"><button class="download-button" >Admin Dashboard</button></a>
</body>
</html>

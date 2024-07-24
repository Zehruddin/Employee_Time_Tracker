<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SB Enterprises - Home</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap');

        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: 'Roboto', sans-serif;
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

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 50px;
            background-color: rgba(0, 0, 0, 0.6);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 10;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
            font-weight: 500;
        }

        .navbar a:hover {
            color: orange;
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .section {
            padding: 100px 50px;
            text-align: center;
            position: absolute;
            width: 100%;
            top: 0;
            bottom: 0;
            display: none;
        }

        .section.active {
            display: block;
            justify-content: center;
            align-items: center;
        }

        .section h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        .section p {
            font-size: 1.2em;
            margin: 0;
        }

        .login-icon {
            position: fixed;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            z-index: 20;
        }

        .login-icon a {
            display: block;
            width: 50px;
            height: 50px;
            background-color: orange;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            color: #fff;
            font-size: 24px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            transition: background-color 0.3s;
        }

        .login-icon a:hover {
            background-color: darkorange;
        }
    </style>
</head>
<body>
    <div class="background"></div>
    <nav class="navbar">
        <div class="logo">SB Enterprises</div>
        <div>
            <a href="javascript:void(0)" onclick="showSection('home')">Home</a>
            <a href="javascript:void(0)" onclick="showSection('about')">About</a>
            <a href="javascript:void(0)" onclick="showSection('events')">Events</a>
            <a href="javascript:void(0)" onclick="showSection('contact')">Contact</a>
        </div>
    </nav>

    <div id="home" class="section active">
        <div>
            <h2>Welcome to SB Enterprises</h2>
            <p>Your partner in innovation and excellence.</p>
        </div>
    </div>

    <div id="about" class="section">
        <div>
            <h2>About Us</h2>
            <p>We are committed to providing the best services and solutions for our clients. Our team of professionals is dedicated to delivering quality and excellence in everything we do.</p>
        </div>
    </div>

    <div id="events" class="section">
        <div>
            <h2>Our Events</h2>
            <p>Join us for our upcoming events where we showcase our latest products and innovations. Stay tuned for exciting announcements and opportunities to engage with us.</p>
        </div>
    </div>

    <div id="contact" class="section">
        <div>
            <h2>Contact Us</h2>
            <p>Have questions or need support? Reach out to us through our contact page and we will be happy to assist you.</p>
        </div>
    </div>

    <div class="login-icon">
        <a href="Login.jsp">&#128100;</a> <!-- Using a Unicode icon for user -->
    </div>

    <script>
        function showSection(sectionId) {
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => {
                section.classList.remove('active');
            });
            document.getElementById(sectionId).classList.add('active');
        }
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us - MatdaanPortal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <link type="image/x-icon" href="assets/img/logo.png" rel="icon">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <style>
        body {
            background: #f4f7fb;
        }

        .about-hero {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            padding: 55px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(30, 60, 114, 0.25);
        }

        .about-hero h2 {
            font-weight: 700;
            margin-bottom: 12px;
            color: #ffffff !important;
        }

        .about-hero p {
            font-size: 16px;
            opacity: 0.95;
        }

        .about-card {
            background: white;
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }

        .about-card h3 {
            color: #1e3c72;
            font-weight: 700;
            margin-bottom: 18px;
        }

        .about-card p {
            color: #555;
            line-height: 1.8;
            font-size: 16px;
        }

        .feature-card {
            background: white;
            border-radius: 18px;
            padding: 28px 22px;
            text-align: center;
            min-height: 230px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            transition: 0.3s ease;
            margin-bottom: 25px;
        }

        .feature-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.12);
        }

        .feature-icon {
            width: 65px;
            height: 65px;
            border-radius: 50%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 18px;
            font-size: 26px;
        }

        .icon-secure {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .icon-voter {
            background: linear-gradient(135deg, #00b09b, #96c93d);
        }

        .icon-result {
            background: linear-gradient(135deg, #f7971e, #ffd200);
        }

        .icon-admin {
            background: linear-gradient(135deg, #ff9966, #ff5e62);
        }

        .feature-card h4 {
            font-weight: 700;
            color: #222;
            margin-bottom: 12px;
        }

        .feature-card p {
            color: #6c757d;
            font-size: 15px;
            line-height: 1.7;
        }

        .tech-card {
            background: white;
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 35px;
        }

        .tech-card h3 {
            color: #1e3c72;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .tech-badge {
            display: inline-block;
            background: #f1f5ff;
            color: #1e3c72;
            border-radius: 25px;
            padding: 10px 18px;
            margin: 7px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="about-hero text-center">
                <h2>About MatdaanPortal</h2>
                <p>A secure, simple and transparent online voting management system.</p>
            </div>

            <div class="about-card">
                <h3>
                    <i class="fas fa-vote-yea"></i> Project Overview
                </h3>

                <p>
                    MatdaanPortal is a web-based online voting system designed to make the voting process simple,
                    secure and easy to manage. The system allows voters to log in, view active elections,
                    cast their vote and check live results.
                </p>

                <p>
                    Admin can manage voters, candidates, election type and monitor candidate-wise results.
                    The main goal of this project is to reduce manual work and provide a transparent digital voting experience.
                </p>
            </div>

            <div class="row">

                <div class="col-md-3">
                    <div class="feature-card">
                        <div class="feature-icon icon-secure">
                            <i class="fas fa-shield-alt"></i>
                        </div>

                        <h4>Secure Voting</h4>
                        <p>
                            Voter authentication and duplicate vote restriction help keep the voting process safe.
                        </p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="feature-card">
                        <div class="feature-icon icon-voter">
                            <i class="fas fa-users"></i>
                        </div>

                        <h4>Voter Management</h4>
                        <p>
                            Admin can add, update, delete and search voter records from the admin panel.
                        </p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="feature-card">
                        <div class="feature-icon icon-admin">
                            <i class="fas fa-user-tie"></i>
                        </div>

                        <h4>Candidate Management</h4>
                        <p>
                            Admin can manage candidate details, party name, election type and candidate photo.
                        </p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="feature-card">
                        <div class="feature-icon icon-result">
                            <i class="fas fa-chart-bar"></i>
                        </div>

                        <h4>Live Results</h4>
                        <p>
                            Candidate-wise vote count and result analysis are shown in a clear visual format.
                        </p>
                    </div>
                </div>

            </div>

            <div class="tech-card text-center">
                <h3>
                    <i class="fas fa-laptop-code"></i> Technologies Used
                </h3>

                <span class="tech-badge">Java</span>
                <span class="tech-badge">Spring Boot</span>
                <span class="tech-badge">JSP</span>
                <span class="tech-badge">JDBC</span>
                <span class="tech-badge">MySQL</span>
                <span class="tech-badge">HTML</span>
                <span class="tech-badge">CSS</span>
                <span class="tech-badge">Bootstrap</span>
                <span class="tech-badge">MVC Architecture</span>
                <span class="tech-badge">DAO Pattern</span>
            </div>

        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/script.js"></script>

</body>
</html>
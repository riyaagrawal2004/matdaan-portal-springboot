<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MatdaanPortal - Online Voting System</title>
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

        .home-hero {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            padding: 70px 30px;
            border-radius: 22px;
            margin: 30px 0;
            box-shadow: 0 12px 35px rgba(30, 60, 114, 0.28);
        }

        .home-hero h1 {
            color: #ffffff !important;
            font-weight: 800;
            font-size: 42px;
            margin-bottom: 18px;
        }

        .home-hero p {
            font-size: 18px;
            line-height: 1.8;
            opacity: 0.95;
        }

        .hero-btn {
            border-radius: 14px;
            padding: 13px 28px;
            font-weight: 700;
            margin: 8px;
        }

        .feature-card {
            background: white;
            border-radius: 18px;
            padding: 30px 22px;
            text-align: center;
            min-height: 245px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            transition: 0.3s ease;
            margin-bottom: 25px;
        }

        .feature-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.12);
        }

        .feature-icon {
            width: 68px;
            height: 68px;
            border-radius: 50%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 18px;
            font-size: 28px;
        }

        .icon-secure {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .icon-vote {
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
            line-height: 1.7;
        }

        .section-title {
            text-align: center;
            margin: 45px 0 30px;
        }

        .section-title h2 {
            font-weight: 800;
            color: #1e3c72;
        }

        .section-title p {
            color: #6c757d;
            font-size: 16px;
        }

        .process-card {
            background: white;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 25px;
            min-height: 220px;
        }

        .step-number {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            margin-bottom: 15px;
        }

        .process-card h4 {
            color: #1e3c72;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .process-card p {
            color: #555;
            line-height: 1.7;
        }

        .cta-box {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            border-radius: 22px;
            padding: 45px 25px;
            text-align: center;
            margin: 40px 0;
            box-shadow: 0 12px 35px rgba(17, 153, 142, 0.25);
        }

        .cta-box h2 {
            color: #ffffff !important;
            font-weight: 800;
            margin-bottom: 12px;
        }

        .cta-box p {
            font-size: 16px;
            opacity: 0.95;
        }
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="home-hero text-center">
                <h1>Welcome to MatdaanPortal</h1>

                <p>
                    A secure, simple and transparent online voting system where voters can cast their vote
                    and admins can manage the complete election process efficiently.
                </p>

                <div class="mt-4">
                    <a href="<%=request.getContextPath()%>/login" class="btn btn-success hero-btn">
                        <i class="fas fa-vote-yea"></i> Voter Login
                    </a>

                    <a href="<%=request.getContextPath()%>/adminlogin" class="btn btn-light hero-btn">
                        <i class="fas fa-user-shield"></i> Admin Login
                    </a>

                    <a href="<%=request.getContextPath()%>/aboutus" class="btn btn-warning hero-btn">
                        <i class="fas fa-info-circle"></i> About Project
                    </a>
                </div>
            </div>

            <div class="section-title">
                <h2>Key Features</h2>
                <p>MatdaanPortal provides important features for voters and administrators.</p>
            </div>

            <div class="row">

                <div class="col-md-3">
                    <div class="feature-card">
                        <div class="feature-icon icon-secure">
                            <i class="fas fa-shield-alt"></i>
                        </div>

                        <h4>Secure Voting</h4>

                        <p>
                            Voter authentication and duplicate vote prevention help keep the election process safe.
                        </p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="feature-card">
                        <div class="feature-icon icon-vote">
                            <i class="fas fa-vote-yea"></i>
                        </div>

                        <h4>Easy Vote Casting</h4>

                        <p>
                            Voters can select a candidate and submit their vote through a simple voting interface.
                        </p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="feature-card">
                        <div class="feature-icon icon-admin">
                            <i class="fas fa-user-tie"></i>
                        </div>

                        <h4>Admin Control</h4>

                        <p>
                            Admin can manage voters, candidates, election type and monitor the election process.
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
                            Candidate-wise vote count and leading candidate details are shown in visual format.
                        </p>
                    </div>
                </div>

            </div>

            <div class="section-title">
                <h2>How It Works</h2>
                <p>Simple steps to complete the online voting process.</p>
            </div>

            <div class="row">

                <div class="col-md-4">
                    <div class="process-card">
                        <div class="step-number">1</div>

                        <h4>Login</h4>

                        <p>
                            Voter logs in using valid username and password.
                            Admin logs in to manage election setup and records.
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="process-card">
                        <div class="step-number">2</div>

                        <h4>Cast Vote</h4>

                        <p>
                            Voter enters registered voter ID, selects a candidate and submits the vote securely.
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="process-card">
                        <div class="step-number">3</div>

                        <h4>View Results</h4>

                        <p>
                            Voters and admins can view live candidate-wise results with vote count and percentage.
                        </p>
                    </div>
                </div>

            </div>

            <div class="cta-box">
                <h2>Ready to Vote?</h2>

                <p>
                    Login to your voter account and participate in the active election.
                </p>

                <a href="<%=request.getContextPath()%>/login" class="btn btn-light hero-btn">
                    <i class="fas fa-sign-in-alt"></i> Go to Voter Login
                </a>

                <a href="<%=request.getContextPath()%>/contact" class="btn btn-warning hero-btn">
                    <i class="fas fa-envelope"></i> Contact Support
                </a>
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
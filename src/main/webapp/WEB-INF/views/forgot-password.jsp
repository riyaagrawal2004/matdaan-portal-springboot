<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password - MatdaanPortal</title>
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

        .forgot-wrapper {
            min-height: 85vh;
            display: flex;
            align-items: center;
            padding: 40px 0;
        }

        .forgot-card {
            background: white;
            border-radius: 22px;
            overflow: hidden;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.10);
        }

        .forgot-left {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 55px 35px;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .forgot-left h2 {
            color: #ffffff !important;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .forgot-left p {
            font-size: 16px;
            line-height: 1.8;
            opacity: 0.95;
        }

        .icon-box {
            width: 75px;
            height: 75px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.22);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 34px;
            margin-bottom: 25px;
        }

        .forgot-right {
            padding: 45px 38px;
        }

        .forgot-right h3 {
            color: #667eea;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #6c757d;
            margin-bottom: 25px;
        }

        .form-control {
            height: 50px;
            border-radius: 14px;
            padding-left: 45px;
        }

        .input-group-box {
            position: relative;
            margin-bottom: 22px;
        }

        .input-group-box i {
            position: absolute;
            left: 16px;
            top: 16px;
            color: #667eea;
            z-index: 2;
        }

        .reset-btn {
            width: 100%;
            border: none;
            border-radius: 14px;
            padding: 14px;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            transition: 0.3s ease;
        }

        .reset-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.35);
            color: white;
        }

        .message-box {
            border-radius: 12px;
            font-weight: 600;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
            background: #f1f3ff;
            border-radius: 14px;
            padding: 14px;
        }

        .back-link a {
            color: #667eea;
            font-weight: 700;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<%
    String msg = (String) request.getAttribute("msg");
%>

<div class="main-wrapper">
    <div class="forgot-wrapper">
        <div class="container">
            <div class="row justify-content-center">

                <div class="col-lg-10">
                    <div class="forgot-card">
                        <div class="row no-gutters">

                            <div class="col-md-5">
                                <div class="forgot-left">
                                    <div class="icon-box">
                                        <i class="fas fa-key"></i>
                                    </div>

                                    <h2>Forgot Password?</h2>

                                    <p>
                                        Don’t worry. Enter your registered email or username and submit your password reset request.
                                    </p>

                                    <p>
                                        The MatdaanPortal admin can verify your account and help you recover access.
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-7">
                                <div class="forgot-right">

                                    <h3>Reset Password Request</h3>
                                    <p class="subtitle">Enter your registered email or username.</p>

                                    <% if (msg != null) { %>
                                        <div class="alert alert-info text-center message-box">
                                            <i class="fas fa-info-circle"></i>
                                            <%= msg %>
                                        </div>
                                    <% } %>

                                    <form action="<%=request.getContextPath()%>/forgot-password" method="post">

                                        <div class="input-group-box">
                                            <i class="fas fa-envelope"></i>
                                            <input type="text" name="email" class="form-control"
                                                   placeholder="Enter email or username" required>
                                        </div>

                                        <button type="submit" class="reset-btn">
                                            <i class="fas fa-paper-plane"></i> Submit Request
                                        </button>

                                    </form>

                                    <div class="back-link">
                                        Remember your password?
                                        <a href="<%=request.getContextPath()%>/login">Back to Voter Login</a>
                                        <br>
                                        <a href="<%=request.getContextPath()%>/adminlogin">Back to Admin Login</a>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

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
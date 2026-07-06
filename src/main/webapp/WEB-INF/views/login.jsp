<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Voter Login - MatdaanPortal</title>
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

        .login-wrapper {
            min-height: 85vh;
            display: flex;
            align-items: center;
            padding: 40px 0;
        }

        .login-card {
            background: #ffffff;
            border-radius: 22px;
            overflow: hidden;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.10);
        }

        .login-left {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            padding: 55px 35px;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-left h2 {
            color: #ffffff !important;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .login-left p {
            font-size: 16px;
            line-height: 1.8;
            opacity: 0.95;
        }

        .login-left .icon-box {
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

        .login-right {
            padding: 45px 38px;
        }

        .login-right h3 {
            color: #11998e;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .login-right .subtitle {
            color: #6c757d;
            margin-bottom: 28px;
        }

        .form-control {
            height: 50px;
            border-radius: 14px;
            padding-left: 45px;
        }

        .input-group-box {
            position: relative;
            margin-bottom: 20px;
        }

        .input-group-box i {
            position: absolute;
            left: 16px;
            top: 16px;
            color: #11998e;
            z-index: 2;
        }

        .login-btn {
            width: 100%;
            border: none;
            border-radius: 14px;
            padding: 14px;
            font-weight: 700;
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            transition: 0.3s ease;
        }

        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(17, 153, 142, 0.35);
            color: white;
        }

        .extra-links {
            margin-top: 22px;
            text-align: center;
        }

        .extra-links a {
            color: #11998e;
            font-weight: 600;
            text-decoration: none;
        }

        .extra-links a:hover {
            text-decoration: underline;
        }

        .message-box {
            border-radius: 12px;
            font-weight: 600;
        }

        .switch-box {
            background: #f1fff9;
            border-radius: 14px;
            padding: 15px;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<%
    String msg = (String) request.getAttribute("msg");
%>

<div class="main-wrapper">
    <div class="login-wrapper">
        <div class="container">
            <div class="row justify-content-center">

                <div class="col-lg-10">
                    <div class="login-card">
                        <div class="row no-gutters">

                            <div class="col-md-5">
                                <div class="login-left">
                                    <div class="icon-box">
                                        <i class="fas fa-vote-yea"></i>
                                    </div>

                                    <h2>Welcome Voter</h2>

                                    <p>
                                        Login to MatdaanPortal and cast your vote securely.
                                        Your vote helps strengthen a transparent and fair election process.
                                    </p>

                                    <p>
                                        One voter can vote only once in the active election.
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-7">
                                <div class="login-right">

                                    <h3>Voter Login</h3>
                                    <p class="subtitle">Enter your username and password to continue.</p>

                                    <% if (msg != null) { %>
                                        <div class="alert alert-danger text-center message-box">
                                            <i class="fas fa-info-circle"></i>
                                            <%= msg %>
                                        </div>
                                    <% } %>

                                    <form action="<%=request.getContextPath()%>/UserServlet" method="post">

                                        <div class="input-group-box">
                                            <i class="fas fa-user"></i>
                                            <input type="text" name="username" class="form-control"
                                                   placeholder="Enter username" required>
                                        </div>

                                        <div class="input-group-box">
                                            <i class="fas fa-lock"></i>
                                            <input type="password" name="password" class="form-control"
                                                   placeholder="Enter password" required>
                                        </div>

                                        <button type="submit" class="login-btn">
                                            <i class="fas fa-sign-in-alt"></i> Login
                                        </button>

                                    </form>

                                    <div class="extra-links">
                                      <a href="<%=request.getContextPath()%>/forgot-password">
                                            Forgot Password?
                                         </a>
                                   </div>

                                    <div class="switch-box">
                                        Are you an admin?
                                        <a href="<%=request.getContextPath()%>/adminlogin">
                                            Login as Admin
                                        </a>
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
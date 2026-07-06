<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Voter Registration - MatdaanPortal</title>
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

        .register-wrapper {
            min-height: 85vh;
            display: flex;
            align-items: center;
            padding: 40px 0;
        }

        .register-card {
            background: white;
            border-radius: 22px;
            overflow: hidden;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.10);
        }

        .register-left {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            padding: 55px 35px;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .register-left h2 {
            color: #ffffff !important;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .register-left p {
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

        .register-right {
            padding: 45px 38px;
        }

        .register-right h3 {
            color: #11998e;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #6c757d;
            margin-bottom: 25px;
        }

        .form-control {
            height: 48px;
            border-radius: 14px;
        }

        .register-btn {
            width: 100%;
            border: none;
            border-radius: 14px;
            padding: 14px;
            font-weight: 700;
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            transition: 0.3s ease;
            margin-top: 10px;
        }

        .register-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(17, 153, 142, 0.35);
            color: white;
        }

        .message-box {
            border-radius: 12px;
            font-weight: 600;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            background: #f1fff9;
            border-radius: 14px;
            padding: 14px;
        }

        .login-link a {
            color: #11998e;
            font-weight: 700;
            text-decoration: none;
        }
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<%
    String msg = (String) request.getAttribute("msg");
%>

<div class="main-wrapper">
    <div class="register-wrapper">
        <div class="container">
            <div class="row justify-content-center">

                <div class="col-lg-11">
                    <div class="register-card">
                        <div class="row no-gutters">

                            <div class="col-md-5">
                                <div class="register-left">
                                    <div class="icon-box">
                                        <i class="fas fa-user-plus"></i>
                                    </div>

                                    <h2>Create Voter Account</h2>

                                    <p>
                                        Register yourself on MatdaanPortal and participate in the active election securely.
                                    </p>

                                    <p>
                                        Your Voter ID will be used to verify your vote and prevent duplicate voting.
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-7">
                                <div class="register-right">

                                    <h3>Voter Registration</h3>
                                    <p class="subtitle">Fill your details carefully to create your voter account.</p>

                                    <% if (msg != null) { %>
                                        <div class="alert alert-info text-center message-box">
                                            <i class="fas fa-info-circle"></i>
                                            <%= msg %>
                                        </div>
                                    <% } %>

                                    <form action="<%=request.getContextPath()%>/RegisterServlet" method="post">

                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label><b>Username</b></label>
                                                    <input type="text" name="username" class="form-control"
                                                           placeholder="Enter username" required>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label><b>Password</b></label>
                                                    <input type="password" name="password" class="form-control"
                                                           placeholder="Enter password" required>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label><b>Full Name</b></label>
                                                    <input type="text" name="full_name" class="form-control"
                                                           placeholder="Enter full name" required>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label><b>Age</b></label>
                                                    <input type="number" name="age" class="form-control"
                                                           placeholder="Enter age" required>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label><b>Mobile Number</b></label>
                                                    <input type="text" name="mobile" class="form-control"
                                                           placeholder="Enter 10 digit mobile number" maxlength="10" required>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label><b>Voter ID</b></label>
                                                    <input type="number" name="voter_id" class="form-control"
                                                           placeholder="Enter voter ID" required>
                                                </div>
                                            </div>

                                        </div>

                                        <button type="submit" class="register-btn">
                                            <i class="fas fa-user-plus"></i> Register
                                        </button>

                                    </form>

                                    <div class="login-link">
                                        Already have an account?
                                        <a href="<%=request.getContextPath()%>/login">Login here</a>
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
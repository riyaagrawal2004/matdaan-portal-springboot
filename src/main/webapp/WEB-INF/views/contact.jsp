<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us - MatdaanPortal</title>
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

        .contact-hero {
            background: linear-gradient(135deg, #00b09b, #96c93d);
            color: white;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(0, 176, 155, 0.25);
        }

        .contact-hero h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #ffffff !important;
        }

        .contact-hero p {
            font-size: 16px;
            opacity: 0.95;
        }

        .contact-card {
            background: white;
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 35px;
        }

        .contact-card h3 {
            color: #00b09b;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 12px;
        }

        .input-field {
            height: 50px;
        }

        textarea.form-control {
            resize: none;
        }

        .send-btn {
            border: none;
            border-radius: 14px;
            padding: 13px 30px;
            font-weight: 700;
            background: linear-gradient(135deg, #00b09b, #96c93d);
            color: white;
            transition: 0.3s ease;
        }

        .send-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 176, 155, 0.35);
            color: white;
        }

        .info-box {
            background: white;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 25px;
        }

        .info-icon {
            width: 58px;
            height: 58px;
            border-radius: 50%;
            background: linear-gradient(135deg, #00b09b, #96c93d);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 15px;
        }

        .info-box h4 {
            color: #00b09b;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .info-box p {
            color: #555;
            line-height: 1.7;
        }

        .message-box {
            border-radius: 12px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<%
    String msg = (String) request.getAttribute("msg");
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="contact-hero text-center">
                <h2>Contact Us</h2>
                <p>Have a question or need help? Send your query to MatdaanPortal support.</p>
            </div>

            <% if (msg != null) { %>
                <div class="alert alert-success text-center message-box">
                    <i class="fas fa-check-circle"></i>
                    <%= msg %>
                </div>
            <% } %>

            <div class="row">

                <div class="col-lg-8">
                    <div class="contact-card">

                        <h3>
                            <i class="fas fa-envelope"></i> Send Your Query
                        </h3>

                        <form action="<%=request.getContextPath()%>/contact-submit" method="post">

                            <div class="form-group">
                                <label><b>Your Name</b></label>
                                <input type="text" name="name" class="form-control input-field"
                                       placeholder="Enter your full name" required>
                            </div>

                            <div class="form-group">
                                <label><b>Email Address</b></label>
                                <input type="email" name="email" class="form-control input-field"
                                       placeholder="Enter your email address" required>
                            </div>

                            <div class="form-group">
                                <label><b>Your Message</b></label>
                                <textarea name="message" class="form-control" rows="6"
                                          placeholder="Write your message here..." required></textarea>
                            </div>

                            <div class="text-center mt-4">
                                <button type="submit" class="send-btn">
                                    <i class="fas fa-paper-plane"></i> Submit Query
                                </button>
                            </div>

                        </form>

                    </div>
                </div>

                <div class="col-lg-4">

                    <div class="info-box">
                        <div class="info-icon">
                            <i class="fas fa-vote-yea"></i>
                        </div>

                        <h4>MatdaanPortal Support</h4>

                        <p>
                            Our portal helps voters and admins manage the online voting process securely and smoothly.
                        </p>
                    </div>

                    <div class="info-box">
                        <div class="info-icon">
                            <i class="fas fa-user-shield"></i>
                        </div>

                        <h4>Admin Help</h4>

                        <p>
                            Contact support for issues related to election setup, candidate management, voter records or results.
                        </p>
                    </div>

                    <div class="info-box">
                        <div class="info-icon">
                            <i class="fas fa-users"></i>
                        </div>

                        <h4>Voter Help</h4>

                        <p>
                            Voters can contact support for login issues, voter ID problems or voting-related queries.
                        </p>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.riya.matdaanportal.pojo.ForgotPasswordRequest" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Password Requests - MatdaanPortal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link type="image/x-icon" href="assets/img/logo.png" rel="icon">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <style>
        body {
            background: #f4f7fb;
        }

        .page-hero {
            background: linear-gradient(135deg, #ff9966, #ff5e62);
            color: white;
            padding: 42px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(255, 94, 98, 0.25);
        }

        .page-hero h2 {
            color: #ffffff !important;
            font-weight: 700;
        }

        .request-card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            margin-bottom: 22px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        .request-card h4 {
            color: #ff5e62;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .request-info {
            color: #555;
            line-height: 1.9;
        }

        .status-badge {
            background: #fff3cd;
            color: #856404;
            padding: 6px 14px;
            border-radius: 20px;
            font-weight: 700;
            font-size: 13px;
        }

        .message-text {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 15px;
            margin-top: 12px;
            color: #333;
        }

        .empty-box {
            background: white;
            border-radius: 18px;
            padding: 35px;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }
    </style>
</head>

<body>

<%@ include file="header1.jsp" %>

<%
    List<ForgotPasswordRequest> requests = (List<ForgotPasswordRequest>) request.getAttribute("requests");
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="page-hero text-center">
                <h2><i class="fas fa-key"></i> Password Reset Requests</h2>
                <p>View password reset requests submitted by voters.</p>
            </div>

            <% if (requests == null || requests.isEmpty()) { %>

                <div class="empty-box">
                    <h4>No Password Requests Found</h4>
                    <p class="text-muted">No voter has submitted a password reset request yet.</p>
                </div>

            <% } else { %>

                <% for (ForgotPasswordRequest req : requests) { %>

                    <div class="request-card">
                        <h4>Request ID: <%= req.getId() %></h4>

                        <div class="request-info">
                            <b>Username:</b> <%= req.getUsername() %><br>
                            <b>Email:</b> <%= req.getEmail() %><br>
                            <b>Mobile:</b> <%= req.getMobile() %><br>
                            <b>Date:</b> <%= req.getCreatedAt() %><br>
                            <b>Status:</b> <span class="status-badge"><%= req.getStatus() %></span>
                        </div>

                        <div class="message-text">
                            <b>Message:</b><br>
                            <%= req.getUserMessage() == null || req.getUserMessage().trim().isEmpty() ? "No message provided." : req.getUserMessage() %>
                        </div>
                    </div>

                <% } %>

            <% } %>

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
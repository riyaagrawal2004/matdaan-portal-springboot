<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.riya.matdaanportal.pojo.ContactMessage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Messages - MatdaanPortal</title>
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
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            padding: 42px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(30, 60, 114, 0.25);
        }

        .page-hero h2 {
            color: #ffffff !important;
            font-weight: 700;
        }

        .message-card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            margin-bottom: 22px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        .message-card h4 {
            color: #1e3c72;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .message-info {
            color: #6c757d;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .message-text {
            color: #333;
            line-height: 1.7;
            background: #f8f9fa;
            border-radius: 12px;
            padding: 15px;
            margin-top: 12px;
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
    List<ContactMessage> messages = (List<ContactMessage>) request.getAttribute("messages");
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="page-hero text-center">
                <h2><i class="fas fa-envelope"></i> Contact Messages</h2>
                <p>View messages submitted by users from the Contact Us page.</p>
            </div>

            <% if (messages == null || messages.isEmpty()) { %>

                <div class="empty-box">
                    <h4>No Contact Messages Found</h4>
                    <p class="text-muted">No user has submitted any contact message yet.</p>
                </div>

            <% } else { %>

                <% for (ContactMessage msg : messages) { %>

                    <div class="message-card">
                        <h4>
                            <%= msg.getSubject() == null || msg.getSubject().trim().isEmpty() ? "No Subject" : msg.getSubject() %>
                        </h4>

                        <div class="message-info">
                            <b>Name:</b> <%= msg.getName() %> |
                            <b>Email:</b> <%= msg.getEmail() %> |
                            <b>Date:</b> <%= msg.getCreatedAt() %>
                        </div>

                        <div class="message-text">
                            <%= msg.getUserMessage() %>
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
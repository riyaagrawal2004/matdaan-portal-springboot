<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Voter Management - MatdaanPortal</title>
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

        .voter-hero {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.25);
        }

        .voter-hero h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #ffffff !important;
        }

        .voter-hero p {
            font-size: 16px;
            opacity: 0.95;
        }

        .voter-form-card {
            background: white;
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 35px;
        }

        .form-title {
            color: #667eea;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .form-control {
            border-radius: 12px;
            height: 48px;
        }

        .btn-action {
            border-radius: 12px;
            padding: 12px 22px;
            font-weight: 700;
            margin: 8px;
            min-width: 155px;
        }

        .info-card {
            background: white;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }

        .info-card h4 {
            color: #667eea;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .info-card ul {
            color: #555;
            line-height: 2;
            padding-left: 20px;
        }

        .message-box {
            border-radius: 12px;
            font-weight: 600;
        }

        .note-box {
            background: #f1f3ff;
            border-left: 5px solid #667eea;
            border-radius: 12px;
            padding: 16px;
            color: #555;
            margin-bottom: 25px;
        }
    </style>
</head>

<body>

<%@ include file="header1.jsp" %>

<%
    String msg = (String) request.getAttribute("msg");
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="voter-hero text-center">
                <h2>Voter Management</h2>
                <p>Add, update and delete voter details securely from admin panel.</p>
            </div>

            <% if (msg != null) { 
                String alertClass = "alert-info";

                if (msg.toLowerCase().contains("success")) {
                    alertClass = "alert-success";
                } else if (msg.toLowerCase().contains("please") || msg.toLowerCase().contains("invalid") || msg.toLowerCase().contains("could not")) {
                    alertClass = "alert-danger";
                }
            %>
                <div class="alert <%= alertClass %> text-center message-box">
                    <i class="fas fa-info-circle"></i>
                    <%= msg %>
                </div>
            <% } %>

            <div class="row">

                <div class="col-lg-8">
                    <div class="voter-form-card">

                        <h3 class="form-title">
                            <i class="fas fa-user-edit"></i> Voter Form
                        </h3>

                        <div class="note-box">
                            <b>Note:</b> For adding/updating voter, fill all details. For deleting voter, only Voter ID is required.
                        </div>

                       <form action="<%=request.getContextPath()%>/ModifyVoterServlet" method="post"
      onsubmit="return validateVoterForm(event)">

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><b>Username</b></label>
                                        <input type="text" name="username" class="form-control" placeholder="Enter username">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><b>Password</b></label>
                                        <input type="password" name="password" class="form-control" placeholder="Enter password">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><b>Full Name</b></label>
                                        <input type="text" name="full_name" class="form-control" placeholder="Enter voter full name">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><b>Age</b></label>
                                        <input type="number" name="age" class="form-control" placeholder="Enter voter age" min="18">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><b>Mobile Number</b></label>
                                        <input type="text" name="mobile" class="form-control" placeholder="Enter 10 digit mobile number" maxlength="10">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><b>Voter ID</b></label>
                                        <input type="number" name="voter_id" class="form-control" placeholder="Enter voter ID">
                                    </div>
                                </div>

                            </div>

                            <div class="text-center mt-4">

                                <button type="submit" name="b1" value="Add Voter" class="btn btn-success btn-action">
                                    <i class="fas fa-plus-circle"></i> Add Voter
                                </button>

                                <button type="submit" name="b1" value="Update Voter" class="btn btn-primary btn-action">
                                    <i class="fas fa-edit"></i> Update Voter
                                </button>

                                <button type="submit" name="b1" value="Upgrade Voter" class="btn btn-info btn-action">
                                    <i class="fas fa-sync-alt"></i> Upgrade Voter
                                </button>

                                <button type="submit" name="b1" value="Delete Voter" class="btn btn-danger btn-action"
        onclick="return confirm('Are you sure you want to delete this voter?');">
    <i class="fas fa-trash-alt"></i> Delete Voter
</button>
                            </div>

                        </form>

                    </div>
                </div>

                <div class="col-lg-4">

                    <div class="info-card">
                        <h4>
                            <i class="fas fa-lightbulb"></i> Instructions
                        </h4>

                        <ul>
                            <li>For adding voter, fill username, password, full name, age, mobile and voter ID.</li>
                            <li>For updating voter, enter voter ID with updated details.</li>
                            <li>For deleting voter, enter only voter ID.</li>
                            <li>Mobile number should be 10 digits.</li>
                            <li>Voter ID should be unique for every voter.</li>
                        </ul>
                    </div>

                    <div class="info-card">
                        <h4>
                            <i class="fas fa-users"></i> Voter List
                        </h4>

                        <p class="text-muted">
                            View all registered voters with their details.
                        </p>

                        <a href="<%=request.getContextPath()%>/GetAllVoterServlet" class="btn btn-warning btn-block btn-action">
                            <i class="fas fa-list"></i> View Voter List
                        </a>
                    </div>

                    <div class="info-card">
                        <h4>
                            <i class="fas fa-search"></i> Search Voter
                        </h4>

                        <p class="text-muted">
                            Search voter details quickly using voter information.
                        </p>

                        <a href="<%=request.getContextPath()%>/searchvoter" class="btn btn-secondary btn-block btn-action">
                            <i class="fas fa-search"></i> Search Voter
                        </a>
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

<script>
    function validateVoterForm(event) {
        let action = event.submitter.value;

        let username = document.querySelector("input[name='username']").value.trim();
        let password = document.querySelector("input[name='password']").value.trim();
        let fullName = document.querySelector("input[name='full_name']").value.trim();
        let age = document.querySelector("input[name='age']").value.trim();
        let mobile = document.querySelector("input[name='mobile']").value.trim();
        let voterId = document.querySelector("input[name='voter_id']").value.trim();

        if (action === "Delete Voter") {
            if (voterId === "") {
                alert("Please enter Voter ID before deleting voter.");
                return false;
            }

            return confirm("Are you sure you want to delete this voter?");
        }

        if (action === "Update Voter" || action === "Upgrade Voter") {
            if (voterId === "") {
                alert("Please enter Voter ID before updating voter.");
                return false;
            }
        }

        if (username === "" || password === "" || fullName === "" || age === "" || mobile === "" || voterId === "") {
            alert("Please fill all voter details first.");
            return false;
        }

        if (parseInt(age) < 18) {
            alert("Voter age must be 18 or above.");
            return false;
        }

        if (mobile.length !== 10 || isNaN(mobile)) {
            alert("Please enter a valid 10 digit mobile number.");
            return false;
        }

        return true;
    }
</script>
</body>
</html>
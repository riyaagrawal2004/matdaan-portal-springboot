<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Candidate Management - MatdaanPortal</title>
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

        .candidate-hero {
            background: linear-gradient(135deg, #ff9966, #ff5e62);
            color: white;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(255, 94, 98, 0.25);
        }

        .candidate-hero h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #ffffff !important;
        }

        .candidate-hero p {
            font-size: 16px;
            opacity: 0.95;
        }

        .candidate-form-card {
            background: white;
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 35px;
        }

        .form-title {
            color: #ff5e62;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .form-control {
            border-radius: 12px;
            height: 48px;
        }

        .custom-file-box {
            border: 2px dashed #ff9966;
            border-radius: 18px;
            padding: 25px;
            text-align: center;
            background: #fff7f4;
            margin-bottom: 20px;
        }

        .custom-file-box i {
            font-size: 38px;
            color: #ff5e62;
            margin-bottom: 10px;
        }

        .btn-action {
            border-radius: 12px;
            padding: 12px 22px;
            font-weight: 700;
            margin: 8px;
            min-width: 165px;
        }

        .info-card {
            background: white;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }

        .info-card h4 {
            color: #ff5e62;
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
    </style>
</head>

<body>

<%@ include file="header1.jsp" %>

<%
    String msg = (String) session.getAttribute("msg");
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="candidate-hero text-center">
                <h2>Candidate Management</h2>
                <p>Add, update and delete candidate details with party and election information.</p>
            </div>

           <% if (msg != null) { 
    String alertClass = "alert-info";

    if (msg.toLowerCase().contains("success")) {
        alertClass = "alert-success";
    } else if (
        msg.toLowerCase().contains("please") ||
        msg.toLowerCase().contains("invalid") ||
        msg.toLowerCase().contains("could not") ||
        msg.toLowerCase().contains("failed") ||
        msg.toLowerCase().contains("error")
    ) {
        alertClass = "alert-danger";
    }
%>

    <div class="alert <%= alertClass %> text-center message-box">
        <i class="fas fa-info-circle"></i>
        <%= msg %>
    </div>

    <%
        session.removeAttribute("msg");
    %>

<% } %>

            <div class="row">

                <div class="col-lg-8">
                    <div class="candidate-form-card">

                        <h3 class="form-title">
                            <i class="fas fa-user-plus"></i> Candidate Form
                        </h3>

                        <form action="<%=request.getContextPath()%>/CandidateServlet" method="post" enctype="multipart/form-data"
      onsubmit="return validateCandidateForm(event)">

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><b>Candidate ID</b></label>
                                        <input type="number" name="id" class="form-control" placeholder="Required for update/delete">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><b>Candidate Full Name</b></label>
                                        <input type="text" name="full_name" class="form-control" placeholder="Enter candidate full name">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><b>Age</b></label>
                                        <input type="number" name="age" class="form-control" placeholder="Enter candidate age" min="18">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><b>Party Name</b></label>
                                        <input type="text" name="party_name" class="form-control" placeholder="Enter party name">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label><b>Election Type</b></label>
<select name="election_type" class="form-control">
    <option value="">Select Election Type</option>
    <option value="Lok Sabha Election">Lok Sabha Election</option>
    <option value="Rajya Sabha Election">Rajya Sabha Election</option>
    <option value="State Assembly Election">State Assembly Election</option>
    <option value="Municipal Election">Municipal Election</option>
    <option value="College Election">College Election</option>
</select>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="custom-file-box">
                                        <i class="fas fa-image"></i>
                                        <h5>Upload Candidate Photo</h5>
                                        <p class="text-muted">Choose candidate image. It will be shown on voting page.</p>

                                        <input type="file" name="photo" class="form-control-file" accept="image/*">
                                        <input type="hidden" name="existing_photo" value="">
                                    </div>
                                </div>

                            </div>

                            <div class="text-center mt-4">

                                <button type="submit" name="b2" value="Add Candidate" class="btn btn-success btn-action">
                                    <i class="fas fa-plus-circle"></i> Add Candidate
                                </button>

                                <button type="submit" name="b2" value="Update Candidate" class="btn btn-primary btn-action">
                                    <i class="fas fa-edit"></i> Update Candidate
                                </button>

                                <button type="submit" name="b2" value="Delete Candidate" class="btn btn-danger btn-action">
    <i class="fas fa-trash-alt"></i> Delete Candidate
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
                            <li>For adding a new candidate, fill name, age, party, election type and photo.</li>
                            <li>For updating candidate, enter Candidate ID with updated details.</li>
                            <li>For deleting candidate, enter Candidate ID.</li>
                            <li>Election Type must match active election name.</li>
                            <li>Candidate photo will be visible on the voting page.</li>
                        </ul>
                    </div>

                    <div class="info-card">
                        <h4>
                            <i class="fas fa-list"></i> Candidate List
                        </h4>

                        <p class="text-muted">
                            View all candidates with their details and candidate IDs.
                        </p>

                        <a href="<%=request.getContextPath()%>/GetAllCandidate" class="btn btn-warning btn-block btn-action">
                            <i class="fas fa-users"></i> View Candidate List
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
    function validateCandidateForm(event) {
        let action = event.submitter.value;

        let id = document.querySelector("input[name='id']").value.trim();
        let fullName = document.querySelector("input[name='full_name']").value.trim();
        let age = document.querySelector("input[name='age']").value.trim();
        let partyName = document.querySelector("input[name='party_name']").value.trim();
        let electionType = document.querySelector("select[name='election_type']").value.trim();

        if (action === "Delete Candidate") {
            if (id === "") {
                alert("Please enter Candidate ID before deleting candidate.");
                return false;
            }

            return confirm("Are you sure you want to delete this candidate?");
        }

        if (action === "Update Candidate") {
            if (id === "") {
                alert("Please enter Candidate ID before updating candidate.");
                return false;
            }
        }

        if (fullName === "" || age === "" || partyName === "" || electionType === "") {
            alert("Please fill all candidate details first.");
            return false;
        }

        if (parseInt(age) < 18) {
            alert("Candidate age must be 18 or above.");
            return false;
        }

        let validElectionTypes = [
            "Lok Sabha Election",
            "Rajya Sabha Election",
            "State Assembly Election",
            "Municipal Election",
            "College Election"
        ];

        if (!validElectionTypes.includes(electionType)) {
            alert("Please select a valid election type.");
            return false;
        }

        return true;
    }
</script>
</body>
</html>
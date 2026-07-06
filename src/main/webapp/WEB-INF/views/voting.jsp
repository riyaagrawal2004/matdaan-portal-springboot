<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.riya.matdaanportal.daoimpl.CandidateDaoImpl" %>
<%@ page import="com.riya.matdaanportal.pojo.candidate" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cast Vote - MatdaanPortal</title>
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

        .vote-hero {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(17, 153, 142, 0.25);
        }

        .vote-hero h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #ffffff !important;
        }

        .vote-hero p {
            font-size: 16px;
            opacity: 0.95;
        }

        .vote-box {
            background: white;
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }

        .election-badge {
            display: inline-block;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 10px 18px;
            border-radius: 25px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .candidate-card {
            border: 2px solid #eeeeee;
            border-radius: 18px;
            padding: 22px;
            text-align: center;
            background: #ffffff;
            transition: 0.3s ease;
            min-height: 290px;
            cursor: pointer;
        }

        .candidate-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 28px rgba(0, 0, 0, 0.12);
            border-color: #38ef7d;
        }

        .candidate-card input[type="radio"] {
            margin-bottom: 15px;
            transform: scale(1.3);
            cursor: pointer;
        }

        .candidate-img {
            width: 95px;
            height: 95px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #f1f1f1;
            margin-bottom: 15px;
        }

        .candidate-name {
            font-size: 18px;
            font-weight: 700;
            color: #222;
            margin-bottom: 6px;
        }

        .party-name {
            color: #6c757d;
            font-size: 15px;
            margin-bottom: 10px;
        }

        .vote-submit-btn {
            border: none;
            border-radius: 14px;
            padding: 14px 35px;
            font-size: 17px;
            font-weight: 700;
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            transition: 0.3s ease;
        }

        .vote-submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(17, 153, 142, 0.35);
            color: white;
        }

        .voter-input {
            border-radius: 12px;
            height: 48px;
        }

        .note-card {
            background: #fff8e1;
            border-left: 5px solid #ffc107;
            border-radius: 12px;
            padding: 18px;
            margin-bottom: 25px;
        }

        .message-box {
            border-radius: 12px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<%@ include file="header3.jsp" %>

<%
    CandidateDaoImpl candidateDao = new CandidateDaoImpl();

    String activeElection = (String) session.getAttribute("activeElectionType");

    if (activeElection == null || activeElection.trim().isEmpty()) {
        activeElection = candidateDao.getActiveElectionType();
    }

    if (activeElection == null || activeElection.trim().isEmpty()) {
        activeElection = "No Active Election";
    }

    List<candidate> candidates = new ArrayList<>();

    if (!activeElection.equals("No Active Election")) {
        candidates = candidateDao.getCandidatesByElectionType(activeElection);
    }

    String msg = (String) request.getAttribute("msg");
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="vote-hero text-center">
                <h2>Cast Your Vote</h2>
                <p>Choose your preferred candidate and submit your vote securely.</p>
            </div>

            <div class="vote-box">

                <div class="text-center">
                    <div class="election-badge">
                        <i class="fas fa-bullhorn"></i>
                        Active Election: <%= activeElection %>
                    </div>
                </div>

                <% if (msg != null) { %>
                    <div class="alert alert-info text-center message-box">
                        <%= msg %>
                    </div>
                <% } %>

                <div class="note-card">
                    <b>Important:</b> Please enter your registered Voter ID and select only one candidate.
                    You can vote only once in the active election.
                </div>

                <% if (activeElection.equals("No Active Election")) { %>

                    <div class="alert alert-warning text-center">
                        No active election is available right now.
                    </div>

                <% } else if (candidates == null || candidates.isEmpty()) { %>

                    <div class="alert alert-warning text-center">
                        No candidates found for this election.
                    </div>

                <% } else { %>

                    <form action="<%=request.getContextPath()%>/VotingServlet" method="post">

                        <div class="row justify-content-center mb-4">
                            <div class="col-md-5">
                                <label><b>Enter Your Voter ID</b></label>
                                <input type="text" name="voter_id" class="form-control voter-input"
                                       placeholder="Enter registered voter ID" required>
                            </div>
                        </div>

                        <div class="row">

                            <% for (candidate c : candidates) { 
                                String photo = c.getPhoto();
                                String photoPath;

                                if (photo != null && !photo.trim().isEmpty()) {
                                    photoPath = request.getContextPath() + "/images/" + photo;
                                } else {
                                    photoPath = request.getContextPath() + "/assets/img/logo.png";
                                }
                            %>

                                <div class="col-md-4 mb-4">
                                    <label class="candidate-card w-100">

                                        <input type="radio" name="selected_candidate"
                                               value="<%= c.getFullname() %>" required>

                                        <br>

                                        <img src="<%= photoPath %>" class="candidate-img" alt="Candidate Photo">

                                        <div class="candidate-name">
                                            <%= c.getFullname() %>
                                        </div>

                                        <div class="party-name">
                                            <i class="fas fa-flag"></i>
                                            <%= c.getPartyname() %>
                                        </div>

                                        <small class="text-muted">
                                            Election: <%= activeElection %>
                                        </small>

                                    </label>
                                </div>

                            <% } %>

                        </div>

                        <div class="text-center mt-4">
                            <button type="submit" class="vote-submit-btn"
        onclick="return confirm('Are you sure you want to submit your vote? Once submitted, you cannot vote again in this election.');">
    <i class="fas fa-vote-yea"></i> Submit Vote
</button>
                        </div>

                    </form>

                <% } %>

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
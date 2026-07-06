<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.riya.matdaanportal.daoimpl.CandidateDaoImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Voter Dashboard - MatdaanPortal</title>
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
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(17, 153, 142, 0.25);
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

        .dashboard-card {
            background: white;
            border-radius: 18px;
            padding: 30px 22px;
            text-align: center;
            min-height: 230px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            transition: 0.3s ease;
            margin-bottom: 25px;
        }

        .dashboard-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.12);
        }

        .dashboard-icon {
            width: 65px;
            height: 65px;
            border-radius: 50%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 18px;
            font-size: 26px;
        }

        .icon-vote {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .icon-result {
            background: linear-gradient(135deg, #f7971e, #ffd200);
        }

        .icon-election {
            background: linear-gradient(135deg, #00b09b, #96c93d);
        }

        .icon-guide {
            background: linear-gradient(135deg, #ff9966, #ff5e62);
        }

        .dashboard-card h4 {
            font-weight: 700;
            color: #222;
            margin-bottom: 10px;
        }

        .dashboard-card p {
            color: #6c757d;
            font-size: 15px;
            min-height: 45px;
        }

        .dashboard-btn {
            border-radius: 12px;
            padding: 11px 22px;
            font-weight: 600;
            margin-top: 10px;
        }

        .election-name {
            font-size: 20px;
            font-weight: 700;
            color: #11998e;
            margin-top: 15px;
        }

        .guidelines-box {
            background: white;
            border-radius: 18px;
            padding: 30px;
            margin: 30px 0;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        }

        .guidelines-box h3 {
            color: #11998e;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .guidelines-box ul {
            padding-left: 20px;
            color: #555;
            line-height: 2;
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

    String username = (String) session.getAttribute("username");
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="voter-hero text-center">
                <h2>Voter Dashboard</h2>

                <% if (username != null) { %>
                    <p>Welcome <b><%= username %></b> to MatdaanPortal</p>
                <% } else { %>
                    <p>Welcome to MatdaanPortal</p>
                <% } %>

                <p>Vote securely and view live election results easily.</p>
            </div>

            <div class="row">

                <div class="col-md-3">
                    <div class="dashboard-card">
                        <div class="dashboard-icon icon-vote">
                            <i class="fas fa-vote-yea"></i>
                        </div>

                        <h4>Cast Your Vote</h4>
                        <p>Select your candidate and submit your vote securely.</p>

                        <a href="<%=request.getContextPath()%>/voting" class="btn btn-primary dashboard-btn">
                            Vote Now
                        </a>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="dashboard-card">
                        <div class="dashboard-icon icon-result">
                            <i class="fas fa-chart-bar"></i>
                        </div>

                        <h4>Live Results</h4>
                        <p>Check candidate-wise live election result analysis.</p>

                        <a href="<%=request.getContextPath()%>/results" class="btn btn-warning dashboard-btn">
                            View Results
                        </a>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="dashboard-card">
                        <div class="dashboard-icon icon-election">
                            <i class="fas fa-bullhorn"></i>
                        </div>

                        <h4>Active Election</h4>
                        <p>Current election selected by the administrator.</p>

                        <div class="election-name">
                            <%= activeElection %>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="dashboard-card">
                        <div class="dashboard-icon icon-guide">
                            <i class="fas fa-shield-alt"></i>
                        </div>

                        <h4>Secure Voting</h4>
                        <p>Your vote is recorded safely and duplicate voting is restricted.</p>

                        <a href="#guidelines" class="btn btn-success dashboard-btn">
                            Read Rules
                        </a>
                    </div>
                </div>

            </div>

            <div class="guidelines-box" id="guidelines">
                <h3>Voting Guidelines</h3>

                <ul>
                    <li>Enter only your registered Voter ID while casting your vote.</li>
                    <li>Select only one candidate from the active election.</li>
                    <li>Once your vote is submitted, you cannot vote again in the same election.</li>
                    <li>Make sure you review your selected candidate before clicking Submit Vote.</li>
                    <li>You can view live results from the Live Results section.</li>
                </ul>
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
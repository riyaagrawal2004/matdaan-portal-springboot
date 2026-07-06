<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.riya.matdaanportal.daoimpl.ModifyVoterDaoImpl" %>
<%@ page import="com.riya.matdaanportal.daoimpl.CandidateDaoImpl" %>
<%@ page import="com.riya.matdaanportal.daoimpl.VotingDaoImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Admin Dashboard - MatdaanPortal</title>
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

        .dashboard-hero {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(30, 60, 114, 0.25);
        }

        .dashboard-hero h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #ffffff !important;
        }

        .dashboard-hero p {
            font-size: 16px;
            opacity: 0.95;
        }

        .stat-card {
            border: none;
            border-radius: 18px;
            padding: 28px 20px;
            background: white;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            transition: 0.3s ease;
            min-height: 180px;
        }

        .stat-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.12);
        }

        .stat-icon {
            width: 58px;
            height: 58px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 24px;
            color: white;
        }

        .icon-voter {
            background: linear-gradient(135deg, #00b09b, #96c93d);
        }

        .icon-candidate {
            background: linear-gradient(135deg, #ff9966, #ff5e62);
        }

        .icon-vote {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .icon-election {
            background: linear-gradient(135deg, #f7971e, #ffd200);
        }

        .stat-card h5 {
            color: #6c757d;
            font-size: 15px;
            margin-bottom: 8px;
        }

        .stat-card h3 {
            font-size: 30px;
            font-weight: 700;
            color: #222;
        }

        .active-election-text {
            font-size: 17px;
            font-weight: 600;
            color: #222;
        }

        .quick-card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-top: 30px;
        }

        .quick-card h3 {
            font-weight: 700;
            margin-bottom: 20px;
            color: #1e3c72;
        }

        .quick-btn {
            border-radius: 12px;
            padding: 13px 20px;
            font-weight: 600;
            margin: 8px;
            min-width: 180px;
        }

        .security-section {
            margin-top: 35px;
            margin-bottom: 35px;
        }

        .security-title h2 {
            font-weight: 700;
            color: #1e3c72;
            margin-bottom: 8px;
        }

        .security-title p {
            color: #6c757d;
        }

        .security-card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            min-height: 220px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            transition: 0.3s ease;
        }

        .security-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.12);
        }

        .security-icon {
            width: 58px;
            height: 58px;
            border-radius: 50%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 15px;
        }

        .sec-role {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .sec-vote {
            background: linear-gradient(135deg, #00b09b, #96c93d);
        }

        .sec-admin {
            background: linear-gradient(135deg, #ff9966, #ff5e62);
        }

        .security-card h4 {
            font-weight: 700;
            color: #222;
            margin-bottom: 10px;
        }

        .security-card p {
            color: #6c757d;
            line-height: 1.7;
        }

        .about-admin {
            background: white;
            border-radius: 18px;
            padding: 30px;
            margin: 35px 0;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        }

        .about-admin h3 {
            color: #1e3c72;
            font-weight: 700;
        }

        .about-admin p {
            color: #555;
            line-height: 1.7;
        }
    </style>
</head>

<body>

<%@ include file="header1.jsp" %>

<%
    ModifyVoterDaoImpl voterDao = new ModifyVoterDaoImpl();
    CandidateDaoImpl candidateDao = new CandidateDaoImpl();
    VotingDaoImpl votingDao = new VotingDaoImpl();

    int totalVoters = voterDao.getModifyVoters().size();
    int totalCandidates = candidateDao.getCandidates().size();

    String activeElection = candidateDao.getActiveElectionType();

    if (activeElection == null || activeElection.trim().isEmpty()) {
        activeElection = "No Active Election";
    }

    int totalVotes = 0;

    if (!activeElection.equals("No Active Election")) {
        totalVotes = votingDao.getTotalVotesByElectionType(activeElection);
    }

    String username = (String) session.getAttribute("username");
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="dashboard-hero text-center">
                <h2>Admin Dashboard</h2>

                <% if (username != null) { %>
                    <p>Welcome <b><%= username %></b> to MatdaanPortal Admin Panel</p>
                <% } else { %>
                    <p>Welcome to MatdaanPortal Admin Panel</p>
                <% } %>

                <p>Manage voters, candidates, elections and live results from one secure place.</p>
            </div>

            <div class="row">

                <div class="col-md-3 mb-4">
                    <div class="stat-card text-center">
                        <div class="stat-icon icon-voter">
                            <i class="fas fa-users"></i>
                        </div>
                        <h5>Total Voters</h5>
                        <h3><%= totalVoters %></h3>
                    </div>
                </div>

                <div class="col-md-3 mb-4">
                    <div class="stat-card text-center">
                        <div class="stat-icon icon-candidate">
                            <i class="fas fa-user-tie"></i>
                        </div>
                        <h5>Total Candidates</h5>
                        <h3><%= totalCandidates %></h3>
                    </div>
                </div>

                <div class="col-md-3 mb-4">
                    <div class="stat-card text-center">
                        <div class="stat-icon icon-vote">
                            <i class="fas fa-vote-yea"></i>
                        </div>
                        <h5>Total Votes</h5>
                        <h3><%= totalVotes %></h3>
                    </div>
                </div>

                <div class="col-md-3 mb-4">
                    <div class="stat-card text-center">
                        <div class="stat-icon icon-election">
                            <i class="fas fa-bullhorn"></i>
                        </div>
                        <h5>Active Election</h5>
                        <div class="active-election-text"><%= activeElection %></div>
                    </div>
                </div>

            </div>

            <div class="quick-card text-center">
                <h3>Quick Actions</h3>

                <a href="<%=request.getContextPath()%>/modifyvoter" class="btn btn-primary quick-btn">
                    <i class="fas fa-user-edit"></i> Manage Voters
                </a>

                <a href="<%=request.getContextPath()%>/candidatemanagement" class="btn btn-success quick-btn">
                    <i class="fas fa-user-plus"></i> Manage Candidates
                </a>

                <a href="<%=request.getContextPath()%>/electionselect" class="btn btn-info quick-btn">
                    <i class="fas fa-bullhorn"></i> Set Election
                </a>

                <a href="<%=request.getContextPath()%>/result1" class="btn btn-warning quick-btn">
                    <i class="fas fa-chart-bar"></i> View Results
                </a>
            </div>

            <div class="security-section">

                <div class="security-title text-center mb-4">
                    <h2>Security & Control</h2>
                    <p>Important security features implemented in MatdaanPortal.</p>
                </div>

                <div class="row">

                    <div class="col-md-4 mb-4">
                        <div class="security-card">
                            <div class="security-icon sec-role">
                                <i class="fas fa-user-lock"></i>
                            </div>

                            <h4>Role-Based Access</h4>

                            <p>
                                Admin pages are protected using session role checking.
                                Only users logged in as admin can access admin features.
                            </p>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="security-card">
                            <div class="security-icon sec-vote">
                                <i class="fas fa-shield-alt"></i>
                            </div>

                            <h4>Duplicate Vote Prevention</h4>

                            <p>
                                The system checks whether a voter has already voted in the active election
                                before saving a new vote.
                            </p>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="security-card">
                            <div class="security-icon sec-admin">
                                <i class="fas fa-check-circle"></i>
                            </div>

                            <h4>Validated Admin Actions</h4>

                            <p>
                                Candidate, voter and election management actions are validated before processing
                                to avoid empty or invalid data.
                            </p>
                        </div>
                    </div>

                </div>

            </div>

            <div class="about-admin">
                <h3>About Admin Panel</h3>
                <p>
                    The MatdaanPortal Admin Panel allows the administrator to manage the complete online voting process.
                    Admin can add and update voter details, manage candidate information, select the active election type,
                    monitor voting activity and view election results.
                </p>

                <p>
                    This dashboard improves transparency, reduces manual work and helps manage elections in a simple,
                    secure and organized way.
                </p>
            </div>

        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/slick.js"></script>
<script src="assets/js/script.js"></script>

</body>
</html>
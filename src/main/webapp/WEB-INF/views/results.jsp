<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.riya.matdaanportal.daoimpl.CandidateDaoImpl" %>
<%@ page import="com.riya.matdaanportal.daoimpl.VotingDaoImpl" %>
<%@ page import="com.riya.matdaanportal.pojo.candidate" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Live Results - MatdaanPortal</title>
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

        .result-hero {
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: white;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(44, 83, 100, 0.25);
        }

        .result-hero h2 {
             font-weight: 700;
              margin-bottom: 10px;
             color: #ffffff !important;
  }

        .summary-card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 25px;
        }

        .summary-icon {
            width: 58px;
            height: 58px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 24px;
        }

        .result-card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 25px;
        }

        .candidate-row {
            border-bottom: 1px solid #eee;
            padding: 18px 0;
        }

        .candidate-row:last-child {
            border-bottom: none;
        }

        .candidate-name {
            font-weight: 700;
            color: #222;
            font-size: 17px;
        }

        .party-name {
            color: #6c757d;
            font-size: 14px;
        }

        .vote-count {
            font-weight: 700;
            color: #1e3c72;
        }

        .progress {
            height: 13px;
            border-radius: 20px;
            background: #e9ecef;
            overflow: hidden;
        }

        .progress-bar-custom {
            height: 100%;
            border-radius: 20px;
            background: linear-gradient(135deg, #00b09b, #96c93d);
        }

        .winner-badge {
            background: linear-gradient(135deg, #f7971e, #ffd200);
            color: #222;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .back-btn {
            border-radius: 12px;
            padding: 12px 22px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<%@ include file="header3.jsp" %>

<%
    CandidateDaoImpl candidateDao = new CandidateDaoImpl();
    VotingDaoImpl votingDao = new VotingDaoImpl();

    String electionType = (String) session.getAttribute("activeElectionType");

    if (electionType == null || electionType.trim().isEmpty()) {
        electionType = candidateDao.getActiveElectionType();
    }

    if (electionType == null || electionType.trim().isEmpty()) {
        electionType = "No Active Election";
    }

    List<candidate> candidates = candidateDao.getCandidatesByElectionType(electionType);

    int totalVotes = 0;
    if (!electionType.equals("No Active Election")) {
        totalVotes = votingDao.getTotalVotesByElectionType(electionType);
    }

    int highestVotes = 0;
    String winnerName = "No winner yet";

    if (candidates != null) {
        for (candidate c : candidates) {
            int votes = votingDao.getVoteCount(c.getFullname(), electionType);
            if (votes > highestVotes) {
                highestVotes = votes;
                winnerName = c.getFullname();
            }
        }
    }
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="result-hero text-center">
                <h2>Live Election Results</h2>
                <p>Track real-time voting results for the active election.</p>
            </div>

            <div class="row">

                <div class="col-md-4">
                    <div class="summary-card">
                        <div class="summary-icon">
                            <i class="fas fa-bullhorn"></i>
                        </div>
                        <h5>Active Election</h5>
                        <h4><%= electionType %></h4>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="summary-card">
                        <div class="summary-icon">
                            <i class="fas fa-vote-yea"></i>
                        </div>
                        <h5>Total Votes</h5>
                        <h4><%= totalVotes %></h4>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="summary-card">
                        <div class="summary-icon">
                            <i class="fas fa-trophy"></i>
                        </div>
                        <h5>Leading Candidate</h5>
                        <h4><%= winnerName %></h4>
                    </div>
                </div>

            </div>

            <div class="result-card">
                <h3 class="mb-4 text-center">Candidate-wise Result</h3>

                <%
                    if (candidates == null || candidates.isEmpty()) {
                %>
                    <div class="alert alert-warning text-center">
                        No candidates found for this election.
                    </div>
                <%
                    } else {
                        for (candidate c : candidates) {
                            int votes = votingDao.getVoteCount(c.getFullname(), electionType);
                            double percentage = totalVotes > 0 ? (votes * 100.0 / totalVotes) : 0.0;
                            String percentText = String.format("%.1f", percentage);
                %>

                    <div class="candidate-row">
                        <div class="row align-items-center">

                            <div class="col-md-3">
                                <div class="candidate-name">
                                    <%= c.getFullname() %>
                                    <% if (votes == highestVotes && highestVotes > 0) { %>
                                        <span class="winner-badge ml-2">Leading</span>
                                    <% } %>
                                </div>
                                <div class="party-name">
                                    <%= c.getPartyname() %>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="progress">
                                    <div class="progress-bar-custom" style="width: <%= percentText %>%;"></div>
                                </div>
                            </div>

                            <div class="col-md-3 text-md-right mt-2 mt-md-0">
                                <div class="vote-count">
                                    <%= votes %> Votes
                                </div>
                                <div class="text-muted">
                                    <%= percentText %>%
                                </div>
                            </div>

                        </div>
                    </div>

                <%
                        }
                    }
                %>
            </div>

            <div class="text-center mb-5">
                <a href="<%=request.getContextPath()%>/voter" class="btn btn-primary back-btn">
                    <i class="fas fa-arrow-left"></i> Back to Voter Dashboard
                </a>
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
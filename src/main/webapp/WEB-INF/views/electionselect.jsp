<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.riya.matdaanportal.daoimpl.CandidateDaoImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Election Setup - MatdaanPortal</title>
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

        .election-hero {
            background: linear-gradient(135deg, #f7971e, #ffd200);
            color: #222;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(247, 151, 30, 0.25);
        }

        .election-hero h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #222 !important;
        }

        .election-hero p {
            font-size: 16px;
            color: #333;
        }

        .election-card {
            background: white;
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 35px;
        }

        .form-title {
            color: #f7971e;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .form-control {
            border-radius: 12px;
            height: 50px;
        }

        .set-btn {
            border: none;
            border-radius: 14px;
            padding: 13px 30px;
            font-weight: 700;
            background: linear-gradient(135deg, #f7971e, #ffd200);
            color: #222;
            transition: 0.3s ease;
        }

        .set-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(247, 151, 30, 0.35);
            color: #222;
        }

        .current-card {
            background: white;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            text-align: center;
            margin-bottom: 30px;
        }

        .current-icon {
            width: 65px;
            height: 65px;
            border-radius: 50%;
            background: linear-gradient(135deg, #f7971e, #ffd200);
            color: #222;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 26px;
        }

        .current-election {
            font-size: 22px;
            font-weight: 700;
            color: #f7971e;
        }

        .info-card {
            background: white;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }

        .info-card h4 {
            color: #f7971e;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .info-card ul {
            color: #555;
            line-height: 2;
            padding-left: 20px;
        }

        .quick-chip {
            display: inline-block;
            background: #fff8e1;
            color: #333;
            border: 1px solid #ffd766;
            border-radius: 25px;
            padding: 9px 15px;
            margin: 6px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.2s ease;
        }

        .quick-chip:hover {
            background: #ffd200;
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
    CandidateDaoImpl candidateDao = new CandidateDaoImpl();

    String activeElection = candidateDao.getActiveElectionType();

    if (activeElection == null || activeElection.trim().isEmpty()) {
        activeElection = "No Active Election";
    }

    String msg = (String) request.getAttribute("msg");
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="election-hero text-center">
                <h2>Election Setup</h2>
                <p>Select and activate the election type for voting.</p>
            </div>

            <% if (msg != null) { 
                String alertClass = "alert-info";

                if (msg.toLowerCase().contains("success")) {
                    alertClass = "alert-success";
                } else if (msg.toLowerCase().contains("failed") || msg.toLowerCase().contains("please") || msg.toLowerCase().contains("error")) {
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
                    <div class="election-card">

                        <h3 class="form-title">
                            <i class="fas fa-bullhorn"></i> Set Active Election
                        </h3>

                        <form action="<%=request.getContextPath()%>/ElectionServlet" method="post">

                            <div class="form-group">
                                <label><b>Election Type</b></label>
                                <input type="text" id="electionType" name="electionType" class="form-control"
                                       placeholder="Example: Lok Sabha Election" required>
                            </div>

                            <div class="mb-4">
                                <span class="quick-chip" onclick="setElection('Lok Sabha Election')">Lok Sabha Election</span>
                                <span class="quick-chip" onclick="setElection('Rajya Sabha Election')">Rajya Sabha Election</span>
                                <span class="quick-chip" onclick="setElection('State Assembly Election')">State Assembly Election</span>
                                <span class="quick-chip" onclick="setElection('Municipal Election')">Municipal Election</span>
                                <span class="quick-chip" onclick="setElection('College Election')">College Election</span>
                            </div>

                            <div class="text-center mt-4">
                                <button type="submit" class="set-btn">
                                    <i class="fas fa-check-circle"></i> Set Active Election
                                </button>
                            </div>

                        </form>

                    </div>
                </div>

                <div class="col-lg-4">

                    <div class="current-card">
                        <div class="current-icon">
                            <i class="fas fa-vote-yea"></i>
                        </div>

                        <h5>Current Active Election</h5>

                        <div class="current-election">
                            <%= activeElection %>
                        </div>
                    </div>

                    <div class="info-card">
                        <h4>
                            <i class="fas fa-lightbulb"></i> Instructions
                        </h4>

                        <ul>
                            <li>Set only one active election at a time.</li>
                            <li>Candidate election type should match this active election.</li>
                            <li>Voters will see candidates only from the active election.</li>
                            <li>Results will be shown according to the active election.</li>
                        </ul>
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
    function setElection(value) {
        document.getElementById("electionType").value = value;
    }
</script>

</body>
</html>
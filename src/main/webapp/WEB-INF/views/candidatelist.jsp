<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.riya.matdaanportal.pojo.candidate" %>
<%@ page import="com.riya.matdaanportal.daoimpl.CandidateDaoImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Candidate List - MatdaanPortal</title>
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

        .candidate-list-hero {
            background: linear-gradient(135deg, #ff9966, #ff5e62);
            color: white;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(255, 94, 98, 0.25);
        }

        .candidate-list-hero h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #ffffff !important;
        }

        .candidate-list-hero p {
            font-size: 16px;
            opacity: 0.95;
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
            background: linear-gradient(135deg, #ff9966, #ff5e62);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 24px;
        }

        .table-card {
            background: white;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 35px;
        }

        .table-card h3 {
            color: #ff5e62;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .search-box {
            border-radius: 12px;
            height: 48px;
            margin-bottom: 20px;
        }

        .table thead {
            background: linear-gradient(135deg, #ff9966, #ff5e62);
            color: white;
        }

        .table thead th {
            border: none;
            padding: 14px;
        }

        .table tbody td {
            vertical-align: middle;
            padding: 14px;
        }

        .candidate-img {
            width: 58px;
            height: 58px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #ffe0d8;
        }

        .badge-id {
            background: #fff1ed;
            color: #ff5e62;
            padding: 7px 12px;
            border-radius: 20px;
            font-weight: 700;
        }

        .badge-election {
            background: #f1f3ff;
            color: #667eea;
            padding: 7px 12px;
            border-radius: 20px;
            font-weight: 600;
        }

        .action-btn {
            border-radius: 10px;
            padding: 8px 15px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<%@ include file="header1.jsp" %>

<%
    List<candidate> candidateList = (List<candidate>) request.getAttribute("allcandidate");

    if (candidateList == null) {
        CandidateDaoImpl dao = new CandidateDaoImpl();
        candidateList = dao.getCandidates();
    }

    if (candidateList == null) {
        candidateList = new ArrayList<candidate>();
    }

    int totalCandidates = candidateList.size();
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="candidate-list-hero text-center">
                <h2>Candidate List</h2>
                <p>View all registered candidates with party, election and photo details.</p>
            </div>

            <div class="row justify-content-center">

                <div class="col-md-4">
                    <div class="summary-card">
                        <div class="summary-icon">
                            <i class="fas fa-user-tie"></i>
                        </div>
                        <h5>Total Candidates</h5>
                        <h3><%= totalCandidates %></h3>
                    </div>
                </div>

            </div>

            <div class="table-card">

                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h3>
                            <i class="fas fa-list"></i> Candidate Details
                        </h3>
                    </div>

                    <div class="col-md-6 text-md-right">
                        <a href="<%=request.getContextPath()%>/candidatemanagement" class="btn btn-primary action-btn">
                            <i class="fas fa-user-plus"></i> Add New Candidate
                        </a>
                    </div>
                </div>

                <input type="text" id="searchInput" class="form-control search-box"
                       placeholder="Search candidate by name, party, election or ID...">

                <div class="table-responsive">

                    <table class="table table-hover" id="candidateTable">
                        <thead>
                            <tr>
                                <th>Photo</th>
                                <th>Candidate ID</th>
                                <th>Full Name</th>
                                <th>Age</th>
                                <th>Party Name</th>
                                <th>Election Type</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>

                            <% if (candidateList.isEmpty()) { %>

                                <tr>
                                    <td colspan="7" class="text-center text-muted">
                                        No candidates found.
                                    </td>
                                </tr>

                            <% } else { 
                                for (candidate c : candidateList) {

                                    String photo = c.getPhoto();
                                    String photoPath;

                                    if (photo != null && !photo.trim().isEmpty()) {
                                        photoPath = request.getContextPath() + "/images/" + photo;
                                    } else {
                                        photoPath = request.getContextPath() + "/assets/img/logo.png";
                                    }
                            %>

                                <tr>
                                    <td>
                                        <img src="<%= photoPath %>" class="candidate-img" alt="Candidate Photo">
                                    </td>

                                    <td>
                                        <span class="badge-id">
                                            <%= c.getId() %>
                                        </span>
                                    </td>

                                    <td><%= c.getFullname() %></td>

                                    <td><%= c.getAge() %></td>

                                    <td><%= c.getPartyname() %></td>

                                    <td>
                                        <span class="badge-election">
                                            <%= c.getElection_type() %>
                                        </span>
                                    </td>

                                    <td>
                                        <a href="<%=request.getContextPath()%>/candidatemanagement" class="btn btn-sm btn-info action-btn">
                                            <i class="fas fa-edit"></i> Manage
                                        </a>
                                    </td>
                                </tr>

                            <% 
                                }
                            } 
                            %>

                        </tbody>
                    </table>

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
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let filter = this.value.toLowerCase();
        let rows = document.querySelectorAll("#candidateTable tbody tr");

        rows.forEach(function (row) {
            let text = row.innerText.toLowerCase();

            if (text.includes(filter)) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    });
</script>

</body>
</html>
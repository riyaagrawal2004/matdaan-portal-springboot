<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.riya.matdaanportal.pojo.ModifyVoter" %>
<%@ page import="com.riya.matdaanportal.daoimpl.ModifyVoterDaoImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Voter List - MatdaanPortal</title>
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

        .list-hero {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.25);
        }

        .list-hero h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #ffffff !important;
        }

        .list-hero p {
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
            background: linear-gradient(135deg, #667eea, #764ba2);
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
            color: #667eea;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .search-box {
            border-radius: 12px;
            height: 48px;
            margin-bottom: 20px;
        }

        .table thead {
            background: linear-gradient(135deg, #667eea, #764ba2);
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

        .badge-id {
            background: #f1f3ff;
            color: #667eea;
            padding: 7px 12px;
            border-radius: 20px;
            font-weight: 700;
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
    List<ModifyVoter> voterList = (List<ModifyVoter>) request.getAttribute("allvoter");

    if (voterList == null) {
        ModifyVoterDaoImpl dao = new ModifyVoterDaoImpl();
        voterList = dao.getModifyVoters();
    }

    if (voterList == null) {
        voterList = new ArrayList<ModifyVoter>();
    }

    int totalVoters = voterList.size();
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="list-hero text-center">
                <h2>Registered Voter List</h2>
                <p>View and manage all registered voters in MatdaanPortal.</p>
            </div>

            <div class="row justify-content-center">

                <div class="col-md-4">
                    <div class="summary-card">
                        <div class="summary-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h5>Total Registered Voters</h5>
                        <h3><%= totalVoters %></h3>
                    </div>
                </div>

            </div>

            <div class="table-card">

                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h3>
                            <i class="fas fa-list"></i> Voter Details
                        </h3>
                    </div>

                    <div class="col-md-6 text-md-right">
                        <a href="<%=request.getContextPath()%>/modifyvoter" class="btn btn-primary action-btn">
                            <i class="fas fa-user-plus"></i> Add New Voter
                        </a>
                    </div>
                </div>

                <input type="text" id="searchInput" class="form-control search-box"
                       placeholder="Search voter by name, username, mobile or voter ID...">

                <div class="table-responsive">

                    <table class="table table-hover" id="voterTable">
                        <thead>
                            <tr>
                                <th>Voter ID</th>
                                <th>Full Name</th>
                                <th>Username</th>
                                <th>Age</th>
                                <th>Mobile</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>

                            <% if (voterList.isEmpty()) { %>

                                <tr>
                                    <td colspan="6" class="text-center text-muted">
                                        No voters found.
                                    </td>
                                </tr>

                            <% } else { 
                                for (ModifyVoter voter : voterList) {
                            %>

                                <tr>
                                    <td>
                                        <span class="badge-id">
                                            <%= voter.getVoter_id() %>
                                        </span>
                                    </td>

                                    <td><%= voter.getFullname() %></td>

                                    <td><%= voter.getUsername() %></td>

                                    <td><%= voter.getAge() %></td>

                                    <td><%= voter.getMobile() %></td>

                                    <td>
                                        <a href="<%=request.getContextPath()%>/modifyvoter" class="btn btn-sm btn-info action-btn">
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
        let rows = document.querySelectorAll("#voterTable tbody tr");

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
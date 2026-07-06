<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.riya.matdaanportal.pojo.ModifyVoter" %>
<%@ page import="com.riya.matdaanportal.daoimpl.ModifyVoterDaoImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Voter - MatdaanPortal</title>
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

        .search-hero {
            background: linear-gradient(135deg, #00b09b, #96c93d);
            color: white;
            padding: 45px 25px;
            border-radius: 18px;
            margin: 30px 0;
            box-shadow: 0 10px 30px rgba(0, 176, 155, 0.25);
        }

        .search-hero h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #ffffff !important;
        }

        .search-hero p {
            font-size: 16px;
            opacity: 0.95;
        }

        .search-card {
            background: white;
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }

        .search-title {
            color: #00b09b;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .search-input {
            height: 52px;
            border-radius: 14px;
            font-size: 16px;
            padding-left: 18px;
        }

        .table-card {
            background: white;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 35px;
        }

        .table thead {
            background: linear-gradient(135deg, #00b09b, #96c93d);
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
            background: #e8fff8;
            color: #00b09b;
            padding: 7px 12px;
            border-radius: 20px;
            font-weight: 700;
        }

        .not-found {
            display: none;
            background: #fff8e1;
            border-left: 5px solid #ffc107;
            border-radius: 12px;
            padding: 18px;
            margin-top: 20px;
            font-weight: 600;
            color: #555;
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
    ModifyVoterDaoImpl dao = new ModifyVoterDaoImpl();
    List<ModifyVoter> voterList = dao.getModifyVoters();

    if (voterList == null) {
        voterList = new ArrayList<ModifyVoter>();
    }
%>

<div class="main-wrapper">
    <div class="content">
        <div class="container-fluid">

            <div class="search-hero text-center">
                <h2>Search Voter</h2>
                <p>Find voter details quickly using voter ID, name, username or mobile number.</p>
            </div>

            <div class="search-card">

                <h3 class="search-title">
                    <i class="fas fa-search"></i> Search Voter Details
                </h3>

                <input type="text" id="searchInput" class="form-control search-input"
                       placeholder="Type voter ID, name, username or mobile number...">

                <div class="not-found" id="notFoundBox">
                    <i class="fas fa-exclamation-circle"></i>
                    No matching voter found.
                </div>

            </div>

            <div class="table-card">

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
                                        No voters available.
                                    </td>
                                </tr>

                            <% } else { 
                                for (ModifyVoter voter : voterList) {
                            %>

                                <tr class="voter-row">
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
        let rows = document.querySelectorAll(".voter-row");
        let found = false;

        rows.forEach(function (row) {
            let text = row.innerText.toLowerCase();

            if (text.includes(filter)) {
                row.style.display = "";
                found = true;
            } else {
                row.style.display = "none";
            }
        });

        if (filter.length > 0 && !found) {
            document.getElementById("notFoundBox").style.display = "block";
        } else {
            document.getElementById("notFoundBox").style.display = "none";
        }
    });
</script>

</body>
</html>
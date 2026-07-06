<style>
    .voter-header {
        background: #ffffff;
        box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
        padding: 15px 0;
        position: sticky;
        top: 0;
        z-index: 9999;
    }

    .voter-logo {
        font-size: 23px;
        font-weight: 800;
        color: #11998e !important;
        text-decoration: none;
    }

    .voter-logo i {
        color: #38ef7d;
        margin-right: 8px;
    }

    .voter-nav {
        text-align: right;
        margin-top: 5px;
    }

    .voter-nav a {
        color: #333;
        font-weight: 600;
        text-decoration: none;
        margin-left: 18px;
    }

    .voter-nav a:hover {
        color: #11998e;
    }

    .vote-btn-header {
        background: linear-gradient(135deg, #11998e, #38ef7d);
        color: white !important;
        padding: 10px 20px;
        border-radius: 25px;
        font-weight: 700;
    }

    .result-btn-header {
        background: linear-gradient(135deg, #f7971e, #ffd200);
        color: #222 !important;
        padding: 10px 20px;
        border-radius: 25px;
        font-weight: 700;
    }

    .logout-btn-voter {
        background: linear-gradient(135deg, #ff5e62, #ff9966);
        color: white !important;
        padding: 10px 20px;
        border-radius: 25px;
        font-weight: 700;
    }
    .voter-user-badge {
    background: #eafff7;
    color: #11998e;
    padding: 9px 16px;
    border-radius: 22px;
    font-weight: 700;
    margin-left: 18px;
}
</style>

<header class="voter-header">
    <div class="container-fluid">
        <div class="row align-items-center">

            <div class="col-md-4">
                <a href="<%=request.getContextPath()%>/voter" class="voter-logo">
                    <i class="fas fa-vote-yea"></i>
                    MatdaanPortal Voter
                </a>
            </div>

            <div class="col-md-8">
                <div class="voter-nav">
                    <a href="<%=request.getContextPath()%>/voter">
                        <i class="fas fa-home"></i> Dashboard
                    </a>

                    <a href="<%=request.getContextPath()%>/voting" class="vote-btn-header">
                        <i class="fas fa-vote-yea"></i> Cast Vote
                    </a>

                    <a href="<%=request.getContextPath()%>/results" class="result-btn-header">
                        <i class="fas fa-chart-bar"></i> Results
                    </a>
                     
                     <%
    String voterNameHeader = (String) session.getAttribute("username");
%>

<% if (voterNameHeader != null) { %>
    <span class="voter-user-badge">
        <i class="fas fa-user"></i> Welcome, <%= voterNameHeader %>
    </span>
<% } %>
                    <a href="<%=request.getContextPath()%>/logout" class="logout-btn-voter">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </div>
            </div>

        </div>
    </div>
</header>
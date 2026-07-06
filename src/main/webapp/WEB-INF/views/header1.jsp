<style>
    .admin-header-custom {
        background: #ffffff;
        box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
        padding: 12px 0;
        position: sticky;
        top: 0;
        z-index: 9999;
    }

    .admin-top-custom {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 12px;
    }

    .admin-logo-custom {
        font-size: 24px;
        font-weight: 800;
        color: #1e3c72 !important;
        text-decoration: none !important;
        display: flex;
        align-items: center;
    }

    .admin-logo-custom i {
        color: #2a5298 !important;
        margin-right: 8px;
        font-size: 26px;
    }

    .admin-logout-custom {
        background: linear-gradient(135deg, #ff5e62, #ff9966);
        color: #ffffff !important;
        padding: 10px 22px;
        border-radius: 25px;
        font-weight: 700;
        text-decoration: none !important;
        white-space: nowrap;
    }

    .admin-menu-custom {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
        gap: 10px;
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .admin-menu-custom li {
        list-style: none;
    }

    .admin-menu-custom li a {
        display: inline-block;
        background: #f1f5ff;
        color: #1e3c72 !important;
        padding: 9px 15px;
        border-radius: 22px;
        font-size: 14px;
        font-weight: 700;
        text-decoration: none !important;
        white-space: nowrap;
        transition: 0.3s ease;
    }

    .admin-menu-custom li a:hover {
        background: #dfe8ff;
        transform: translateY(-2px);
    }

    .admin-dashboard-custom {
    background: #eaf1ff !important;
    color: #1e3c72 !important;
    border: 1px solid #c8d8ff;
}

   .admin-dashboard-custom i {
    color: #1e3c72 !important;
}

    @media (max-width: 768px) {
        .admin-top-custom {
            flex-direction: column;
            gap: 12px;
        }

        .admin-logo-custom {
            font-size: 21px;
        }

        .admin-menu-custom li a {
            font-size: 13px;
            padding: 8px 12px;
        }
    }
    .admin-user-badge {
    background: #f1f5ff;
    color: #1e3c72;
    padding: 9px 16px;
    border-radius: 22px;
    font-weight: 700;
    margin-right: 12px;
}
</style>

<header class="admin-header-custom">
    <div class="container-fluid">

        <div class="admin-top-custom">
            <a href="<%=request.getContextPath()%>/admin" class="admin-logo-custom">
                <i class="fas fa-user-shield"></i>
                MatdaanPortal Admin
            </a>

            <%
    String adminNameHeader = (String) session.getAttribute("username");
%>

<% if (adminNameHeader != null) { %>
    <span class="admin-user-badge">
        <i class="fas fa-user-shield"></i> Welcome, <%= adminNameHeader %>
    </span>
<% } %>

<a href="<%=request.getContextPath()%>/logout" class="admin-logout-custom">
    <i class="fas fa-sign-out-alt"></i> Logout
</a>
        </div>

        <ul class="admin-menu-custom">

            <li>
                <a href="<%=request.getContextPath()%>/admin" class="admin-dashboard-custom">
                    <i class="fas fa-home"></i> Dashboard
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/modifyvoter">
                    Voter Management
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/GetAllVoterServlet">
                    Voter List
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/candidatemanagement">
                    Candidate Management
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/GetAllCandidate">
                    Candidate List
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/electionselect">
                    Election Setup
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/searchvoter">
                    Search Voter
                </a>
            </li>
             
             <li>
                 <a href="<%=request.getContextPath()%>/contactmessages"><i class="fas fa-envelope"></i> Messages</a></li>

              <li> 
                  <a href="<%=request.getContextPath()%>/passwordrequests"><i class="fas fa-key"></i> Password Requests</a></li>
             
            <li>
                <a href="<%=request.getContextPath()%>/result1">
                    Results
                </a>
            </li>

        </ul>

    </div>
</header>
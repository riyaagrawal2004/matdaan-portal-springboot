<style>
    .matdaan-footer {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        color: white;
        padding: 45px 0 18px;
        margin-top: 40px;
    }

    .footer-brand {
        font-size: 24px;
        font-weight: 800;
        color: #ffffff !important;
        text-decoration: none !important;
        display: inline-flex;
        align-items: center;
        margin-bottom: 15px;
    }

    .footer-brand i {
        color: #38ef7d;
        margin-right: 8px;
        font-size: 26px;
    }

    .matdaan-footer p {
        color: rgba(255, 255, 255, 0.85);
        line-height: 1.8;
        margin-bottom: 10px;
    }

    .footer-title {
        color: #ffffff;
        font-weight: 700;
        margin-bottom: 18px;
        font-size: 18px;
    }

    .footer-links {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-links li {
        margin-bottom: 10px;
    }

    .footer-links li a {
        color: rgba(255, 255, 255, 0.85);
        text-decoration: none;
        transition: 0.3s ease;
        font-weight: 500;
    }

    .footer-links li a:hover {
        color: #38ef7d;
        padding-left: 5px;
    }

    .footer-contact-item {
        display: flex;
        align-items: center;
        margin-bottom: 12px;
        color: rgba(255, 255, 255, 0.85);
    }

    .footer-contact-item i {
        color: #38ef7d;
        margin-right: 10px;
        font-size: 16px;
    }

    .footer-bottom {
        border-top: 1px solid rgba(255, 255, 255, 0.18);
        margin-top: 30px;
        padding-top: 18px;
        text-align: center;
    }

    .footer-bottom p {
        margin: 0;
        font-size: 14px;
    }

    .footer-badge {
        display: inline-block;
        background: rgba(255, 255, 255, 0.12);
        color: #ffffff;
        padding: 8px 14px;
        border-radius: 20px;
        margin: 5px;
        font-size: 13px;
        font-weight: 600;
    }
</style>

<footer class="matdaan-footer">
    <div class="container-fluid">

        <div class="row">

            <div class="col-lg-4 col-md-6 mb-4">
                <a href="<%=request.getContextPath()%>/public" class="footer-brand">
                    <i class="fas fa-vote-yea"></i>
                    MatdaanPortal
                </a>

                <p>
                    MatdaanPortal is a secure online voting system designed to manage voters,
                    candidates, elections and live results in a simple and transparent way.
                </p>

                <div>
                    <span class="footer-badge">Secure Voting</span>
                    <span class="footer-badge">Live Results</span>
                    <span class="footer-badge">Admin Control</span>
                </div>
            </div>

            <div class="col-lg-2 col-md-6 mb-4">
                <h4 class="footer-title">Quick Links</h4>

                <ul class="footer-links">
                    <li>
                        <a href="<%=request.getContextPath()%>/public">Home</a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/aboutus">About Us</a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/contact">Contact</a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/login">Voter Login</a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/adminlogin">Admin Login</a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <h4 class="footer-title">Portal Features</h4>

                <ul class="footer-links">
                    <li>
                        <a href="<%=request.getContextPath()%>/voting">Cast Vote</a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/results">Live Results</a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/modifyvoter">Voter Management</a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/candidatemanagement">Candidate Management</a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/electionselect">Election Setup</a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <h4 class="footer-title">Project Info</h4>

                <div class="footer-contact-item">
                    <i class="fas fa-code"></i>
                    Java, Spring Boot, JSP, JDBC
                </div>

                <div class="footer-contact-item">
                    <i class="fas fa-database"></i>
                    MySQL Database
                </div>

                <div class="footer-contact-item">
                    <i class="fas fa-layer-group"></i>
                    MVC + DAO Pattern
                </div>

                <div class="footer-contact-item">
                    <i class="fas fa-shield-alt"></i>
                    Duplicate Vote Prevention
                </div>
            </div>

        </div>

        <div class="footer-bottom">
            <p>
                © 2026 MatdaanPortal. Designed and developed as an Online Voting Management System.
            </p>
        </div>

    </div>
</footer>
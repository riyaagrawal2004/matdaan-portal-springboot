<style>
    .matdaan-header {
        background: #ffffff;
        box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
        padding: 12px 0;
        position: sticky;
        top: 0;
        z-index: 999;
    }

    .matdaan-logo {
        font-size: 24px;
        font-weight: 800;
        color: #1e3c72 !important;
        text-decoration: none;
        display: flex;
        align-items: center;
    }

    .matdaan-logo i {
        color: #11998e;
        margin-right: 8px;
        font-size: 26px;
    }

    .matdaan-nav {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .matdaan-nav li {
        margin-left: 22px;
    }

    .matdaan-nav li a {
        color: #333;
        font-weight: 600;
        text-decoration: none;
        transition: 0.3s ease;
    }

    .matdaan-nav li a:hover {
        color: #11998e;
    }

    .login-btn-header {
        background: linear-gradient(135deg, #11998e, #38ef7d);
        color: white !important;
        padding: 10px 22px;
        border-radius: 25px;
        font-weight: 700;
        box-shadow: 0 6px 16px rgba(17, 153, 142, 0.25);
    }

    .login-btn-header:hover {
        transform: translateY(-2px);
        color: white !important;
        box-shadow: 0 8px 22px rgba(17, 153, 142, 0.35);
    }

    .admin-btn-header {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        color: white !important;
        padding: 10px 22px;
        border-radius: 25px;
        font-weight: 700;
        box-shadow: 0 6px 16px rgba(30, 60, 114, 0.25);
    }

    .admin-btn-header:hover {
        transform: translateY(-2px);
        color: white !important;
        box-shadow: 0 8px 22px rgba(30, 60, 114, 0.35);
    }

    .mobile-menu-btn {
        display: none;
        border: none;
        background: transparent;
        font-size: 24px;
        color: #1e3c72;
    }

    @media (max-width: 768px) {
        .mobile-menu-btn {
            display: block;
            margin-left: auto;
        }

        .matdaan-nav {
            display: none;
            flex-direction: column;
            align-items: flex-start;
            background: white;
            width: 100%;
            margin-top: 15px;
            padding: 15px;
            border-radius: 15px;
            box-shadow: 0 8px 22px rgba(0, 0, 0, 0.08);
        }

        .matdaan-nav.active {
            display: flex;
        }

        .matdaan-nav li {
            margin: 10px 0;
        }
    }
</style>

<header class="matdaan-header">
    <div class="container-fluid">
        <div class="row align-items-center">

            <div class="col-md-3 col-9">
                <a href="<%=request.getContextPath()%>/public" class="matdaan-logo">
                    <i class="fas fa-vote-yea"></i>
                    MatdaanPortal
                </a>
            </div>

            <div class="col-md-9 col-3 text-right">
                <button class="mobile-menu-btn" onclick="toggleMenu()">
                    <i class="fas fa-bars"></i>
                </button>

                <ul class="matdaan-nav" id="matdaanMenu">
                    <li>
                        <a href="<%=request.getContextPath()%>/public">
                            Home
                        </a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/aboutus">
                            About Us
                        </a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/contact">
                            Contact
                        </a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/login" class="login-btn-header">
                            <i class="fas fa-sign-in-alt"></i> Login
                        </a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/adminlogin" class="admin-btn-header">
                            <i class="fas fa-user-shield"></i> Admin
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>
</header>

<script>
    function toggleMenu() {
        document.getElementById("matdaanMenu").classList.toggle("active");
    }
</script>
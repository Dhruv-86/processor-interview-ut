<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-ENjdO4Dr2bkBIFxQpeoF6H2LYlFf3WNh4aVjFf/tzSTFtdORvoJ0tF4O9gE9i2X/" crossorigin="anonymous">
    <style>
        .navbar {
            background-color: #ffffff !important;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 30px;
            height: 70px;
        }
        .navbar-brand img {
            height: 40px;
            margin-right: 20px;
        }
        .navbar-nav {
            display: flex;
            align-items: center;
            margin-left: 30px;
        }
        .navbar-nav .nav-item {
            margin-left: 30px;
            padding-bottom: 15px;
        }
        .navbar-nav .nav-link {
            color: black !important;
            font-size: 16px;
            padding: 0 10px;
            transition: background-color 0.3s ease, color 0.3s ease;
            text-decoration: none;
        }
        .navbar-nav .nav-link:hover {
            color: #007bff !important;
        }


    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/documents/Images/SpayLogo.png" alt="Logo">
        </a>
        <div class="navbar-nav ms-auto">
            <div class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/">Upload File</a>
            </div>
            <div class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/accountDetails">Account Details</a>
            </div>
            <div class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/badTransaction">Bad Transactions</a>
            </div>
            <div class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/collections">Collections</a>
            </div>
            <div class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/reset">Reset System</a>
            </div>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+M/w94H58EV9VbG6gf7i8yT9c9h4" crossorigin="anonymous"></script>
</body>
</html>

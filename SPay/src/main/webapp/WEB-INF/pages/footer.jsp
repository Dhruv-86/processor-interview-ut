<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-ENjdO4Dr2bkBIFxQpeoF6H2LYlFf3WNh4aVjFf/tzSTFtdORvoJ0tF4O9gE9i2X/" crossorigin="anonymous">
    <style>

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #f8f9fa;
            padding: 10px 0;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }
        .footer span {
            color: #6c757d;
        }
        .footer a {
            color: #007bff;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .spantag{
            margin-left: 20px;
        }
        body {
            margin-bottom: 60px;
        }
    </style>
</head>
<body>

<footer class="footer mt-auto py-3 bg-light">
    <div class="container text-center">
            <span class="text-muted spantag">
                Developed by Dhruv | Email:
                <a href="mailto:dxp220080@utdallas.edu">dxp220080@utdallas.edu</a> |
                <a href="mailto:dhruvronakpatel@gmail.com">dhruvronakpatel@gmail.com</a>  <span class="spantag"></span>|<span class="spantag"></span>
                <a href="${pageContext.request.contextPath}/documents/Resume_Dhruv.pdf" target="_blank">Resume</a>
            </span>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+M/w94H58EV9VbG6gf7i8yT9c9h4" crossorigin="anonymous"></script>
</body>
</html>

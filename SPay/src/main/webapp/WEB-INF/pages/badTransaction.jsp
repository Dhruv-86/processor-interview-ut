<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Bad Transactions</title>
    <style>
        .bad-transactions-table {
            width: 90%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .bad-transactions-table th, .bad-transactions-table td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
            word-break: break-word;
        }

        .bad-transactions-table th {
            background-color: #f2f2f2;
        }


        .nav-links a {
            margin-right: 15px;
            text-decoration: none;
            color: #2196F3;
        }

        .nav-links a:hover {
            text-decoration: underline;
        }

        h2 {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<h2>Bad Transactions</h2>


<c:choose>
    <c:when test="${empty badTransactions}">
        <p>No bad transactions found.</p>
    </c:when>
    <c:otherwise>
        <table class="bad-transactions-table">
            <thead>
                <tr>
                    <th>Raw Data</th>
                    <th>Error Message</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="badTx" items="${badTransactions}">
                    <tr>
                        <td>${badTx.rawData}</td>
                        <td>${badTx.errorMessage}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<jsp:include page="footer.jsp" />
</body>
</html>

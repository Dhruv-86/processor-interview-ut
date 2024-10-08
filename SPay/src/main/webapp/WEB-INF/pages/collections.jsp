<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Collections</title>
    <style>
        .collections-table {
            width: 90%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .collections-table th, .collections-table td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }

        .collections-table th {
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

        .no-collections {
            margin-top: 20px;
            font-style: italic;
            color: #555;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<h2>Collections</h2>

<c:choose>
    <c:when test="${empty cards}">
        <p class="no-collections">No cards in collections.</p>
    </c:when>
    <c:otherwise>
        <table class="collections-table">
            <thead>
                <tr>
                    <th>Card Number</th>
                    <th>Balance</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="card" items="${cards}">
                    <tr>
                        <td>${card.cardNumber}</td>
                        <td>
                            <fmt:formatNumber value="${card.balance}" type="currency" currencySymbol="$" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<jsp:include page="footer.jsp" />
</body>
</html>

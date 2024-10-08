<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Account Details</title>
    <style>
        .account-table {
            width: 90%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .account-table th, .account-table td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }

        .account-table th {
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

<h2>Account Details</h2>

<c:choose>
    <c:when test="${empty accounts}">
        <p>No accounts found.</p>
    </c:when>
    <c:otherwise>
        <table class="account-table">
            <thead>
            <tr>
                <th>Account Name</th>
                <th>Card Number</th>
                <th>Balance</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="account" items="${accounts}">
                <c:set var="rowspan" value="${fn:length(account.cards)}" />
                <c:forEach var="card" items="${account.cards}" varStatus="status">
                    <tr>
                        <c:if test="${status.first}">
                            <td rowspan="${rowspan}">${account.name}</td>
                        </c:if>
                        <td>${card.cardNumber}</td>
                        <td>
                            <fmt:formatNumber value="${card.balance}" type="currency" currencySymbol="$" />
                        </td>
                    </tr>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<jsp:include page="footer.jsp" />
</body>
</html>

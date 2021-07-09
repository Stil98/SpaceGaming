
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
    <c:choose>
        <c:when test="${log}">
            <jsp:include page="/WEB-INF/views/partials/headerlogged.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:when>
        <c:otherwise>
            <jsp:include page="/WEB-INF/views/partials/header.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:otherwise>
    </c:choose>
</head>

<body>
<div class="body grid-x justify-center">
    <section class="grid-y cell products">
        <table class="table product-table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>Prezzo</th>
                <th>Copie</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${lista}" var="product">
                <tr>
                    <td data-head="id">${product.id}</td>
                    <td data-head="nome">${product.nome}</td>
                    <td data-head="prezzo">${product.prezzo}€</td>
                    <td data-head="copie">${product.qty}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>
</div>
</body>
</html>


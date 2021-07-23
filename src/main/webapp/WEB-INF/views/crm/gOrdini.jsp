<%@ page import="progetto.SpaceGaming.utente.Utente" %>
<%@ page import="progetto.SpaceGaming.acquisto.Acquisto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Gestione Ordini</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Admin Dashboard"/>
        <jsp:param name="styles" value="crm"/>
        <jsp:param name="scripts" value="crm"/>
    </jsp:include>
</head>
<body>
<main class="app">
    <%@include file="../partials/crmSidebar.jsp"%>
    <section class="content grid-y">
        <%@include file="../partials/crmHeader.jsp"%>
        <div class="body grid-x justify-center">
            <section class="grid-y cell products">
                <table class="table product-table">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Utente</th>
                        <th>Data</th>
                        <th>Metodo di Pagamento</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orders}" var="order">
                        <tr>
                            <td data-head="id">${order.id}</td>
                            <td data-head="email">${order.utente.email}</td>
                            <td data-head="data">${order.data}</td>
                            <td data-head="metodo di pagamento">${order.metpagamento}</td>
                            <td>
                                <form action="./modOrdini">
                                    <input type="hidden" id="id" name="id" value="${product.id}">
                                    <input type="submit" class="btn" value="Modifica">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </section>
        </div>
    </section>
</main>
</body>
</html>

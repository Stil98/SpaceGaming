<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Gestione Prodotti</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Admin Dashboard"/>
        <jsp:param name="styles" value="crm"/>
        <jsp:param name="scripts" value="crm"/>
    </jsp:include>
</head>
<body>
<main class="app">
    <%@include file="../partials/crmSidebar.jsp" %>
    <section class="content grid-y">
        <%@include file="../partials/crmHeader.jsp" %>
        <div class="body grid-x justify-center">
            <section class="grid-y cell products">
                <table class="table product-table">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Prezzo</th>
                        <th>Copie</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${products}" var="product">
                    <tr>
                        <td data-head="id">${product.id}</td>
                        <td data-head="nome">${product.nome}</td>
                        <td data-head="prezzo">${product.prezzo}€</td>
                        <td data-head="copie">${product.qty}</td>
                        <td>
                            <form action="./modProdotti">
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
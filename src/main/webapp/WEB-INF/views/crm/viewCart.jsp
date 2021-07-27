<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<%@ page import="progetto.SpaceGaming.cart.Cart" %>
<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Gestione Prodotti</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Admin Dashboard"/>
        <jsp:param name="styles" value="crm"/>
        <jsp:param name="scripts" value="crm"/>
    </jsp:include>
    <style>
        .createBtn{
            padding: 8px;
            border: none;
            cursor: pointer;
            margin: 20px 30px 0px 20px;
            width: 300px;
            color: white;
            background-color: var(--viola);
            align-self: flex-end;
        }

        .createBtn:hover{
            filter: brightness(130%);
        }
    </style>
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
                        <th></th>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Console</th>
                        <th>Prezzo</th>
                        <th>Copie</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% Cart carrello = (Cart) request.getSession().getAttribute("cart");
                    int i=0;%>
                    <c:forEach items="${cart.items}" var="product">
                        <tr>
                            <td>
                                <img src="data:image/jpg;base64,${product.base64img}" width="150" height="220">
                            </td>
                            <td data-head="id">${product.id}</td>
                            <td data-head="nome">${product.nome}</td>
                            <td data-head="console">${product.console}</td>
                            <td data-head="prezzo">${product.prezzo}€</td>
                            <td data-head="copie"><%= carrello.getProductCopies(i)%></td>
                        </tr>
                        <% i++;%>
                    </c:forEach>
                    </tbody>
                </table>
            </section>
        </div>
    </section>
</main>
</body>
</html>
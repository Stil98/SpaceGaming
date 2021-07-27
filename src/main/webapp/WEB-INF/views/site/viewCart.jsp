<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<%@ page import="progetto.SpaceGaming.cart.Cart" %>
<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
        <style>
            body{
                background-image: url("${context}/images/backimage2.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position-x: center;
                min-height:100vh;
            }
            .table{
                margin: 10vh 15vh;
            }
            th {
                background-color: var(--viola);
                color: white;
            }

            td {
                background-color: var(--lilla);
            }
        </style>
    </head>
<jsp:include page="../partials/head.jsp">
    <jsp:param name="title" value="Ordini"/>
</jsp:include>
<jsp:include page="../partials/headerlogged.jsp">
    <jsp:param name="title" value="Ordini"/>
</jsp:include>
        <body>
        <div class="body grid-x justify-center">
            <section class="grid-y cell products">
                <table class="table product-table">
                    <thead>
                    <tr>
                        <th></th>
                        <th>Nome</th>
                        <th>Console</th>
                        <th>Prezzo</th>
                        <th>Copie</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% Cart carrello = (Cart) request.getSession().getAttribute("cartv");
                    int i=0;%>
                    <c:forEach items="${cartv.items}" var="product">
                        <tr>
                            <td>
                                <img src="data:image/jpg;base64,${product.base64img}" width="150" height="220">
                            </td>
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
</body>
</html>
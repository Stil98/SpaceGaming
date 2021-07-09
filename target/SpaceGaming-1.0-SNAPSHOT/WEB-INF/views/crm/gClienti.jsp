<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Gestione Clienti</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Admin Dashboard"/>
        <jsp:param name="styles" value="crm"/>
        <jsp:param name="scripts" value="crm"/>
    </jsp:include>
    <style>
        input[type=submit]{
            margin: .5rem;
            border: 2px solid black;
            filter: brightness(130%);
        }
        input[type=submit]:hover{
            filter: brightness(160%);
        }
    </style>
</head>
<body>
<main class="app">
    <%@include file="../partials/crmSidebar.jsp"%>
    <section class="content grid-y" style="flex-wrap: nowrap">
        <%@include file="../partials/crmHeader.jsp"%>
        <div class="body grid-x justify-center">
            <section class="grid-y cell products">
                <table class="table product-table">
                    <thead>
                    <tr>
                        <th>E-Mail</th>
                        <th>Nome</th>
                        <th>Cognome</th>
                        <th>Admin</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${customers}" var="customer">
                        <tr>
                            <td data-head="E-Mail">${customer.email}</td>
                            <td data-head="Nome">${customer.fname}</td>
                            <td data-head="Cognome">${customer.lname}</td>
                            <td data-head="Admin">${customer.admin}</td>
                            <td>
                                <form action="./modClienti">
                                    <input type="hidden" id="id" name="id" value="${customer.email}">
                                    <input type="submit" class="btn" value="Modifica">
                                </form>
                            </td>
                            <td>
                                <form action="./setAdmin">
                                    <input type="hidden" id="idAdm" name="idAdm" value="${customer.email}">
                                    <input type="submit" class="btn" value="Admin Toggle">
                                </form>
                            </td>
                            <td>
                                <form action="./delClienti">
                                    <input type="hidden" id="idDel" name="idDel" value="${customer.email}">
                                    <input type="submit" class="btn" value="Elimina">
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
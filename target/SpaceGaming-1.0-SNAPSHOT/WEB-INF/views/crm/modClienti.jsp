<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Modifica Cliente</title>
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
        <form class="grid-x justify-center align-center" action="./clienteModificato" method="post">
            <fieldset class="field grid-y cell w40">
                <h1 style="text-align: center">Modifica Cliente</h1>
                <br>
                <span> Nome </span>
                <label for="nome" class="field">
                    <input type="text" name="nome" id="nome" value="${customer.fname}" required>
                </label>

                <span> Cognome </span>
                <label for="cognome" class="field">
                    <input type="text" name="cognome" id="cognome" value="${customer.lname}" required>
                </label>

                <span> Indirizzo </span>
                <label for="indirizzo" class="field">
                    <input type="text" name="indirizzo" id="indirizzo" value="${customer.address}" required>
                </label>

                <span> Telefono </span>
                <label for="telefono" class="field">
                    <input type="text" name="telefono" id="telefono" value="${customer.phoneNumber}" required>
                </label>
                <input type="hidden" name="email" id="email" value="${customer.email}">
                <br>
                <button class="btn_primary" type="submit">Modifica</button>
            </fieldset>
        </form>
    </section>
</main>
</body>
</html>
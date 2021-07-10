<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Modifica Prodotto</title>
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
        <form class="grid-x justify-center align-center" action="./prodModifica">
            <fieldset class="field grid-y cell w40">
                <h1 style="text-align: center">Modifica Prodotto</h1>
                <br>
                <span> Nome </span>
                <label for="prod" class="field">
                    <input type="text" name="prod" id="prod" value="${product.nome}" required>
                </label>

                <span> Prezzo </span>
                <label for="prezzo" class="field">
                    <input type="text" name="prezzo" id="prezzo" value="${product.prezzo}" required>
                </label>

                <span> Quantità </span>
                <label for="quantita" class="field">
                    <input type="text" name="quantita" id="quantita" value="${product.qty}" required>
                </label>

                <span> Descrizione </span>
                <label for="descrizione" class="field">
                    <textarea id="descrizione" name="descrizione"  rows="3" cols="50" required>${product.descrizione}</textarea>
                </label>

                <span> Copertina </span>
                <label for="img" class="field">
                    <input type="file" name="img" id="img" accept="image/*">
                </label>
                <br>
                <input type="hidden" name="id" id="id" value="${product.id}">
                <button class="btn_primary" type="submit">Modifica</button>
            </fieldset>
        </form>
    </section>
</main>
</body>
</html>
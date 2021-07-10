<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Modifica Categoria</title>
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
        <form class="grid-x justify-center align-center" action="./cnslModifica">
            <fieldset class="field grid-y cell w40">
                <h1 style="text-align: center">Modifica ${console.nome}</h1>
                <br>
                <span> Descrizione </span>
                <label for="descrizione" class="field">
                    <textarea id="descrizione" name="descrizione" rows="3" cols="50" required></textarea>
                </label>

                <input type="hidden" name="nome" id="nome" value="${console.nome}">
                <br>
                <button class="btn_primary" type="submit">Modifica</button>
            </fieldset>
        </form>
    </section>
</main>
</body>
</html>
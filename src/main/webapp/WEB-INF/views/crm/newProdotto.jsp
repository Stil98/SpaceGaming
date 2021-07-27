<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Crea Prodotto</title>
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
        <form class="grid-x justify-center align-center" action="./prodCreato" method="post" enctype="multipart/form-data">
            <fieldset class="field grid-y cell w40">
                <h2 style="text-align: center">Crea un Prodotto</h2>
                <span> Nome </span>
                <label for="prod" class="field">
                    <input type="text" name="prod" id="prod" placeholder="Nome" required>
                </label>

                <span> Prezzo </span>
                <label for="prezzo" class="field">
                    <input type="text" name="prezzo" id="prezzo" placeholder="Prezzo" required>
                </label>

                <span> Quantità </span>
                <label for="quantita" class="field">
                    <input type="text" name="quantita" id="quantita" placeholder="Quantità" required>
                </label>

                <span> Descrizione </span>
                <label for="descrizione" class="field">
                    <textarea id="descrizione" name="descrizione" placeholder="Descrizione" rows="3" cols="50" required></textarea>
                </label>

                <span> Copertina </span>
                <label for="img" class="field">
                    <input type="file" name="img" id="img" accept="image/*" required>
                </label><br>

                <div class="grid-x align-center">
                <input type="radio" id="PS4" name="console" value="PS4">
                <label for="PS4">PS4</label>  
                    <input type="radio" id="XBOX" name="console" value="XBOX">
                <label for="XBOX">XBOX</label>  
                    <input type="radio" id="SWITCH" name="console" value="SWITCH">
                <label for="SWITCH">SWITCH</label>  
                </div>

                <br>
                <button class="btn_primary" type="submit">Crea</button>
            </fieldset>
        </form>
    </section>
</main>
</body>
</html>
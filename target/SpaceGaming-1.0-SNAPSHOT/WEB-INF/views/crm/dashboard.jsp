<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Admin Dashboard</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Admin Dashboard"/>
        <jsp:param name="styles" value="crm"/>
        <jsp:param name="scripts" value="crm"/>
    </jsp:include>
    <style>
        .body > div{
            background-color: white;
            box-shadow: -9px -4px 12px 3px #B7B7B7;
            margin: 30px;
            font-style: italic;
            font-weight: bold;
            text-align: center;
        }

        .body > div > h4{
            margin: 0;
            padding: 1rem;
            color: white;
            background-color: var(--viola);
        }

        .body > div > h2{
            justify-self: center;
            font-size: 3rem;
        }
    </style>
</head>
<body>
<main class="app">
    <aside class="sidebar">
        <nav class="menu grid-y align-center">
            <img src="${context}/images/logo.png" width="100" height="100">
            <a href="">Gestione Clienti</a>
            <a href="">Gestione Prodotti</a>
            <a href="">Gestione Ordini</a>
            <a href="">Gestione Categorie</a>
            <a href="">Profilo</a>
            <a href="">Logout</a>
        </nav>
    </aside>
    <section class="content grid-y">
        <header class="topbar grid-x align-center">
            <img class="burger" src="${context}/icons/menu.svg">
            <label class="field command">
                <input type="text" placeholder="Cerca Comandi">
            </label>
            <span class="account">
                <img src="${context}/icons/menu.svg">
                Benvenuto Amministratore
            </span>
        </header>
        <div class="body grid-x justify-center">
            <div class="grid-y cell w40">
                <h2>Utenti Mensili</h2>
                <h4>2313</h4>
            </div>
            <div class="grid-y cell w40">
                <h2>Incasso Mensile</h2>
                <h4>1312</h4>
            </div>
            <div class="grid-y cell w40">
                <h2>Utenti Totali</h2>
                <h4>411412</h4>
            </div>
            <div class="grid-y cell w40">
                <h2>Incasso Totale</h2>
                <h4>712334</h4>
            </div>
        </div>
        <footer class="info">
            <p>Copyright 2021</p>
        </footer>
    </section>
</main>
</body>
</html>

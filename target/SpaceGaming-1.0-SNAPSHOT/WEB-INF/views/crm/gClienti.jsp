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
        .list{
            height: 70vh;
            width:80vw;
        }
        .list{
            overflow:hidden;
            overflow-y:scroll;
        }
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
        <ul class="body list">
                <c:forEach items="${customers}" var="customer">
                    <li class="w40 grid-x">${customer.fname} ${customer.lname}
                        <form action="UpdateCustomer">
                            <input type="hidden" name="email" value="${customer.email}">
                            <input type="submit" value="Modifica">
                        </form>
                    </li>
                </c:forEach>
        </ul>
        <footer class="info">
            <p>Copyright 2021</p>
        </footer>
    </section>
</main>
</body>
</html>
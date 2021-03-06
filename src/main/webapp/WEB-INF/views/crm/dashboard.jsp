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

        .body > div > h2{
            margin: 0;
            padding: 1rem;
            color: white;
            background-color: var(--viola);
        }

        .body > div > h4{
            justify-self: center;
            font-size: 3rem;
        }
    </style>
</head>
<body>
<main class="app">
    <%@include file="../partials/crmSidebar.jsp"%>
    <section class="content grid-y">
        <%@include file="../partials/crmHeader.jsp"%>
        <div class="body grid-x justify-center">
            <div class="grid-y cell w40">
                <h2>Prodotti in vendita</h2>
                <h4>${totaleprodotti}</h4>
            </div>
            <div class="grid-y cell w40">
                <h2>Incasso Mensile</h2>
                <h4>${totalemese}</h4>
            </div>
            <div class="grid-y cell w40">
                <h2>Utenti Totali</h2>
                <h4>${nUtenti}</h4>
            </div>
            <div class="grid-y cell w40">
                <h2>Incasso totale</h2>
                <h4>${totale}</h4>
            </div>
        </div>
    </section>
</main>
</body>
</html>

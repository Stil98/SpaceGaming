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
    <%@include file="../partials/crmSidebar.jsp"%>
    <section class="content grid-y">
        <%@include file="../partials/crmHeader.jsp"%>
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
    </section>
</main>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<html>
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
<body>
<jsp:include page="../partials/head.jsp">
    <jsp:param name="title" value="Ordini"/>
</jsp:include>
<jsp:include page="../partials/headerlogged.jsp">
    <jsp:param name="title" value="Ordini"/>
</jsp:include>

    <div class="body grid-x justify-center">
        <section class="grid-y cell products">
            <table class="table product-table">
                <thead>
                <tr>
                    <th>Totale</th>
                    <th>Utente</th>
                    <th>Data</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ordersEmail}" var="order">
                    <tr>
                        <td data-head="id">${order.prezzoTot}</td>
                        <td data-head="email">${order.utente.email}</td>
                        <td data-head="data">${order.data}</td>
                        <td>
                            <form action="./viewOrdine">
                                <input type="hidden" id="idOrdine" name="idOrdine" value="${order.id}">
                                <input type="submit" class="btncart" value="Visualizza">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </section>
    </div>
</body>
</html>

<%@ page import="java.util.ArrayList" %>
<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page import="progetto.SpaceGaming.product.ProductDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="HomePage"/>
    </jsp:include>
    <c:choose>
        <c:when test="${log}">
            <jsp:include page="/WEB-INF/views/partials/headerlogged.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:when>
        <c:otherwise>
            <jsp:include page="/WEB-INF/views/partials/header.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:otherwise>
    </c:choose>
    <style>
        #page-container {
            position: relative;
            min-height: 100vh;
        }

        #content-wrap {
            padding-bottom: 1.5rem;
        }
    </style>
</head>
<body>
<div id="page-container">
<% ProductDAO dao = new ProductDAO();
ArrayList<Product> prodotti = dao.doRetrieveAll();%>
    <%for(int i = 0; i<prodotti.size(); i++){%>
    <div class="product-image">
        <img src="data:image/jpg;base64,<%=prodotti.get(i).getBase64img()%>" width="350" height="370">
    </div>
    <div class="product-info">
        <h5>Nome: </h5><h6><%=prodotti.get(i).getNome()%></h6><br>
        <h5>Prezzo: </h5><h6>€<%=prodotti.get(i).getPrezzo()%></h6><br>
        <h5>Descrizione Dettagliata: </h5><h6><%=prodotti.get(i).getDescrizione()%></h6><br>
        <h5>Quantità: </h5><h6><%=prodotti.get(i).getQty()%></h6>
        <h5>ID: </h5><h6><%=prodotti.get(i).getId()%></h6>
        <%}%>
        <div id="content-wrap">
    </div>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
</body>
</html>
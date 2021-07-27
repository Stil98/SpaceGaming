<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page import="progetto.SpaceGaming.product.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="progetto.SpaceGaming.utente.Utente" %>
<%@ page import="progetto.SpaceGaming.cart.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
            <jsp:include page="/WEB-INF/views/partials/headerlogged.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
    <link href="${context}/css/cart.css" rel="stylesheet">

    <style>
    body{
        background-image: url("${context}/images/backimage2.jpg");
        background-size: cover;
        background-repeat: no-repeat;
        background-position-x: center;
        min-height:100vh;
    }
</style>
</head>

<body>
<%  DecimalFormat df = new DecimalFormat("#.00");
    Utente user = (Utente) request.getSession().getAttribute("profilo");
    Cart carrello = (Cart) request.getSession().getAttribute("cart");
    ArrayList<Product> prodotticarrello=carrello.getItems();
    int i = 0;
double total = 0;%>
<c:forEach items="${cart.items}" var="productCart">
    <%Product product = prodotticarrello.get(i);
        total = carrello.total();
        i++;
    %>
<div class="body grid-x justify-center">
    <div class="singleProduct" id="product_1">
        <a class="prodImg" href="#">
            <img src="data:image/jpg;base64,${productCart.base64img}" width="150" height="220">
        </a>
        <div class="singleProdInfo">
            <h3>
                    ${productCart.nome}
            </h3>
            <p>
                <strong>${productCart.descrizione}</strong>
            </p><br>
            <b>€<%=df.format(product.getPrezzo())%></b><br>
            <b style="font-size: 18px;font-style: italic;"> Quantità: <%=carrello.getProductCopies(product)%>
                <form method="post">
                <button type="submit" class="delete btn primary" name="delete" value="${productCart.id}">-</button>
                    <button type="submit" class="add btn primary" name="add" value="${productCart.id}">+</button>
                </form>
            </b>
        </div>
    </div>
</div>
</c:forEach>
<div class="singleProduct">
    <a class="megaButton cartAddNoRadio">
        <span>
            <form action="./acquistoCart">
                <button type="submit" class="btnCart">Acquista Carrello</button>
                <b id="total">€<%=df.format(total)%></b>
            </form>
        </span>
    </a>
    </p>
</div>
</body>

<%i=0;%>
<script>
    $(document).ready(function(){
        $(".delete").click(function () {
            $('form').attr('action', '${pageContext.request.contextPath}/utente/deletepro');
        })
        $(".add").click(function () {
            $('form').attr('action', '${pageContext.request.contextPath}/utente/addprod');
        })
        $(".buy").click(function () {
            $('form').attr('action', '${pageContext.request.contextPath}/utente/acquistacarrello');
        })
    });
</script>
</html>
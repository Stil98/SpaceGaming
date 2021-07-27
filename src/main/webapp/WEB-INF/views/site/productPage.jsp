<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page import="progetto.SpaceGaming.product.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
    <c:choose>
        <c:when test="${log}">
            <jsp:include page="/WEB-INF/views/partials/headerlogged.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:when>
        <c:otherwise>
            <jsp:include page="/WEB-INF/views/partials/new_header.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:otherwise>
    </c:choose>
    <style>
        .grid-x{
            flex-direction: column;
        }
        .singleProduct {
            padding: 20px 6px;
            margin-left: 30%;
            margin-right: 30%;
            border-bottom: solid 1px black;
            background-color: white;
        }

        .singleProduct .prodImg {
            float: left;
            margin-right: 10px;
        }

        .singleProduct .prodImg img {
            max-width: 100%;
            left: 0;
            top: 0;
        }


        .singleProdInfo {
            float: left;
            width: 250px;
            margin-bottom: 10px;
            padding-top: 6px;
        }

        p {
            display: block;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
        }
        ul {
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }
        body, h1, h2, h3, h4, h5, h6, p, li, ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }
        h3{
            color: black;
        }
        .singleProdInfo ul {
            margin-top: 16px;
        }
        .singleProduct .prodBuy {
            float: right;
            clear: right;
            width: 270px;
        }
        .prodBuy {
            max-width: 320px;
        }
        .clearing {
            clear: both;
        }
        div.prodBuy .buyNew a, div.prodBuy .buyUsed a, div.prodBuy .buyPresell a, div.prodBuy .buyDLC a, div.prodBuy .buyTier3 {
            display: block;
            margin-top: 10px;
        }
        a.megaButton {
            display: inline-block;
            vertical-align: middle;
            height: 38px;
            line-height: 38px;
            padding: 0 5px 0 8px;
            text-decoration: none;
            text-align: center;
            font-size: 17px;
            text-transform: uppercase;
            background: #ee3124;
            border: solid 2px #ee3124;
            color: #FFF;
            -webkit-transition: 0.2s;
            -moz-transition: 0.2s;
            -o-transition: 0.2s;
            transition: 0.2s;
        }
        .singleProdInfo li {
            padding-left: 10px;
        }
        a.megaButton span {
            text-decoration: none;
            cursor: pointer;
        }
        div.singleProdInfo strong {
            color: black;
            font-style: italic;
        }
        b{
            color:white;
        }
        .btnCart {
            background-color: #ee3124;
            transition: none;
            border: none;
            padding: 8px;
            font-weight: bold;
            font-style: normal;
        }
        .btnCart:hover{
            filter:none;
            transition: none;
            background-color: #ee3124;
        }
        a.megaButton:hover{
            filter:brightness(140%);
        }
    </style>
</head>

<body>
<%DecimalFormat df = new DecimalFormat("#.00");
    int i = 0;
    ArrayList<Product> prodotti = (ArrayList<Product>) request.getAttribute("lista");%>
<c:forEach items="${lista}" var="product">
    <%Product product = prodotti.get(i);
    i++;%>
    <div class="body grid-x justify-center">
    <div class="singleProduct" id="product_1">
        <a class="prodImg" href="<%=request.getContextPath()%>/prodotto/product?id=${product.id}">
            <img src="data:image/jpg;base64,${product.base64img}" width="150" height="220">
        </a>
        <div class="singleProdInfo">
            <h3>
                ${product.nome}
            </h3>
            <p>
                <strong>${product.descrizione}</strong>
            </p>

        </div>
        <form action="${pageContext.request.contextPath}/utente/inputcarrello" method="post">
            <input type="hidden" name="id" value="${product.id}">
            <div class="prodBuy">
            <p class="buyPresell">
                <a class="megaButton cartAddNoRadio">
        <span>
            <button type="submit" class="btnCart">Aggiungi al Carrello</button>
                     <b>€<%=df.format(product.getPrezzo())%></b>
        </span>
                </a>
            </p>

        </div>
        <div class="clearing"></div>
        </form>
    </div>

</div>
</c:forEach>
<%i=0;%>
</body>
</html>


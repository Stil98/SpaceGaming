<%@ page import="java.text.DecimalFormat" %>
<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/><meta name="viewport" content="width=device-width, initial-scale=1.0">


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
        body{
            background-image: url("${context}/images/backimage2.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position-x: center;
            min-height:100vh;
        }
        .grid-x{
            flex-direction: column;
        }
        .singleProduct {
            padding: 20px 6px;
            margin-left: 30%;
            margin-right: 30%;
            border-bottom: solid 1px black;
            background-color: white;
            position:relative;
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
            position:absolute;
            bottom: 5%;
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
    <title>Title</title>
</head>
<body>
<%Product pro= (Product) request.getAttribute("product");%>
<%DecimalFormat df = new DecimalFormat("#.00");%>
<div class="body grid-x justify-center">
    <div class="singleProduct" id="product_1">
        <a class="prodImg" href="#">
            <img src="data:image/jpg;base64,${product.base64img}" width="420" height="560">
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
                     <b>???<%=df.format(pro.getPrezzo())%></b>
        </span>
                    </a>
                </p>

            </div>
            <div class="clearing"></div>
        </form>
    </div>

</div>
</body>
</html>

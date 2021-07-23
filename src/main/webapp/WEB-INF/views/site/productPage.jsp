<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page import="progetto.SpaceGaming.product.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
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
            <jsp:include page="/WEB-INF/views/partials/header.jsp">
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
            border-bottom: solid 1px #dfdbd9;
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
            color: white;
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
            color: white;
            font-style: italic;
        }
    </style>
</head>

<body>
<% ProductDAO dao = new ProductDAO();
    ArrayList<Product> prodotti = dao.doRetrieveAll();%>
<%for(int i = 0; i<prodotti.size(); i++){%>
<div class="body grid-x justify-center">
    <div class="singleProduct" id="product_1">
        <a class="prodImg" href="#">
            <img src="data:image/jpg;base64,<%=prodotti.get(i).getBase64img()%>" width="150" height="220">
        </a>
        <div class="singleProdInfo">
            <h3>
                <%=prodotti.get(i).getNome()%>
            </h3>
            <p>
                <strong><%=prodotti.get(i).getDescrizione()%></strong>
            </p>

        </div>
        <div class="prodBuy">
            <p class="buyPresell">
                <a class="megaButton cartAddNoRadio">
        <span>
                <strong>Aggiungi al carrello</strong>
                     <b>€<%=prodotti.get(i).getPrezzo()%></b>
        </span>
                </a>
            </p>

        </div>
        <div class="clearing"></div>
    </div>
</div>
<%}%>
</body>
</html>



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
        .singleProduct {
            padding: 20px 6px;
            margin: 0;
            border-bottom: solid 1px #dfdbd9;
        }

        .singleProduct .prodImg {
            width: 150px!important;
            float: left;
            margin-right: 10px;
        }

        .singleProduct .prodImg img {
            max-width: 100%;
            left: 0;
            top: 0;
        }

        element.style {
            display: inline;
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
    </style>
</head>

<body>
<div class="body grid-x justify-center">
    <div class="singleProduct" id="product_1">
        <a class="prodImg" href="/XboxONE/Games/133706/battlefield-2042">
            <img data-llsrc="https://static-it.gamestop.it/images/products/302620/2med.jpg" alt="2med image" src="https://static-it.gamestop.it/images/products/302620/2med.jpg" class="" onerror="this.src = '/Views/Locale/Content/Images/medDefault.jpg';" style="display: inline;">
        </a>
        <div class="singleProdInfo">

            <h3>
                <a href="/XboxONE/Games/133706/battlefield-2042-compatibile-con-xbox-series-x">Battlefield™ 2042 (Compatibile con Xbox Series X) </a>

            </h3>
            <h4 class="platLogo plat-XboxONE">XboxONE <span class="hideOnMobile"> by <strong>EA Electronic Arts</strong> </span></h4>
            <p>
                <strong>PEGI : Età consigliata 16 e oltre </strong>
            </p>
            <ul>

                <li class="hideOnMobile"><strong>Data di uscita: 22/10/2021</strong></li>



                <li>Consegnato in tempo per il lancio.</li>


                <a href="#" class="ropisPop" style=""><img src="/Views/Locale/Content/Images/pickup@store.png" alt=""></a>

            </ul>

            <div class="havelist-wishlist-block" data-product-id="133706">


                <div class="wishlist-block">
                    <a href="#" class="addToLib add-to-wishlist-link" data-sku="302620" data-product-id="133706" title="Lista dei Desideri"><i class="wishIco"></i></a>
                </div>

                <div class="havelist-block">
                    <span class="addTxt">&nbsp;</span>
                </div>

            </div>
        </div>
        <div class="prodBuy">


            <p class="buyPresell">
                <a class="megaButton cartAddNoRadio" cartelemid="81401">
        <span>
                <strong>Prenotalo</strong>
                     <b>70,98€</b>
        </span>
                </a>
            </p>

            <div class="productAvailability">
            <span class="homeDeliveryAvailable">
                <span class="homeDeliveryActive">
                    <img class="availabilityImg" src="/Content/Images/deliveryAvailable.png" alt="Is Delivery Available"> Consegna a domicilio
                </span>
            </span>
                <span class="clickAndCollectAvailable">
                    <span class="clickAndCollectActive">
                        <img class="availabilityImg" src="/Content/Images/deliveryAvailable.png" alt="Is Reservation Available"> Ritira in negozio
                    </span>
                </span>
            </div>

        </div>
        <div class="clearing"></div>
    </div>
</div>
</body>
</html>


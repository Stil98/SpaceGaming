<%@ page import="java.util.ArrayList" %>
<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page import="progetto.SpaceGaming.product.ProductDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <jsp:include page="/WEB-INF/views/partials/new_header.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:otherwise>
    </c:choose>
    <style>
        .body{
            background-image: url("${context}/images/backhome2.jpg");
            background-size: cover;
        }
        .containerProd, .consoleName{
            display: flex;
            margin-left: 10%;
            margin-right:10%;
            background-color: lightcyan;
            border:2px solid black;
            width: 100%;
        }

        .product-1{
            border:1px solid purple;
            flex:25%;
            text-align: center;
        }
        .product-1:hover{
            filter: brightness(80%);
        }
        .singleProdInfo{
            text-align: center;
        }

        .show-more{
            flex:25%;
            text-align: center;
            position: relative;
            top: 20%;
            left: 0%;
        }

        .consoleName{
            color:black;
            text-align: center;
            justify-content: center;

        }

        @media screen and (max-width: 800px){
            .containerProd{
                display:block;
            }
            .product-1{
                width: 100%;
            }
        }
    </style>
    </style>
</head>
<body>

<body>
<div class="body grid-x justify-center">
    <div class="consoleName">
        <h2>PS4</h2>
    </div>

    <div class="containerProd">
        <div class="product-1">

            <div class="img">
                <img src="src/main/webapp/images/logo.png">
            </div>
            <div class="singleProdInfo">
                <h3>
                    ${product.nome}
                    Destiny
                </h3>
                <p>
                    <strong>${product.descrizione} Sono una descrizione del videogioco </strong>
                </p>
            </div>
            <div class="btn">
                <button type="submit" class="btnCart">Aggiungi al Carrello</button>
            </div>

        </div>
        <div class="product-1">
            <h3>Mostra di più</h3>
            <a class="show-more" href="#"><img src="${context}/icons/menu.svg" width="50" height="50"></a>
        </div>

    </div>


</div>
</div>
<jsp:include page="/WEB-INF/views/partials/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
</body>
</html>
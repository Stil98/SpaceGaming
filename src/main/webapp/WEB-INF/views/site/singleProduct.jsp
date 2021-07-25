<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%DecimalFormat df = new DecimalFormat("#.00");%>
<div class="body grid-x justify-center">
    <div class="singleProduct" id="product_1">
        <a class="prodImg" href="#">
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
                     <b>€${product.prezzo}%></b>
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

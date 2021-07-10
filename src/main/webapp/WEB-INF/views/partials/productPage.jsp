<%@ page import="java.util.ArrayList" %>
<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page import="progetto.SpaceGaming.product.ProductDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <style>
        .flex-container {
            display: flex;
            border:2px black solid;
            border-radius:20px;
            margin:10px;
            width: 100%;
            height: 300px;
            background-color: 	purple	;
        }

        .flex-img {
            background-color: grey;
            width: 40%;
            margin: 10px;
        }

        .flex-item {
            background-color: white;
            border-radius:20px;
            width: 60%;
            margin: 10px;
            padding:0px 15px 0px 15px;
            font-size:18px;
        }

        button{
            border-radius:50px;
            background-color:purple;
            padding:15px;
            margin-top:10px;
            color:white;
            float:right;
            font-size:16px;

        }

        button:hover {
            filter: brightness(80%);
        }
    </style>
</head>
<body>
    <% ProductDAO dao = new ProductDAO();
        ArrayList<Product> prodotti = dao.doRetrieveAll();%>
    <%for(int i = 0; i<prodotti.size(); i++){%>
        <div class="flex-container">
            <div class="flex-img">
                <img src="data:image/jpg;base64,<%=prodotti.get(i).getBase64img()%>" width="350" height="370">
            </div>
            <div class="flex-item">
                <h5>Nome: </h5><h6><%=prodotti.get(i).getNome()%></h6><br>
                <h5>Prezzo: </h5><h6>€<%=prodotti.get(i).getPrezzo()%></h6><br>
                <h5>Descrizione Dettagliata: </h5><h6><%=prodotti.get(i).getDescrizione()%></h6><br>
                <h5>Quantità: </h5><h6><%=prodotti.get(i).getQty()%></h6>
                <h5>ID: </h5><h6><%=prodotti.get(i).getId()%></h6>
                <button>Aggiungi al carrello </button>
            </div>
        </div>
    <%}%>

</body>
</html>


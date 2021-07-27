<%@ page import="java.text.DecimalFormat" %>
<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="progetto.SpaceGaming.product.ProductDAO" %>
<%@ page import="progetto.SpaceGaming.console.Console" %>
<%@ page import="progetto.SpaceGaming.console.ConsoleDAO" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/><meta name="viewport" content="width=device-width, initial-scale=1.0">

<html>
<head>
  <title>Home Page</title>

  <style>

    .containerProd, .consoleName{
      display: flex;
      margin-left: 10%;
      margin-right:10%;
      background-color: lightcyan;
      border:2px solid black;
      width: 100%;
    }
    .consoleName {
      margin-top: 5%;
      background-color: var(--lilla);
    }
  .plus_img:hover{
   filter: brightness(80%);

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
    #last{
      margin-bottom: 5%;
    }
    .show-more{
      flex:25%;
      text-align: center;
      position: relative;
      top: 20%;
      left: 0%;

    }
    .show-more img:hover{
      filter: brightness(80%);
    }
    .consoleName{
      color:black;
      text-align: center;
      justify-content: center;

    }

    @media screen and (max-width: 900px){
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
<%
  DecimalFormat df = new DecimalFormat("#.00");
  int i = 0;
  int s = 0;
  ConsoleDAO cdao = new ConsoleDAO();
  ArrayList<Console> console = cdao.doRetrieveAll();
  ProductDAO prodao = new ProductDAO();%>
<% for(i=0; i<console.size(); i++){
  ArrayList<Product> prodotti = prodao.doRetrieveProdottiByPlatform(console.get(i).getNome());%>
<div class="body grid-x justify-center">
  <div class="consoleName">
    <h2><%=console.get(i).getNome()%></h2>
  </div>
  <div class="containerProd">
    <% if(prodotti.size()>3)
      s = 3;
    else
      s = prodotti.size();
      for(int y = 0; y<s; y++) {%>
    <div class="product-1">
      <div class="img">
        <a class="prodImg" href="<%=request.getContextPath()%>/prodotto/product?id=<%=prodotti.get(y).getId()%>">
        <img src="data:image/jpg;base64,<%=prodotti.get(y).getBase64img()%>" width="150" height="220">
        </a>
      </div>
      <div class="singleProdInfo">
        <h3>
          <%=prodotti.get(y).getNome()%>
        </h3>
        <p>
          <strong><%=prodotti.get(y).getDescrizione()%></strong>
        </p>
      </div>
      <div class="btn">
        <button type="submit" class="btnCart">Aggiungi al Carrello</button>
      </div>
    </div>
    <%}%>
    <div class="product-1">
      <h3>Mostra di più</h3>
      <a class="show-more" href="<%=request.getContextPath()%>/prodotto/<%=console.get(i).getNome()%>"><img src="${context}/icons/plus.png" width="50" height="50"></a>
    </div>

  </div>


</div>
</div>
<%}%>

</body>
</html>

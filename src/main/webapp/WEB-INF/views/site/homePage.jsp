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
  <link href="${context}/css/home.css" rel="stylesheet">

  <title>Home Page</title>

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
        <form action="${pageContext.request.contextPath}/utente/inputcarrello" method="post">
          <input type="hidden" name="id" value="<%=prodotti.get(y).getId()%>">
        <button type="submit" class="btnCart">Aggiungi al Carrello</button>
        </form>
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

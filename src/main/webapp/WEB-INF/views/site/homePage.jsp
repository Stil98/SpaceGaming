<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    .consoleName{
      margin-top:5%;
      background-color: var(--lilla);

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
      <a class="show-more" href="#"><img src="${context}/icons/plus.png" width="50" height="50"></a>
    </div>

  </div>


</div>
</div>


<div class="body grid-x justify-center">
  <div class="consoleName">
    <h2>XBOX</h2>
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


<div class="body grid-x justify-center">
  <div class="consoleName">
    <h2>NINTENDO SWITCH</h2>
  </div>

  <div class="containerProd" ID="last">
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
</body>
</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>

    <style>
        .containerProd{
            display: flex;
            margin:20px 20px 50px 20px;
            height: 300px;
            background-color: lightcyan;
            border:2px solid black;
        }

        .product-1{
            border:1px solid purple;
            flex:25%;
            text-align: center;
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
            color:white;
            text-align: center;

        }
    </style>
</head>

<body>
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
<div class="consoleName">
    <h2>NINTENDO SWITCH</h2>
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

</body>
</html>

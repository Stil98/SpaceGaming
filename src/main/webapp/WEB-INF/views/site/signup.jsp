<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Login"/>
    </jsp:include>
    <style>
        body{
            background-image: url("${context}/images/starbackground.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }
        .app{
            height: 92vh;
        }
        .inner{
            background-color:white;
            border:5px solid black;
            margin:25px;
            padding:25px;
            width: 300px;
            display: none;
            position: absolute;
            left: 2%;
        }
        .inner:hover{
            filter: brightness(130%);
        }
        #info {
            display: none;
            font-size: 15px;
            color: var(--lilla);
        }
        .content{
            height: 8vh;
            background-color: black;
        }

        .login{
            padding: 1rem;
            background-color: white;
            border-radius: 10px;
        }

        .login > *{
            margin: 10px;
        }

        .btn{
            font-weight: bold;
            color: white;
            background-color: var(--viola);
            margin-top: 15px;
            border: solid 5px var(--viola);
            width: 100px;
        }

        .btn:hover{
            background-color: white;
            color: var(--viola);
        }
    </style>
</head>
<body>
<section class="content grid-y">
    <header class="grid-x justify-center align-center">
        <img src="${context}/images/logonuovo.png" width="35%" height="100%">
    </header>
</section>
<form class="app grid-x justify-center align-center" action="./utente/secret" method="post">
    <fieldset class="grid-y cell w40 login">
        <h2 style="text-align: center">Crea un account</h2>
        <br>
        <span> Nome </span>
        <label for="nome" class="field">
            <input type="text" name="nome" id="nome" placeholder="Nome" required>
        </label>

        <span> Cognome </span>
        <label for="cognome" class="field">
            <input type="text" name="cognome" id="cognome" placeholder="Cognome" required>
        </label>

        <span> Username </span>
        <label for="username" class="field">
            <input type="text" name="username" id="username" placeholder="Username" required>
        </label>

        <span> Email </span>
        <label for="email" class="field">
            <input type="email" name="email" id="email" placeholder="Email">
        </label>

        <span> Password </span>
        <label for="password" class="field">
            <input onfocusout="hideInfoPassword()" onfocusin="showInfoPassword()" type="password" name="password" id="password" placeholder="Password" required><br>
        </label>

        <div class="inner" id="inner">
            <div id="info">La password deve essere lunga almeno 8 caratteri e contenere numeri e caratteri speciali</div>
        </div>

        <span>Conferma  Password </span>
        <label for="confermapassword" class="field">
            <input type="password" name="confermapassword" id="confermapassword" placeholder="Conferma Password" required><br>
        </label>

        <span> Indirizzo </span>
        <label for="indirizzo" class="field">
            <input type="text" name="indirizzo" id="indirizzo" placeholder="Indirizzo" required>
        </label>

        <span> Telefono </span>
        <label for="telefono" class="field">
            <input type="text" name="telefono" id="telefono" placeholder="Telefono" required>
        </label>
    </fieldset>
</form>
</body>
</head>
<body>
<script>
    function showInfoPassword(){
        var x = document.getElementById("info")
        x.style.display = "block"

        var y = document.getElementById("inner");
        y.style.display = "block"
    }
</script>
</body>
</html>

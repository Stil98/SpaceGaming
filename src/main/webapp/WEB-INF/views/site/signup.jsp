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
            background-repeat:repeat;
            background-size: cover;
            background-position: center;
        }
        .app{
            height: 92vh;
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
    </style>
</head>
<body>
<section class="content grid-y">
    <header class="grid-x justify-center align-center">
        <img src="${context}/images/logonuovo.png" width="35%" height="100%">
    </header>
</section>
<form class="app grid-x justify-center align-center" action="./create" method="post" onsubmit="return passwordValidation()">
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
            <input title="Password must contain at least 6 characters, including UPPER/lowercase and numbers" onfocusout="hideInfoPassword()" onfocusin="showInfoPassword()" type="password" name="password" id="password" placeholder="Password" required><br>
        </label>

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
        <button class="btn primary" type="submit">Registrati</button>
    </fieldset>
</form>

</body>
</head>
<body>
<script>
    function passwordValidation() {
        let p = false;
        let z = false;
        let y = false;
        var psw = document.getElementById("password").value;
        var psw2 = document.getElementById("confermapassword").value;
        var cell = document.getElementById("telefono").value;
        var strongRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
        var x = strongRegex.test(psw);
        if(cell.length==10){
            z = true;
        }
        if (x) {
        p = true;
    }
        if(z && !p){
            alert("La password non rispecchia i seguenti criteri: almeno una lettera minuscola, almeno una lettera maiuscola, almeno un carattere speciale, almeno otto caratteri");
            return false;
        }
        if(!z && p){
            alert("Il numero inserito non è corretto");
            return false;
        }
        if(!z && !p){
            alert ("Il numero inserito non è corretto" + "\n" +
                "La password non rispecchia i seguenti criteri: almeno una lettera minuscola, almeno una lettera maiuscola, almeno un carattere speciale, almeno otto caratteri")
            return false;
        }
        if(psw !== psw2){
            alert("Le password non corrispondono");
            return false;
        }
        if(z && y && p){
            return true;
        }
    }

</script>
</body>
</html>

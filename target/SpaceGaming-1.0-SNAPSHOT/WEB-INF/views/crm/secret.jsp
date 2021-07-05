<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Login Admin</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Login Admin"/>
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
        <img src="${context}/images/logorotondo.png" width="35%" height="100%">
    </header>
</section>
<form class="app grid-x justify-center align-center" action="./utente/secret" method="post">
    <fieldset class="grid-y cell w40 login">
        <h2 style="text-align: center">Login Pannello Admin</h2>
        <br>
        <span>Email</span>
        <label for="email" class="field">
            <input type="email" name="email" id="email">
        </label>
        <span>Password</span>
        <label for="password" class="field">
            <input type="password" name="password" id="password">
        </label>
        <button class="btn" type="submit">Login</button>
    </fieldset>
</form>
</body>
<jsp:include page="../partials/footer.jsp">
    <jsp:param name="title" value="footer"/>
</jsp:include>
</html>

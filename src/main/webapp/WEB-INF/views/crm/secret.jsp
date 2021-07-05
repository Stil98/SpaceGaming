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
            height: 80px;
            display: inline-block;
            font-weight: bold;
            color: white;
            border-radius: 50px;
            font-size: 25px;
            background-color: var(--viola);
            margin-top: 15px;
            margin-right: 0px;
            width: 100%;
        }
        #regbtn{
            height: 80px;
            display: inline-block;
            font-weight: bold;
            color: black;
            border-radius: 50px;
            font-size: 25px;
            background-color:white;
            margin-top: 15px;
            margin-right: 0px;
            width: 100%;
        }

        .btn:hover, #regbtn:hover{
            filter:brightness(90%);
        }

        span{
            font-size: 25px;
        }
        input{
            margin: 10px;
            height: 35px;
            font-size:21px
        }
    </style>
</head>
<body>
<section class="content grid-y">
    <header class="grid-x justify-center align-center">
        <img src="${context}/images/logorotondo.png" width="35%" height="100%">
    </header>
</section>
<form class="app grid-x justify-center align-center" action="./accesso" method="post">
    <fieldset class="grid-y cell w40 login">
        <h2 style="text-align: center">Accedi a Space Gaming</h2>
        <br>
        <span>Email</span>
        <label for="email" class="field">
            <input type="email" name="email" id="email">
        </label>
        <span>Password</span>
        <label for="password" class="field">
            <input type="password" name="password" id="password">
        </label>
        <div class="login_btn">
            <button class="btn" type="submit" float="left">Accedi</button>
        </div>
        <div class="register_btn">
                <input type="button" id="regbtn" onclick="window.location.href = '<%=request.getContextPath()%>/utente/signup';" value="Crea un account"/>
        </div>

    </fieldset>
</form>
</body>
</html>

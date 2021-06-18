
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Login Admin</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Login Admin"/>
    </jsp:include>
    <style>
        .app{
            background-image: linear-gradient(var(--viola), black);
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
            color: white;
            background-color: var(--viola);
            margin-top: 15px;
        }
    </style>
</head>
<body>
<form class="app grid-x justify-center align-center" action="./account/secret" method="post">
    <fieldset class="grid-y cell w40 login">
        <h2>Login Pannello Admin</h2>
        <span>Email</span>
        <label for="email" class="field">
            <input type="email" name="email" id="email">
        </label>
        <span>Password</span>
        <label for="password" class="field">
            <input type="password" name="password" id="password">
        </label>
        <button class="btn" type="submit">Log in</button>
    </fieldset>
</form>
</body>
</html>

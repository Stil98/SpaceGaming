
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <title>Login Admin</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Login Admin"/>
    </jsp:include>
</head>
<body>
<form class="app align-center" action="./account/secret" method="post">
    <fieldset class="grid-y cell field">
        <h2>Login Pannello Admin</h2>
        <span>Email</span>
        <label for="email">
            <input type="email" name="email" id="email">
        </label>
        <span>Password</span>
        <label for="password">
            <input type="password" name="password" id="password">
        </label>
        <button class="btn" type="submit">Log in</button>
    </fieldset>
</form>
</body>
</html>

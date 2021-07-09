<%@ page import="progetto.SpaceGaming.utente.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profilo utente</title>
</head>
<body>
<section class="content grid-y">
    <fieldset class="grid-y cell w50 login">
        <legend> Profilo:</legend>
        <form action="${pageContext.request.contextPath}/cliente/update" method="post" class="agg" onsubmit="return validatePass()">
            <%Utente user = (Utente) session.getAttribute("profilo");%>
            <span>Nome: </span>
            <input type="text" value="<%=user.getFname()%>" readonly name="nome"><br>
            <span>Cognome: </span>
            <input type="text" value="<%=user.getLname()%>" readonly name="cognome"><br>
            <span>Email: </span>
            <input type="text" value="<%=user.getEmail()%>" readonly name="email"><br>
            <span>Password: </span>
            <input type="password" value="<%=user.getPassword()%>" readonly name="password" id="password"><br>
            <span>Indirizzo: </span>
            <input type="text" value="<%=user.getAddress()%>" readonly name="indirizzo"><br>
            <span>Telefono: </span>
            <input type="text" value="<%=user.getPhoneNumber()%>" readonly name="telefono"><br><br>
            <button type="submit" onclick="salva()" class="btn primary">Salva</button>
            <button type="button" id="mod" class="btn primary">Modifica</button>
        </form>
    </fieldset>
</section>

</body>
</html>

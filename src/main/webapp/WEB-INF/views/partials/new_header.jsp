
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/><meta name="viewport" content="width=device-width, initial-scale=1.0">


<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${context}/css/header.css" rel="stylesheet">
</head>
<body>

<header>
    <div class="img_logo">
        <a href="<%=request.getContextPath()%>/index.jsp"><img class="logo" src="${context}/icons/logo12.png" width="200" height="100" alt="logo" title="Space Gaming"></a>
    </div>
    <div class="buttons">
        <a href="<%=request.getContextPath()%>/prodotto/PS4"><img src="${context}/images/ps4.png" width="38" height="38"></a>
        <a href="<%=request.getContextPath()%>/prodotto/XBOX"><img src="${context}/images/xbox.png" width="38" height="38"></a>
        <a href="<%=request.getContextPath()%>/prodotto/SWITCH"><img src="${context}/images/nintendo.png" width="38" height="38"></a>
    </div>
    <div class="search_box">
        <input type="search" id="search" onkeyup="enterKey()" class="search-box" autocomplete="off"
               maxlength="150"  placeholder="Cerca...">
        <div id="demo"></div>
    </div>
    <div class="log_btn">
        <a href="<%=request.getContextPath()%>/utente/secret">Login/Registrati</a>
    </div>
    <div class="cartbtn">
        <a href="<%=request.getContextPath()%>/utente/carrello" class="cartbtn"><img src="${context}/icons/cart-icon.jpg" width="38" height="38"></a>

    </div>
</header>

</body>
</html>


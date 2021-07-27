<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<html>
<!DOCTYPE html>
<head>
    <title>Header</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
    <link href="${context}/css/header.css" rel="stylesheet">
    <style>

    .logged_btn{
        flex:16%;
        text-align:center;
        top:50%;
        margin:33px 10px 33px 10px;
    }

    .dropdown-content{
        display: none;
        position: absolute;
        background-color: #e6e6e6;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
        border-radius: 5px;
        padding: 5px;
        text-align: center;
        min-width: 255px;

    }
    .dropdown-content a{
        color:black;
        display: block;
        font-size: 24px;
        border-bottom: solid 1px #02020c;
        padding: 5px;
        text-decoration: none;

    }
    .dropdown:hover .dropdown-content {display: block;}

    #wcm{
        background-color: var(--rosso);
        font-weight: bold;
        width: 100%;
    }
</style>
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
    <div class="logged_btn">
            <div class="dropdown">
            <button id="wcm">Bentornato ${profilo.fname}</button>
            <div class="dropdown-content">
                <a href="<%=request.getContextPath()%>/utente/profile">Gestione Profilo</a>
                <a href="<%=request.getContextPath()%>/utente/show">I miei ordini</a>
                <a href="<%=request.getContextPath()%>/utente/logout">Logout</a>
            </div>
    </div>
    </div>
    <a href="<%=request.getContextPath()%>/utente/carrello" class="cartbtn"><img src="${context}/icons/cart-icon.jpg" width="38" height="38"></a>



</header>
</body>
</html>
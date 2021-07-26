<%@ page import="progetto.SpaceGaming.product.ProductDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<link href="<c:url value="/css/header.css"/>" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<html>
<!DOCTYPE html>
<head>
    <style>
        .dropdown-search{
            background-color: #e6e6e6;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 5px;
            padding: 5px;
            text-align: center;
        }
        .dropdown-search a {
            color: black;
            display: block;
            font-size: 24px;
            border-bottom: solid 1px #02020c;
            padding: 5px;
        }
    </style>
    <title>Header</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Login Admin"/>
    </jsp:include>
</head>
<body>
<% ProductDAO pDao=new ProductDAO();
    request.setAttribute("games", pDao.doRetrieveAll()); %>
<header>
        <img class="logo" src="${context}/images/logonuovo.png"  alt="logo" title="Space Gaming">
    <nav>
        <div class="div_links">
        <ul class="nav_links">
            <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
            <li id="drop"><div class="dropdown">
                <button class="dropbtn">Categorie</button>
                <div class="dropdown-content">
                    <a href="<%=request.getContextPath()%>/prodotto/PS4">PS4</a>
                    <a href="<%=request.getContextPath()%>/prodotto/XBOX">XBOX</a>
                    <a href="<%=request.getContextPath()%>/prodotto/SWITCH">SWITCH</a>
                </div>
            </div></li>
            <li><a href="<%=request.getContextPath()%>/info.jsp">Info</a></li></ul>
        </div>
        <div class="div_search">
        <input type="search" id="search" onkeyup="enterKey()" class="search-box" autocomplete="off"
               maxlength="150"  placeholder="Search...">
            <a class="search-btn" href="#">
                <i class="fa fa-search"></i>
            </a>
            <div id="demo"></div>
        </div>
    </nav>
    <div class="dropdown">
       <a href="<%=request.getContextPath()%>/utente/secret">
           <button class="dropbtn">Login/Registrati</button>
       </a>
    </div>
    <a href="#" class="cartbtn"><img src="${context}/icons/carticon.png" width="38" height="38"></a>
</header>
</body>
</html>
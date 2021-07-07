<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<jsp:useBean id="utente" scope="request" type="progetto.SpaceGaming.utente.Utente"/>

<link href="<c:url value="/css/header.css"/>" rel="stylesheet">

<html>
<!DOCTYPE html>
<head>
    <title>Header</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>

</head>

<body>
<header>
    <img class="logo" src="${context}/images/logonuovo.png" width="400" height="242" alt="logo" title="Space Gaming">
    <nav>
        <div class="div_links">
            <ul class="nav_links">
                <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
                <li><a href="#">Categorie</a></li>
                <li><a href="<%=request.getContextPath()%>/info.jsp">Info</a></li></ul>
        </div>
        <div class="div_search">
            <input class="search-box" type="search" maxlength="150"  placeholder="Search...">
            <a class="search-btn" href="#">
                <i class="fas fa-search"></i>
            </a>
        </div>
    </nav>
        <a href="<%=request.getContextPath()%>/utente/profilo"></a>
            <div class="dropdown">
            <button class="dropbtn">Bentornato ${utente.fname}</button>
            <div class="dropdown-content">
                <a href="<%=request.getContextPath()%>/site/profilo">Gestione Profilo</a>
                <a href="<%=request.getContextPath()%>/cliente/show">I miei ordini</a>
                <a href="<%=request.getContextPath()%>/cliente/logout">Logout</a>
            </div>
    </div>
    <a href="#" class="cartbtn"><img src="${context}/icons/carticon.png" width="38" height="38"></a>



</header>
</body>
</html>
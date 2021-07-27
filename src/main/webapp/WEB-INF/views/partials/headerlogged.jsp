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
<style>
    body{
        background-color: var(--viola);
    }
    header{
        display:flex;
        justify-content: flex-start;
        background-size: 30px;
        widht:100%;
        background-color: #1e1e1e;
    }
    .buttons,.search_box{
        flex:35%;
        text-align:center;
        top:50%;
        margin:33px 10px 33px 10px;
    }

    .logged_btn{
        flex:16%;
        text-align:center;
        top:50%;
        margin:33px 10px 33px 10px;
    }
    .cartbtn{
        flex: 10%;
        margin-left: 1%;
        margin-top: 1.15%;
    }
    button{
        padding: 9px 25px;
        background-color: var(--viola);
        border:2px solid black;
        border-radius: 50px;
        cursor:pointer;
        color:white;
        transition: all 0.4s ease 0s;
    }

    button:hover{
        background-color: violet;
        filter: brightness(100%);
    }
    .cartbtn img{
        border-radius: 30px;
        transition: all 0.4s ease 0s;
        padding: 10px;
        height: 50px;
        width: 50px;
    }
    .cartbtn img:hover{
        filter: brightness(80%);
    }
    input[type=search]{
        border-radius: 50px;


    }
    input[type=search]:hover{
        filter:brightness(80%);
    }
    .buttons a, .log_btn a{
        display: inline-block;
        padding:10px 20px;
        margin-right: 20px;
        border-radius: 50px;
        background-color: var(--lilla);
        color: white;
        border:2px solid black;
        text-decoration: none;
    }
    .buttons a, log_btn a{
        transition: all 0.4s ease 0s;

    }

    .buttons a:hover, .log_btn a:hover{
        background-color: violet;
        filter: brightness(100%);
        transition: all 0.3s ease 0s;

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

    }
    .dropdown:hover .dropdown-content {display: block;}


    @media screen and (max-width: 1300px) {


    }
    @media screen and (max-width: 900px){
        header{
            display:block;
        }
        .img_logo logo,.buttons button,.logged_btn button,.search_box *,.cartbtn {
            margin:0px;
            width: 100%;
        }

        .logo{
            margin: 0px 0px 0px 0px;
        }

    }

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
               maxlength="150"  placeholder="Search...">
    </div>
    <div class="logged_btn">
            <div class="dropdown">
            <button id="wcm">Bentornato ${profilo.fname}</button>
            <div class="dropdown-content">
                <a href="<%=request.getContextPath()%>/utente/profile">Gestione Profilo</a>
                <a href="<%=request.getContextPath()%>/cliente/show">I miei ordini</a>
                <a href="<%=request.getContextPath()%>/utente/logout">Logout</a>
            </div>
    </div>
    </div>
    <a href="<%=request.getContextPath()%>/utente/carrello" class="cartbtn"><img src="${context}/icons/cart-icon.jpg" width="38" height="38"></a>



</header>
</body>
</html>
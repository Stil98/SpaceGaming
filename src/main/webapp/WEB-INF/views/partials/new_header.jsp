
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/><meta name="viewport" content="width=device-width, initial-scale=1.0">


<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        .cartbtn,.log_btn{
            flex:10%;
            text-align:center;
            top:50%;
            margin:33px 10px 33px 10px;
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
            border-radius: 50px;
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


        @media screen and (max-width: 1300px) {


        }
        @media screen and (max-width: 900px){
            header{
                display:block;
        }
            .img_logo logo,.buttons button,.log_btn button,.search_box *,.cartbtn {
                margin:0px;
                width: 100%;
            }
            .cartbtn img{

            }
            .logo{
                margin: 0px 0px 0px 0px;
            }

        }

    </style>
</head>
<body>

<header>
    <div class="img_logo">
        <img class="logo" src="${context}/icons/logo12.png" width="200" height="100" alt="logo" title="Space Gaming">
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
    <div class="log_btn">
        <a href="<%=request.getContextPath()%>/utente/secret">Login/Registrati</a>
    </div>
    <div class="cartbtn">
        <a href="<%=request.getContextPath()%>/utente/carrello" class="cartbtn"><img src="${context}/icons/carticon.png" width="38" height="38"></a>    </div>



</header>

</body>
</html>


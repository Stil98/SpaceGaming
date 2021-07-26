
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
        .logo{
           height:200px;
            margin: -70px -100px -80px -90px;
        }
        header{
            display:flex;
            justify-content: flex-start;
            background-image: url("https://media.giphy.com/media/KY2ZMhnCxP008/source.gif");
            background-size: 30px;
            widht:100%;
            background-color: purple;
        }
        .buttons,.search_box{
            flex:35%;
            text-align:center;
            top:50%;
            margin:33px 10px 33px 10px;
        }

        .cartbtn,.log_btn,.img_logo{
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
        <img class="logo" src="${context}/images/logonuovo.png"  alt="logo" title="Space Gaming">
    </div>
    <div class="buttons">
        <button href="<%=request.getContextPath()%>/index.jsp">Home</button>
        <button href="<%=request.getContextPath()%>/.jsp">Console</button>
    </div>
    <div class="search_box">
        <input type="search" id="search" onkeyup="enterKey()" class="search-box" autocomplete="off"
               maxlength="150"  placeholder="Search...">
    </div>
    <div class="log_btn">
        <button href="<%=request.getContextPath()%>/utente/secret">Login/Register</button>
    </div>
    <div class="cartbtn">
        <a href="#" ><img src="${context}/icons/carticon.png" ></a>
    </div>



</header>

</body>
</html>


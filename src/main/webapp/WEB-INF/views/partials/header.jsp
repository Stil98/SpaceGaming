<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<html>
<!DOCTYPE html>
<head>
    <title>Header</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Login Admin"/>
    </jsp:include>
    <script
            src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
            data-auto-a11y="true"
    ></script>
    <style>
        body{
            box-sizing: border-box;
            margin:0;
            padding:0;
            background:#30075d ;
            font-size:25px;

        }

        li,a,button{
            color:white;
            text-decoration: none;

        }

        header{
            height: 10vh;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 10px;
            background-color: #CCCCCC;
            background-image: url("https://media.giphy.com/media/KY2ZMhnCxP008/source.gif");
            background-size: 30px;

        }

        input[type=search]{

            margin-left: 30px;
            filter: brightness(130%);

        }

        .logo{

        }

        .nav_links{
            list-style: none;
            margin-top:33px;
        }

        .nav_links li{
            display: inline-block;
            padding:10px 20px;
            margin-right: 20px;
            border-radius: 50px;
            background-color: var(--viola);
            font-style: italic;
            color: white;
            border:2px solid black;
        }

        .nav_links li a{
            transition: all 0.4s ease 0s;

        }

        .nav_links li:hover{
            background-color: violet;
            filter: brightness(80%);

        }


        button:hover{

            filter: brightness(80%);
        }
        button{
            padding: 9px 25px;
            background-color: var(--viola);
            border:2px solid black;
            border-radius: 50px;
            cursor:pointer;
            transition: all 0.6s ease 0s;
            color:white;
            font-style: italic;
        }


        .dropbtn:hover {background-color: violet;}

        .dropdown {
            position: relative;
            display: inline-block;
        }

    nav{
        display: flex;
        margin-left: -50px;
    }

        div_links{
        flex: 60%;
    }
    .div_search{
        flex:20%;
        background-color:white ;
        border-radius: 50px;
        border: 2px solid black;
        height: 54px;
        width: 450px;
        margin: 27px;
        padding-right: 15px;
        transition: all 0.6s ease;
    }
    .search-btn{
        background-color:white ;
        color: black;
        float:right;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 40px;
    margin-top: 8px;
        border-radius: 50px;


    }
    .search-box{
        margin-top:5px;
        line-height: 0px;
        height: 40px;
        color:black;

    }
        ::-webkit-input-placeholder { color: darkgrey;font-size: 16px; font-style:italic;}

        .div_search:hover{
            filter:brightness(90%);
        }

        .cartbtn{
            color:black;
            background-color: white;
            border-radius: 50px;
            margin-left: 20px;
            padding: 10px 15px 10px 15px;
            border:2px solid black;
            transition: 0.4s all ease;
        }

        .cartbtn:hover{

            filter:brightness(80%);
        }
    </style>

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
    <div class="dropdown">
       <a href="<%=request.getContextPath()%>/utente/secret">
           <button class="dropbtn">Login/Registrati</button>
       </a>
        <a class="cartbtn" href="#" title="Carrello">
            <i class="fas fa-shopping-cart"></i>
        </a>
    </div>



</header>
</body>
</html>
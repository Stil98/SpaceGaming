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
            color:black;
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
        }

        .nav_links li{
            display: inline-block;
            padding:10px 20px;
            margin-right: 20px;
            border-radius: 50px;
            background-color: red;
            border:2px solid black;
        }

        .nav_links li a{
            transition: all 0.6s ease 0s;

        }

        .nav_links li:hover{

            filter: brightness(80%);

        }
        .cta {
            margin-left:auto;
            padding-right: 20px;


        }
        button:hover{

            filter: brightness(80%);
        }
        button{
            padding: 9px 25px;
            background-image: repeating-linear-gradient(65deg, red, yellow 200px);
            border:2px solid black;
            border-radius: 50px;
            cursor:pointer;
            transition: all 0.6s ease 0s;
            color:black;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {background-color: #ddd;}

        .dropdown:hover .dropdown-content {display: block;}

        .dropdown:hover .dropbtn {background-color: violet;}

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

        .div_search:hover{
            filter:brightness(90%);
        }

    </style>

</head>

<body>
<header>
        <img class="logo" src="${context}/images/logonuovo.png" width="400" height="242" alt="logo" title="Space Gaming">
    <nav>
        <div class="div_links">
        <ul class="nav_links">
            <li><a href="#">Home</a></li>
            <li><a href="#">Category</a></li>
            <li><a href="#">About</a></li></ul>
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
           <button class="dropbtn">Login/Register</button>
       </a>

    </div>


</header>
</body>
</html>
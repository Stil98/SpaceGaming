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

        input[type=search]{
            margin: 1.1rem;
            border: 2px solid black;
            filter: brightness(130%);
        }

        .logo{
            cursor: pointer;
        }

        .nav_links{
            list-style: none;
        }

        .nav_links li{
            display: inline-block;
            padding:10px 20px;
            background-color:#f94635;
            border:2px solid black;
        }

        .nav_links li a{
            transition: all 0.6s ease 0s;

        }

        .nav_links li a:hover{
            color: yellow;

        }
        .cta {
            margin-left:auto;

        }
        button{
            padding: 9px 25px;
            background-color:#f94635;
            border:2px solid black;
            border-radius: 50px;
            cursor:pointer;
            transition: all 0.6s ease 0s;
            color:black;
        }

        button:hover{
            filter: brightness(80%);
        }
    nav{
        display: flex;
    }
    .col-1{
        flex: 60%;
    }
    .col-2{
        flex:20%;
    }
    </style>

</head>

<body>
<header>
        <img src="${context}/images/logonuovo.png" width="400" height="240">
    <nav>
        <div class="col-1">
        <ul class="nav_links">
            <li><a href="#">Home</a></li>
            <li><a href="#">Category</a></li>
            <li><a href="#">About</a></li></ul>
        </div>
        <div class="col-2">
        <input type="search" maxlength="150"  placeholder="Search...">
        </div>
    </nav>
    <div class="dropdown">
    <button class="dropbtn">Login/Register</button>
    <div class="dropdown-content">
        <a href="<%=request.getContextPath()%>/utente/secret">Login Admin</a>
        <a href="<%=request.getContextPath()%>/utente/signup">Registrati</a>
        <a href="<%=request.getContextPath()%>/utente/signin">Login</a>
    </div>
    </div>


</header>
</body>
</html>
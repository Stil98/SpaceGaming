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
        *{
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
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 30px 10%;
            background-color: #CCCCCC;

        }

        .logo{
            cursor: pointer;
        }

        .nav_links{
            list-style: none;
            background-color: #CCCCCC;
        }

        .nav_links li{
            display: inline-block;
            padding:0px 20px;
            background-color: #CCCCCC;
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
            border:none;
            border-radius: 50px;
            cursor:pointer;
            transition: all 0.6s ease 0s;
            color:black;
        }

        button:hover{
            filter: brightness(80%);
        }
        .search-bar{
            height:40px ;
            width:240px;
            display: flex;

        }
    </style>

</head>

<body>
<header>
    <img src="${context}/images/logo.png" width="100" height="100">

    <nav>
        <ul class="nav_links">
            <li><a href="#">Home</a></li>
            <li><a href="#">Category</a></li>
            <li><a href="#">About</a></li>
            <li class="search-bar" >
                <input type="search" maxlength="150"  placeholder="Search...">
            </li>

        </ul>


    </nav>
    <a class="cta" href="#" ><button>Login/Register</button></a>


</header>
</body>
</html>
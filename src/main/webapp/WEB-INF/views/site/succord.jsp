<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/css/reset.css"/>" rel="stylesheet">
<link href="<c:url value="/css/library.css"/>" rel="stylesheet">
<link href="<c:url value="/css/errors.css"/>" rel="stylesheet">
<c:set var="context" value="${pageContext.request.contextPath}"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!DOCTYPE html>
<html>
<head>
    <title>Order success</title>
    <style>
        h1 {
            font-size: 50px;
            color:white;
            font-style: normal;
            font-weight: bold;

        }
        span {
            font-style: italic;
            color: white;
            margin-bottom: 20px;
        }
        .bg {

            background-image: url("${context}/images/banner.jpg");

        }

    </style>
</head>
<body>

<div class="bg">
</div>
<div class="errortext">
    <h1>Ordine effettuato con successo!</h1>
    <form>
        <input type="button" class="btn" onclick="window.location.href = '<%=request.getContextPath()%>/index.jsp';" value="Home"/>
    </form>
</div>
</body>
</html>
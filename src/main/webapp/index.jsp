<%@ page import="java.util.ArrayList" %>
<%@ page import="progetto.SpaceGaming.product.Product" %>
<%@ page import="progetto.SpaceGaming.product.ProductDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="HomePage"/>
    </jsp:include>
    <c:choose>
        <c:when test="${log}">
            <jsp:include page="/WEB-INF/views/partials/headerlogged.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:when>
        <c:otherwise>
            <jsp:include page="/WEB-INF/views/partials/new_header.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:otherwise>
    </c:choose>
    <style>
        body{
            background-image: url("${context}/images/backimage2.jpg");
            background-size: inherit;
            background-position: center;
        }
    </style>
</head>
        <body>
<jsp:include page="/WEB-INF/views/site/homePage.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<jsp:include page="/WEB-INF/views/partials/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
</body>
</html>
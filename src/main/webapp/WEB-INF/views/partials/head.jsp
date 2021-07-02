<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="context" value="${pageContext.request.contextPath}"/>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>${param.title}</title>
<meta name="description" content="Ecommerce Videogiochi">
<link rel="icon" type="image/png" href="images/logo.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-direction" content="telephone-no">
<meta name="apple-mobile-web-app-title" content="Space Gaming">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<link rel="apple-touch-icon" href="images/logo.png">
<link rel="apple-touch-startup-image" href="images/logo.png">
<meta name="theme-color" content="#30075d">

<link href="${context}/css/reset.css" rel="stylesheet">
<link href="${context}/css/libreria.css" rel="stylesheet">

<c:if test="${not empty param.styles}">
    <c:forTokens items="${param.styles}" delims="," var="style">
        <link rel="stylesheet" href="${context}/css/${style}.css">
    </c:forTokens>
</c:if>

<script src="${context}/js/libraryJS.js" defer></script>
<c:if test="${not empty param.scripts}">
    <c:forTokens items="${param.scripts}" delims="," var="script">
        <script src="${context}/js/${script}.js" defer></script>
    </c:forTokens>
</c:if>

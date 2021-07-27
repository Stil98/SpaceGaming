<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="<c:url value="/css/footer.css"/>" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<!DOCTYPE html>
<html>
<head>
</head>
<body>

<footer class="site-footer">
    <div class="container">
        <div class="row">
            <div class="col-1">
                <h6>About</h6>
                <p class="text-justify">Space Gaming è nato per diventare uno dei siti più iconici nell’e-commerce riguardo
                    videogiochi di ogni tipo; il sito propone giochi per ogni piattaforma in modo tale da
                    coinvolgere quanta più utenza possibile.
                    Con il suo stile arcade punta ad attirare l’attenzione anche dei più collezionisti di giochi non
                    più disponibili al pubblico e tenta di stuzzicare l’interesse in chi ha sempre visto i videogiochi
                    solo con aspetto ludico.</p>
            </div>

            <div class="col-2">
                <h6>Categories</h6>
                <ul class="footer-links">
                    <li><a href="<%=request.getContextPath()%>/prodotto/PS4">PlayStation 4</a></li>
                    <li><a href="<%=request.getContextPath()%>/prodotto/XBOX">XBOX</a></li>
                    <li><a href="<%=request.getContextPath()%>/prodotto/SWITCH">Nintendo Switch</a></li>
                </ul>
            </div>
        </div>
        <hr>
    </div>
    <div class="container">
            <div class="col-4">
                <p class="copyright-text">Copyright &copy; 2021 All Rights Reserved by
                    <a href="/SpaceGaming_war_exploded/index.jsp">Space Gaming</a>.
                </p>
            </div>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
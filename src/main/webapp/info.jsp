
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
    <style>
        .infotext {
            color:white;
            font-weight: bold;
        }
        legend {
            color: white;
            font-style: italic;
        }
    </style>
</head>
<body>
<fieldset class="grid-y cell w50 login" style="z-index: -1">
    <legend>Obiettivo</legend>
    <p class="infotext">
        Space Gaming è nato per diventare uno dei siti più iconici nell’e-commerce
        riguardo videogiochi di ogni tipo; il sito propone giochi per ogni piattaforma
        in modo tale da coinvolgere quanta più utenza possibile.
        Con il suo stile arcade punta ad attirare l’attenzione anche dei più collezionisti
        di giochi non più disponibili al pubblico e tenta di stuzzicare l’interesse in chi ha sempre visto i videogiochi
        solo con aspetto ludico.
    </p>
</fieldset>
<fieldset class="grid-y cell w50 login" style="z-index: -1">
    <legend>Tema</legend>
    <p class="infotext">
        Il nostro sito ha come tema lo spazio. Ci siamo ispirati a
        Space Invaders, famosissimo videogioco del 1978, la sua pubblicazione decretò
        di fatto l'inizio di un periodo di grande fortuna per i videogiochi, definito in seguito
        come l'età
        dell'oro dei videogiochi arcade. Un videogioco che
        è diventato un simbolo del mondo videoludico e che diventerà anche ispirazione del nostro sito.
    </p>
</fieldset>
</body>
</html>

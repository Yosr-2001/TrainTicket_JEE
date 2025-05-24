<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>R�sultats de recherche</title>
</head>
<body>
<h2>Voyages trouv�s : ${date}</h2>
<p>De ${depart} � ${arrivee}</p>

<c:if test="${empty voyages}">
    <p>Aucun voyage disponible.</p>
</c:if>

<c:forEach var="v" items="${voyages}">
    <div style="margin-bottom: 20px;">
        <p>D�part : ${v.trajet.depart.ville} � ${v.heureDepart}</p>
        <p>Arriv�e : ${v.trajet.arrivee.ville} � ${v.heureArrivee}</p>
        <p>Prix : ${v.prix} DT</p>

        <form action="ReservationServlet" method="post">
            <input type="hidden" name="voyageId" value="${v.id}">
            <input type="text" name="nomClient" placeholder="Votre nom" required>
            <input type="email" name="email" placeholder="Votre email" required>
            <input type="number" name="nbPlaces" value="1" min="1" required>
            <input type="submit" value="R�server">
        </form>
    </div>
</c:forEach>

</body>
</html>

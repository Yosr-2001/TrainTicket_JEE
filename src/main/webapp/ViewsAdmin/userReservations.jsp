<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Réservations de l'utilisateur</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
      <link rel="stylesheet" href="Styles/styleReserv.css" />
</head>
<body>

<jsp:include page="sidebar.jsp" />

<div class="main-content">
    <h2>Réservations de ${utilisateur.nom} ${utilisateur.prenom}</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Voyage</th>
                <th>Nb Personnes</th>
                <th>Prix Total</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="res" items="${reservations}">
                <tr>
                    <td>${res.id}</td>
                    <td>${res.dateReservation}</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty res.voyage}">
                                ${res.voyage.trajet.depart.nom} → ${res.voyage.trajet.arrivee.nom}
                            </c:when>
                            <c:otherwise>
                                <em>Aucun voyage</em>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${res.nbPersonnes}</td>
                    <td>${res.prixTotal} DT</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>

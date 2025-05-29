<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste de tous les voyages</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/styleListeVoyages.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container">
    <h2>Voyages disponibles</h2>

    <c:if test="${empty voyages}">
        <div class="message-empty"><i class="fas fa-info-circle"></i> Aucun voyage trouvé.</div>
    </c:if>

    <div class="cards-container">
        <c:forEach var="v" items="${voyages}">
            <div class="voyage-card">
                <h3><i class="fas fa-train"></i> Voyage #${v.id}</h3>
                <p><i class="fas fa-calendar-day"></i> ${v.dateVoyage}</p>
                <p><i class="fas fa-arrow-right"></i> <strong>Départ :</strong> ${v.trajet.depart.ville} à ${v.heureDepart}</p>
                <p><i class="fas fa-arrow-left"></i> <strong>Arrivée :</strong> ${v.trajet.arrivee.ville} à ${v.heureArrivee}</p>
                <p><i class="fas fa-ticket-alt"></i> <strong>Prix :</strong> ${v.prixVoyage} DT</p>

                <c:if test="${not empty v.trajet.garesDePassage}">
                    <div class="intermediate-gares">
                        <p><i class="fas fa-route"></i> <strong>Gares intermédiaires :</strong></p>
                        <div class="gare-chip-group">
                            <c:forEach var="g" items="${v.trajet.garesDePassage}">
                                <div class="gare-chip">
                                    <i class="fas fa-map-pin"></i> ${g.ville} - ${g.nom}
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>

<c:choose>
    <c:when test="${not empty sessionScope.utilisateur}">
        <form action="ReservationController" method="get" class="reservation-btn">
            <input type="hidden" name="action" value="form">
            <input type="hidden" name="voyageId" value="${v.id}">
            <input type="submit" value="Réserver">
        </form>
    </c:when>

    <c:otherwise>
        <form action="${pageContext.request.contextPath}/login.jsp" method="get" class="reservation-btn">
            <input type="submit" value="réserver">
        </form>
    </c:otherwise>
</c:choose>


            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>

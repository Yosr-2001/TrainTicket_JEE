<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Formulaire de Réservation</title>
    <link rel="stylesheet" href="Styles/styleReservationForm.css" />
</head>
<body>

<jsp:include page="navbar.jsp" />
 
<c:if test="${param.success == 'true'}">
    <div id="toast">✅ Réservation effectuée avec succès !</div>
    <script>
        setTimeout(() => {
            document.getElementById("toast").style.display = "none";
        }, 3000);
    </script>
</c:if>


 
<div class="form-container">
    <h5>Formulaire de réservation</h5>

    <form action="ReservationController" method="post">
        <input type="hidden" name="voyageId" value="${voyage.id}">

        <label>Utilisateur :</label>
        <input type="text" value="${utilisateur.nom}" disabled />

        <label>Voyage :</label>
        <input type="text" value="${voyage.trajet.depart.ville} → ${voyage.trajet.arrivee.ville}" disabled />

        <label>Date de réservation :</label>
        <input type="text" value="${dateReservation}" disabled />

        <label>Nombre de personnes :</label>
        <input type="number" id="nbPersonnes" name="nbPersonnes" min="1" required />

        <label>Prix total :</label>
        <input type="text" id="prixTotal" disabled />

        <input type="submit" value="Valider la réservation" />
    </form>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const prixUnitaire = parseFloat("${voyage.prixVoyage}");
        const inputNb = document.getElementById("nbPersonnes");
        const inputTotal = document.getElementById("prixTotal");

        function updateTotal() {
            const nb = parseInt(inputNb.value) || 0;
            const total = nb * prixUnitaire;
            inputTotal.value = isNaN(total) ? "" : total.toFixed(2) + " Dt";
        }

        inputNb.addEventListener("input", updateTotal);
        if (inputNb.value) updateTotal();
    });
</script>

</body>
</html>

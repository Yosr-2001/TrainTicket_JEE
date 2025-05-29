<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Billets</title>
     <style>
h2 {
    font-size: 2rem;
    margin: 10px 10px 30px 60px;
    color: #34495e;
    border-left: 6px solid #3498db;
    padding: 16px 24px;
    background-color: white;
    display: inline-block;
    line-height: 1.1;
    letter-spacing: 0.5px;
    word-spacing: 1px; 
    margin-left:100px;
}

.empty-msg {
    text-align: center;
    background-color: #fdecea;
    color: #c0392b;
    padding: 16px;
    border-left: 5px solid #e74c3c;
    border-radius: 6px;
    max-width: 600px;
    margin: 0 auto 30px;
    font-weight: bold;
}

.cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 24px;
    max-width: 1100px;
    margin: 0 auto 40px;
}

.card {
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    padding: 24px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-decoration: none;
    color: inherit;
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.card:hover {
    transform: translateY(-4px);
    box-shadow: 0 6px 16px rgba(0,0,0,0.15);
}

.card h3 {
    color: #3498db;
    margin-bottom: 8px;
    font-size: 1.3rem;
}

.card p {
    margin: 0;
    font-size: 0.95rem;
    color: #2c3e50;
}

.btn-print {
    background-color: #3498db;
    color: white;
    border: none;
    padding: 10px 16px;
    border-radius: 6px;
    font-size: 0.95rem;
    font-weight: bold;
    cursor: pointer;
    margin-top: 12px;
    align-self: flex-end;
    transition: background-color 0.3s ease;
}

.btn-print:hover {
    background-color: #2a7cb8;
}

.btn-return {
    display: block;
    margin-top: 20px;
    text-decoration: none;
    background-color: #e0e0e0;
    color: #2c3e50;
    padding: 16px 16px;
    border-radius: 6px;
    font-weight: 500;
    transition: background-color 0.3s ease;
    width: fit-content;
    margin-left: auto;
    margin-right:30px;
}

.btn-return:hover {
    background-color: #d5d5d5;
}   </style>
    <script>
        // Fonction pour imprimer uniquement une carte spécifique
        function printCard(cardId) {
            var cardContent = document.getElementById(cardId).innerHTML;
            var printWindow = window.open('', '', 'height=600,width=800');
            printWindow.document.write('<html><head><title>Impression Billet</title>');
            // On peut ajouter ici le CSS pour un rendu correct
            printWindow.document.write('<style>');
            printWindow.document.write('body { font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; padding: 20px; }');
            printWindow.document.write('.card { box-shadow: 0 3px 8px rgba(0,0,0,0.1); border-radius: 12px; padding: 20px 25px; width: 100%; box-sizing: border-box; }');
            printWindow.document.write('.card h3 { margin-top: 0; font-weight: 700; font-size: 1.2em; color: #34495e; }');
            printWindow.document.write('.card p { color: #555; font-size: 1em; }');
            printWindow.document.write('</style>');
            printWindow.document.write('</head><body>');
            printWindow.document.write(cardContent);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            printWindow.focus();
            printWindow.print();
            printWindow.close();
        }
    </script>
</head>
<body>

	<jsp:include page="navbar.jsp" />
    <div class="container">
        <h2>Billets</h2>

        <c:if test="${empty billets}">
            <p class="empty-msg">Aucun billet trouvé pour cette réservation.</p>
        </c:if>

        <c:if test="${not empty billets}">
            <div class="cards">
                <c:forEach var="b" items="${billets}">
                    <div class="card" id="card-${b.id}">
                        <h3>Billet #${b.id}</h3>
                       <%-- <p>Date d'émission : ${b.dateEmission}</p> --%>


                        <c:if test="${not empty b.reservation}">
                            <c:if test="${not empty b.reservation.utilisateur}">
                                <p><strong>Réservé par :</strong> ${b.reservation.utilisateur.prenom } ${b.reservation.utilisateur.nom} </p>
                            </c:if>

                            <c:if test="${not empty b.reservation.voyage}">
                                <p><strong>Voyage :</strong>
                                    <c:if test="${not empty b.reservation.voyage.trajet}">
                                        ${b.reservation.voyage.trajet.depart} → ${b.reservation.voyage.trajet.arrivee}
                                    </c:if>
                                    <c:if test="${empty b.reservation.voyage.trajet}">
                                        <span style="color:red;">Information trajet non disponible</span>
                                    </c:if>
                                </p>
                                <p><strong>Date de voyage :</strong> ${b.reservation.voyage.dateVoyage}</p>
                                <p><strong>Horaire de départ  :</strong> ${b.reservation.voyage.heureDepart}</p>
                                
                                 <p><strong>Horaire d'arrivée :</strong> ${b.reservation.voyage.heureArrivee}</p>
                                 
                                
                            </c:if>

                            <p><strong>Date de réservation :</strong> ${b.reservation.dateReservation}</p>
                        </c:if>

                        <button class="btn-print" onclick="printCard('card-${b.id}')">🖨️ Imprimer ce billet</button>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <p><a href="ReservationController?action=mesReservations" class="btn-return">← Retour à mes réservations</a></p>
    </div>

</body>
</html>

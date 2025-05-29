<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Mes Réservations</title>
<style>
h2 {
    font-size: 2rem;
    margin: 30px 0 30px 0px; 
    color: #34495e;
    position: relative;
    display: inline-block;
    border-left: 6px solid #3498db;
    padding-left: 12px;
}

.header-wrapper {
    text-align: center;
    margin-bottom: 20px;
}

.no-reservations {
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

.card-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
	gap: 24px;
	max-width: 1100px;
	margin: 0 auto;
}

.card {
	background: white;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
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
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
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
</style>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="header-wrapper">
		<h2>Mes Réservations</h2>
	</div>


	<c:if test="${empty mesReservations}">
		<p class="no-reservations">Vous n'avez aucune réservation.</p>
	</c:if>

	<c:if test="${not empty mesReservations}">
		<div class="card-container">
			<c:forEach var="r" items="${mesReservations}">
				<a class="card"
					href="BilletController?action=list&reservationId=${r.id}">
					<h3>Réservation #${r.id}</h3>
					<p>
						<strong>Voyage :</strong> ${r.voyage.trajet.depart.ville} →
						${r.voyage.trajet.arrivee.ville}
					</p>
					<p>
						<strong>Date de réservation :</strong> ${r.dateReservation}
					</p>
					<p>
						<strong>Nombre de personnes :</strong> ${r.nbPersonnes}
					</p>
				</a>
			</c:forEach>
		</div>
	</c:if>

</body>
</html>

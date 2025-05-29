<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Accueil - Réservation de Billets</title>
    <link rel="stylesheet" href="../Styles/styleHomePage.css"> 
    
</head>
<body>
 
<jsp:include page="navbar.jsp" />

<div class="container">
    

     <div class="header-wrapper">
		<h2>Rechercher un voyage</h2>
	</div>

     
    <form action="${pageContext.request.contextPath}/RechVoyage" method="get">
    
        <div>
            <label for="date"><i class="fas fa-calendar-day"></i> Date du voyage</label>
            <input type="date" name="date" required>
        </div>

        <div>
            <label for="villeDepart"><i class="fas fa-map-marker-alt"></i> Ville de départ</label>
            <input type="text" name="villeDepart" placeholder="Ex: Tunis" required>
        </div>

        <div>
            <label for="villeArrivee"><i class="fas fa-location-arrow"></i> Ville d’arrivée</label>
            <input type="text" name="villeArrivee" placeholder="Ex: Sfax" required>
        </div>

        <input type="submit" value="Rechercher">
    </form>
</div> 

</body>
</html>

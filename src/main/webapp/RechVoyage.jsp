<!-- <form action="${pageContext.request.contextPath}/RechVoyage" method="post">
    <label>D�part :</label>
    <select name="departId" required>
        <c:forEach var="g" items="${gares}">
            <option value="${g.id}">${g.ville} - ${g.nom}</option>
        </c:forEach>
    </select>

    <label>Arriv�e :</label>
    <select name="arriveeId" required>
        <c:forEach var="g" items="${gares}">
            <option value="${g.id}">${g.ville} - ${g.nom}</option>
        </c:forEach>
    </select>

    <label>Date :</label>
    <input type="date" name="dateVoyage" required>

    <input type="submit" value="Rechercher">
</form>
 -->
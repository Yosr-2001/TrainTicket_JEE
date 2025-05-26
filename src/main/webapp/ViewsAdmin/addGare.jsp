<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Gestion des Gares</title>

<!-- FontAwesome pour les icônes -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f4f7fb;
        margin: 0;
        padding: 0;
        display: flex;
    }

    .sidebar {
        width: 220px;
        background-color: #1f2d3d;
        color: #ecf0f1;
        padding: 30px 20px;
        position: fixed;
        top: 0;
        left: 0;
        height: 100vh;
        box-shadow: 2px 0 6px rgba(0,0,0,0.2);
        display: flex;
        flex-direction: column;
        z-index: 1000;
    }

    .sidebar-header {
        font-size: 1.5rem;
        font-weight: 600;
        color: #3498db;
        margin-bottom: 40px;
        text-align: center;
        letter-spacing: 0.5px;
    }

    .sidebar-menu {
        list-style: none;
        padding: 0;
        margin: 0;
        flex-grow: 1;
    }

    .sidebar-menu li {
        margin-bottom: 18px;
    }

    .sidebar-menu li a {
        display: flex;
        align-items: center;
        gap: 12px;
        color: #bdc3c7;
        text-decoration: none;
        padding: 10px 14px;
        border-radius: 6px;
        font-weight: 500;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .sidebar-menu li a:hover {
        background-color: #294866;
        color: #ecf0f1;
    }

    .sidebar-menu li a i {
        min-width: 20px;
        text-align: center;
    }

    .sidebar-menu li a span {
        font-size: 1em;
    }

    .main-content {
        margin-left: 220px;
        padding: 30px;
        flex-grow: 1;
    }

    h2 {
        color: #2c3e50;
        font-size: 1.8em;
        border-left: 6px solid #3498db;
        padding-left: 12px;
        margin-bottom: 20px;
        font-weight: 700;
    }

    form {
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 3px 6px rgba(0,0,0,0.1);
        max-width: 400px;
        margin-bottom: 40px;
    }

    label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
        color: #34495e;
    }

    input[type="text"] {
        width: 100%;
        padding: 8px 12px;
        margin-top: 5px;
        margin-bottom: 15px;
        border: 1.5px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus {
        border-color: #3498db;
        outline: none;
        box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
    }

    input[type="submit"] {
        margin-top: 20px;
        background-color: #3498db;
        color: white;
        border: none;
        padding: 10px 25px;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        font-size: 1.1em;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
    }

    hr {
        margin: 40px 0;
        border: none;
        border-top: 1px solid #ddd;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 14px 20px;
        border-bottom: 1px solid #eee;
        text-align: left;
        font-size: 1em;
    }

    th {
        background-color: #3498db;
        color: white;
    }

    tr:hover {
        background-color: #f0f8ff;
    }

    /* Responsive */
    @media (max-width: 768px) {
        body {
            flex-direction: column;
        }
        .sidebar {
            width: 100%;
            height: auto;
            position: relative;
            box-shadow: none;
        }
        .main-content {
            margin-left: 0;
            padding: 20px;
        }
    }
</style>
</head>
<body>

<jsp:include page="sidebar.jsp" />

<div class="main-content">
    <h2>Ajouter une nouvelle Gare</h2>

    <form action="${pageContext.request.contextPath}/GareController" method="post">
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" required />

        <label for="ville">Ville :</label>
        <input type="text" id="ville" name="ville" required />

        <input type="submit" value="Ajouter" />
    </form>

    <hr />

    <h2>Liste des gares</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Ville</th>
        </tr>
        <c:forEach var="gare" items="${listGare}">
            <tr>
                <td>${gare.id}</td>
                <td>${gare.nom}</td>
                <td>${gare.ville}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
	
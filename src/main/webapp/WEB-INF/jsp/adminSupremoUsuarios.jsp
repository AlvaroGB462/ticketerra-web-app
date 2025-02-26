<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gestión de Usuarios - Ticketerra</title>
<link rel="icon" href="/static/imagenes/LogoFavicon.jpg" />
<link rel="stylesheet" href="/static/css/stylesAdminSupremoUsuarios.css">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Panel de Gestión de Usuarios</h1>
        <div class="header-options">
            <a href="/usuarios/logout" class="btn btn-danger">Cerrar Sesión</a>
        </div>

        <table class="tabla">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre Completo</th>
                    <th>Correo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="userTable">
                <c:choose>
                    <c:when test="${not empty usuarios}">
                        <c:forEach var="usuario" items="${usuarios}">
                            <tr>
                                <td>${usuario.id}</td>
                                <td>${usuario.nombreCompleto}</td>
                                <td>${usuario.correo}</td>
                                <td class="user-actions">
                                    <button class="delete-user"
                                        onclick="eliminarUsuario('${usuario.correo}')">Eliminar</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr id="noUsersRow">
                            <td colspan="4">No hay usuarios disponibles</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <script>
    
    	
    	var rolUsuario = "<%= session.getAttribute("rolUsuario") %>";

    	if (!rolUsuario || rolUsuario !== "adminSupremo") {
        	window.location.href = "/usuarios/index";
    	}
        	document.addEventListener("DOMContentLoaded", function () {
            	cargarUsuarios();
        	});

        function cargarUsuarios() {
            fetch('/usuarios/lista')
                .then(response => response.text())
                .then(html => {
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, "text/html");
                    const newUserTable = doc.querySelector("#userTable").innerHTML;
                    document.querySelector("#userTable").innerHTML = newUserTable;
                })
                .catch(error => console.error("Error al cargar usuarios:", error));
        }

        function eliminarUsuario(correo) {
            if (confirm("¿Estás seguro de eliminar este usuario?")) {
                fetch('/usuarios/eliminar', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: 'correo=' + correo
                })
                .then(response => response.text())
                .then(data => {
                    alert(data);
                    cargarUsuarios(); // Recargar solo la lista de usuarios
                })
                .catch(error => console.error("Error al eliminar usuario:", error));
            }
        }
    </script>
</body>
</html>

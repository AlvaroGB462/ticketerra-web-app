<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ticketerra.frontend.ticketerra_web_app.modelos.Usuario" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios - Ticketerra</title>
    <link rel="icon" href="/static/imagenes/LogoFavicon.jpg" />
    <link rel="stylesheet" href="/static/css/stylesAdminSupremoUsuarios.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Panel de Gestión de Usuarios</h1>

        <div class="header-options">
            <input id="searchInput" type="text" placeholder="Buscar usuarios">
            <button id="addUserButton">Añadir Usuario</button>
            <a href="/usuarios/logout" class="btn btn-danger">Cerrar Sesión</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre Completo</th>
                    <th>Correo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="userTable">
                <%
                    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                    if (usuarios != null && !usuarios.isEmpty()) {
                        for (Usuario usuario : usuarios) {
                %>
                    <tr>
                        <td><%= usuario.getId() %></td>
                        <td><%= usuario.getNombreCompleto() %></td>
                        <td><%= usuario.getCorreo() %></td>
                        <td class="user-actions">
                            <button class="delete-user" onclick="eliminarUsuario('<%= usuario.getCorreo() %>')">Eliminar</button>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="4">No hay usuarios disponibles</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script>
        function eliminarUsuario(correo) {
            if (confirm("¿Estás seguro de eliminar este usuario?")) {
                fetch('/adminSupremoUsuarios/eliminar', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: 'correo=' + correo
                })
                .then(response => response.text())
                .then(data => {
                    alert(data);
                    location.reload();
                });
            }
        }
    </script>
</body>
</html>

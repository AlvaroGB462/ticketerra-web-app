<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro Fallido</title>
    <link rel="stylesheet" href="/static/css/stylesFallido.css">
</head>
<body>
    <div class="error-container">
        <h2 class="error-title">❌ Registro Fallido</h2>
        <p class="error-message">Ocurrió un problema al registrar tu cuenta.</p>

        <%-- Mostrar el mensaje de error si existe --%>
        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>

        <a href="/usuarios/registrar" class="retry-button">← Volver al Registro</a>
    </div>
</body>
</html>

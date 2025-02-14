<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Restablecer Contraseña</title>
    <link rel="stylesheet" href="/static/css/stylesRestablecer.css">
</head>
<body>
    <main>
        <div class="form-container">
            <h2 class="title">Ingresa una nueva contraseña</h2>
            <form action="/usuarios/restablecer" method="post" class="form">
                <input type="hidden" name="token" value="${token}">
                <div class="input-group">
                    <label for="nuevaContrasena">Nueva Contraseña:</label>
                    <input type="password" name="nuevaContrasena" id="nuevaContrasena" required>
                </div>
                <div class="input-group">
                    <label for="repetirContrasena">Repetir Contraseña:</label>
                    <input type="password" name="repetirContrasena" id="repetirContrasena" required>
                </div>
                <button type="submit" class="sign">Cambiar Contraseña</button>
            </form>
            <p>${mensaje}</p>
        </div>
    </main>
</body>
</html>
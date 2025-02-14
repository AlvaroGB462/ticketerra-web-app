<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Recuperar Contraseña</title>
    <link rel="stylesheet" href="/static/css/stylesRecuperar.css">
</head>
<body>
    <main>
        <div class="form-container">
            <h2 class="title">Recuperar Contraseña</h2>
            <form action="/usuarios/recuperar" method="post" class="form">
                <div class="input-group">
                    <label for="correo">Correo:</label>
                    <input type="email" name="correo" id="correo" required>
                </div>
                <button type="submit" class="sign">Enviar</button>
            </form>
            <p>${mensaje}</p>
        </div>
    </main>
</body>
</html>

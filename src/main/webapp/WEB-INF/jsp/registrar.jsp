<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
    <link rel="stylesheet" href="/static/css/stylesRegistrar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="fullscreen-container">
        <div class="caja-registro">
            <a href="/usuarios/index" class="nav-link" style="color: #0cc0df;">
                <i class="bi bi-arrow-left"></i> Regresar
            </a>

            <h1 class="titulo-registro">Formulario de Registro</h1>

            <!-- Mostrar mensaje de confirmación si se ha registrado correctamente -->
            <c:if test="${not empty mensaje}">
                <p style="color: green; text-align: center;">${mensaje}</p>
            </c:if>

            <c:if test="${empty mensaje}">
                <form action="/usuarios/registrar" method="POST">
                    <!-- Nombre completo -->
                    <div class="form-group">
                        <label for="nombreCompleto" class="form-control-label">Nombre Completo</label>
                        <input type="text" id="nombreCompleto" name="nombreCompleto" placeholder="Ingresa tu nombre completo" required>
                    </div>

                    <!-- Correo -->
                    <div class="form-group">
                        <label for="correo" class="form-control-label">Correo Electrónico</label>
                        <input type="email" id="correo" name="correo" placeholder="Ingresa tu correo" required>
                    </div>

                    <!-- Teléfono -->
                    <div class="form-group">
                        <label for="telefono" class="form-control-label">Teléfono</label>
                        <input type="tel" id="telefono" name="telefono" placeholder="Ingresa tu número de teléfono" required>
                    </div>

                    <!-- Código postal -->
                    <div class="form-group">
                        <label for="codigoPostal" class="form-control-label">Código Postal</label>
                        <input type="text" id="codigoPostal" name="codigoPostal" placeholder="Ingresa tu código postal" required>
                    </div>

                    <!-- Contraseña -->
                    <div class="form-group">
                        <label for="contrasena" class="form-control-label">Contraseña</label>
                        <input type="password" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" required>
                    </div>

                    <!-- Repetir Contraseña -->
                    <div class="form-group">
                        <label for="repetirContrasena" class="form-control-label">Repite tu Contraseña</label>
                        <input type="password" id="repetirContrasena" name="repetirContrasena" placeholder="Repite tu contraseña" required>
                    </div>

                    <!-- Premium -->
                    <div class="form-group">
                        <label for="premium" class="form-control-label">¿Deseas ser usuario Premium?</label>
                        <input type="checkbox" id="premium" name="premium" value="true">
                    </div>

                    <!-- Botón de envío -->
                    <button type="submit">Registrar</button>  
                </form>
            </c:if>
        </div>
    </div>
</body>
</html>

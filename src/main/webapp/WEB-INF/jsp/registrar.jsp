<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro de Usuario</title>
<link rel="stylesheet" href="/static/css/stylesRegistrar.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Iconos -->
</head>
<body>
	<!-- Contenedor para centrar el formulario -->
	<div class="fullscreen-container">
		<div class="caja-registro">
			<a href="/usuarios/index" class="nav-link" style="color: #0cc0df;">
				<i class="bi bi-arrow-left"></i> Regresar
			</a>

			<h1 class="titulo-registro">Formulario de Registro</h1>

			<!-- Mostrar mensajes de error si los hay -->
			<c:if test="${not empty error}">
				<p style="color: red; text-align: center;">${error}</p>
			</c:if>

			<form action="/usuarios/registrar" method="POST">
				<!-- Nombre completo -->
				<div class="form-group">
					<label for="nombreCompleto" class="form-control-label">Nombre
						Completo</label> <input type="text" id="nombreCompleto"
						name="nombreCompleto" placeholder="Ingresa tu nombre completo"
						required>
				</div>

				<!-- Correo -->
				<div class="form-group">
					<label for="correo" class="form-control-label">Correo
						Electrónico</label> <input type="email" id="correo" name="correo"
						placeholder="Ingresa tu correo" required>
				</div>

				<!-- Teléfono -->
				<div class="form-group">
					<label for="telefono" class="form-control-label">Teléfono</label> <input
						type="tel" id="telefono" name="telefono"
						placeholder="Ingresa tu número de teléfono" required>
				</div>

				<!-- Código postal -->
				<div class="form-group">
					<label for="codigoPostal" class="form-control-label">Código
						Postal</label> <input type="text" id="codigoPostal" name="codigoPostal"
						placeholder="Ingresa tu código postal" required>
				</div>

				<!-- Contraseña -->
				<div class="form-group">
					<label for="contrasena" class="form-control-label">Contraseña</label>
					<input type="password" id="contrasena" name="contrasena"
						placeholder="Ingresa tu contraseña" required>
				</div>

				<!-- Repetir Contraseña -->
				<div class="form-group">
					<label for="repetirContrasena" class="form-control-label">Repite
						tu Contraseña</label> <input type="password" id="repetirContrasena"
						name="repetirContrasena" placeholder="Repite tu contraseña"
						required>
				</div>

				<!-- Premium -->
				<div class="form-group">
					<label for="premium" class="form-control-label">¿Deseas ser
						usuario Premium?</label> <input type="checkbox" id="premium"
						name="premium" value="true">
				</div>

				<!-- Campos adicionales para usuario premium -->
				<div id="camposPremium" style="display: none;">
					<div class="form-group">
						<label for="numeroTarjeta" class="form-control-label">Número
							de Tarjeta</label> <input type="text" id="numeroTarjeta"
							name="numeroTarjeta" placeholder="Número de tarjeta">
					</div>
					<div class="form-group">
						<label for="nombreTarjeta" class="form-control-label">Nombre
							en la Tarjeta</label> <input type="text" id="nombreTarjeta"
							name="nombreTarjeta"
							placeholder="Nombre como aparece en la tarjeta">
					</div>
					<div class="form-group">
						<label for="fechaExpiracion" class="form-control-label">Fecha
							de Expiración</label> <input type="text" id="fechaExpiracion"
							name="fechaExpiracion" placeholder="MM/AAAA">
					</div>
					<div class="form-group">
						<label for="cvv" class="form-control-label">CVV</label> <input
							type="text" id="cvv" name="cvv" placeholder="CVV">
					</div>
					<!-- Mostrar precio Premium -->
					<p id="precioPremium" style="display: none;">Precio: 0,99€</p>
				</div>

				<!-- Botón de envío -->
				<button type="submit">Registrar</button>

				<!-- Mensaje informativo -->
				<p id="infoPremium" class="info-premium">Si seleccionas la
					opción Premium, deberás completar los datos de tu tarjeta.</p>
			</form>
		</div>
	</div>

	<script>
        // Función para mostrar/ocultar campos premium
        const premiumCheckbox = document.getElementById("premium");
        const camposPremium = document.getElementById("camposPremium");
        const infoPremium = document.getElementById("infoPremium");
        const precioPremium = document.getElementById("precioPremium");

        premiumCheckbox.addEventListener("change", () => {
            if (premiumCheckbox.checked) {
                camposPremium.style.display = "block";
                infoPremium.style.display = "none"; // Ocultar mensaje
                precioPremium.style.display = "block"; // Mostrar precio
            } else {
                camposPremium.style.display = "none";
                infoPremium.style.display = "block"; // Mostrar mensaje
                precioPremium.style.display = "none"; // Ocultar precio
            }
        });

    </script>
</body>
</html>

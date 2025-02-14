<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Ticketerra - Iniciar Sesión</title>
<link rel="icon" href="/static/imagenes/LogoFavicon.jpg" />
<link rel="stylesheet" href="/static/css/stylesLogin.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
</head>
<body>
	<header class="header">
		<div class="logo">
			<a href="/usuarios/index"> <img
				src="/static/imagenes/LogoTipo.png" alt="Logo" />
			</a>
			<h1>Ticketerra</h1>
		</div>
		<button class="hamburger" aria-label="Toggle navigation">
			<span></span> <span></span> <span></span>
		</button>
		<nav class="nav">
			<a href="/usuarios/index" class="nav-link" id="link-home">Inicio</a>
			<a href="verTickets.html" class="nav-link" id="link-tickets">Mis
				Tickets</a> <a href="/usuarios/crearTicket" class="nav-link" id="link-create">Crear
				Ticket</a> <a class="nav-link bi bi-person-circle"
				href="/usuarios/login" id="link-login"></a>
		</nav>
	</header>

	<main>
		<div class="form-container">
			<p class="title">Iniciar Sesión</p>

			<!-- Mostrar mensaje de error si existe en el modelo -->
			<c:if test="${not empty mensaje}">
				<div class="alert alert-danger" role="alert">${mensaje}</div>
			</c:if>

			<form id="login-form" class="form" action="/usuarios/login"
				method="post">
				<div class="input-group">
					<label for="correo">Correo</label> <input type="text" name="correo"
						id="correo" placeholder="Introduce tu correo" required>
				</div>

				<div class="input-group">
					<label for="contrasena">Contraseña</label> <input type="password"
						name="contrasena" id="contrasena"
						placeholder="Introduce tu contraseña" required>
					<div class="forgot">
						<a rel="noopener noreferrer" href="/usuarios/recuperar">¿Olvidaste
							tu contraseña?</a>
					</div>
				</div>

				<button type="submit" class="sign">Iniciar Sesión</button>
			</form>

			<div class="social-message">
				<div class="line"></div>
				<p class="message">Inicia sesión con redes sociales</p>
				<div class="line"></div>
			</div>

			<div class="social-icons">
				<a href="/usuarios/login-google">
					<button class="icon">
						<i class="fab fa-google"></i>
					</button>
				</a>
			</div>

			<p class="signup">
				¿No tienes una cuenta? <a href="/usuarios/registrar">Regístrate</a>
			</p>
		</div>
	</main>

	<script src="/static/js/scripts.js"></script>
</body>
</html>

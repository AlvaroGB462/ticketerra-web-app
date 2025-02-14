<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ticketerra</title>
<link rel="icon" href="imagenes/LogoFavicon.jpg" />
<link rel="stylesheet" href="/static/css/stylesCrearTicket.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet" />
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
				Tickets</a> <a href="/ticket/crearTicket" class="nav-link"
				id="link-create">Crear Ticket</a> <a
				class="nav-link bi bi-person-circle" href="/usuarios/login"
				id="link-login"></a>
		</nav>
	</header>
	<div class="container">
		<h1>Crear Ticket</h1>
		<form action="/ticket/crearTicket" method="POST"
			enctype="multipart/form-data">
			<label for="categoria">Categoría</label> <select id="categoria"
				name="categoria" required>
				<option value="">Seleccione una categoría</option>
				<option value="entradas">Problemas con entradas</option>
				<option value="cambios">Cambios o devoluciones</option>
				<option value="informacion">Solicitudes de información
					adicional</option>
			</select> <label for="asunto">Asunto</label> <input type="text" id="asunto"
				name="asunto" placeholder="Escriba el asunto del problema" required>

			<label for="descripcion">Descripción</label>
			<textarea id="descripcion" name="descripcion" rows="5"
				placeholder="Describa el problema detalladamente" required></textarea>

			<label for="archivo">Adjuntar Archivo (Opcional)</label> <input
				type="file" id="archivo" name="archivo"> <label
				for="correoUsuario">Correo Electrónico</label> <input type="email"
				id="correoUsuario" name="correoUsuario" placeholder="Tu correo"
				required>

			<button type="submit">Enviar Ticket</button>
		</form>

		<!-- Mostrar mensajes de error -->
		<c:if test="${not empty error}">
			<p style="color: red;">${error}</p>
		</c:if>
	</div>
	<script src="/static/js/scripts.js"></script>
</body>
</html>

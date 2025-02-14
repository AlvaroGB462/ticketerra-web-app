<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Ticketerra</title>
<link rel="icon" href="/static/imagenes/LogoFavicon.jpg" />
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
<link rel="stylesheet" href="/static/css/styles.css" />
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
				Tickets</a> <a href="/ticket/crearTicket" class="nav-link" id="link-create">Crear
				Ticket</a> <a class="nav-link bi bi-person-circle"
				href="/usuarios/login" id="link-login"></a>
		</nav>
	</header>
	<main>
		<h1>Bienvenido a Ticketerra</h1>
		<h2>
			La solución rápida y eficiente para gestionar <br /> tus problemas
			con eventos.
		</h2>
		<p style="font-size: 16px">
			Gestiona tus inconvenientes de manera sencilla y sin complicaciones.<br />
			Crea tickets para resolver problemas con entradas, cambios,<br />
			accesibilidad y más. Nuestro equipo está listo para<br /> ayudarte
			en cada paso del camino.
		</p>
		<a href="/usuarios/registrar"><button class="button">Registrarse</button></a>

	</main>

	<!-- Carrusel de Valoraciones -->
	<div id="valoracionesCarrusel" class="carousel slide"
		data-bs-ride="carousel" data-bs-interval="3000">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div
					class="d-flex justify-content-center align-items-center flex-column text-center p-3">
					<h5 class="usuario">Juan Pérez</h5>
					<div class="estrellas">★★★★☆</div>
					<p class="comentario">"La página es muy fácil de usar y la
						atención al cliente es excelente. ¡Totalmente recomendada!"</p>
				</div>
			</div>

			<div class="carousel-item">
				<div
					class="d-flex justify-content-center align-items-center flex-column text-center p-3">
					<h5 class="usuario">María López</h5>
					<div class="estrellas">★★★★★</div>
					<p class="comentario">"Me encanta lo rápido que se carga la
						página y lo intuitivo de su diseño. ¡Muy buena experiencia!"</p>
				</div>
			</div>

			<div class="carousel-item">
				<div
					class="d-flex justify-content-center align-items-center flex-column text-center p-3">
					<h5 class="usuario">Carlos Gómez</h5>
					<div class="estrellas">★★★★☆</div>
					<p class="comentario">"Excelente plataforma, todo es rápido y
						sencillo. Estoy muy satisfecho con mi experiencia. ¡La recomiendo
						100%!"</p>
				</div>
			</div>

			<div class="carousel-item">
				<div
					class="d-flex justify-content-center align-items-center flex-column text-center p-3">
					<h5 class="usuario">Laura Martínez</h5>
					<div class="estrellas">★★★★★</div>
					<p class="comentario">"Excelente servicio y funcionalidad. Me
						encanta cómo todo funciona a la perfección. ¡Totalmente
						recomendable!"</p>
				</div>
			</div>
		</div>
	</div>

	<footer class="footer text-center mt-4">
		<div>
			<p>&copy; 2025 Ticketerra. Todos los derechos reservados.</p>
		</div>
	</footer>

	<!-- Carga del JS después de la carga del DOM -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Verifica si el elemento existe antes de modificarlo
			const linkHome = document.getElementById('link-home');
			if (linkHome) {
				linkHome.innerText = "Inicio";
			}

			const linkTickets = document.getElementById('link-tickets');
			if (linkTickets) {
				linkTickets.innerText = "Mis Tickets";
			}

			const linkCreate = document.getElementById('link-create');
			if (linkCreate) {
				linkCreate.innerText = "Crear Ticket";
			}

			const linkLogin = document.getElementById('link-login');
			if (linkLogin) {
				linkLogin.innerText = "Login";
			}

			// Aquí puedes agregar más código para modificar elementos del DOM según sea necesario
		});
	</script>

	<!-- Asegúrate de que los archivos JS estén disponibles -->
	<script src="/static/js/scripts.js"></script>
</body>
</html>

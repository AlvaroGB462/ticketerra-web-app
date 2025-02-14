<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticketerra</title>
    <link rel="icon" href="imagenes/LogoFavicon.jpg" />
    <link rel="stylesheet" href="styleVerTicket.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
</head>
<body>
  <header class="header">
    <div class="logo">
      <a href="index.html">
        <img src="imagenes/LogoTipo.png" alt="Logo" />
      </a>
      <h1>Ticketerra</h1>
    </div>
    <button class="hamburger" aria-label="Toggle navigation">
      <span></span>
      <span></span>
      <span></span>
    </button>
    <nav class="nav">
      <nav class="nav">
        <a href="index.html" class="nav-link" id="link-home">Inicio</a>
        <a href="verTickets.html" class="nav-link" id="link-tickets">Mis Tickets</a>
        <a href="crearTicket.html" class="nav-link" id="link-create">Crear Ticket</a>
        <a class="nav-link bi bi-person-circle" href="loguearse.html" id="link-login"></a>
      </nav>
    </nav>
  </header>

    <div class="container">
      <h1>Mis solicitudes de asistencia</h1>
        <div class="header-options">
            <input style="background-color: #2A2A2A;" type="text" placeholder="Buscar solicitudes">
            <select style="background-color: #2A2A2A; color:white;">
                <option value="cualquiera">Cualquiera</option>
                <option value="pendiente">Pendiente</option>
                <option value="en-proceso">En proceso</option>
                <option value="resuelto">Resuelto</option>
            </select>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Asunto</th>
                    <th>ID de Solicitud</th>
                    <th>Última Actualización</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <tr onclick="mostrarDetallesTicket(1)">
                    <td style="color: #0cc0df; font-weight: bold;">Recompensa de Clash errónea</td>
                    <td style="color: white;"><strong>108060174</strong></td>
                    <td style="color: white;">hace 23 días</td>
                    <td class="status-resuelto">Resuelto</td>
                </tr>
            </tbody>
        </table>

        <div id="ticket-1" class="ticket-details">
            <h2>Recompensa de Clash errónea</h2>
            <p><strong>ID de Solicitud:</strong> 108060174</p>
            <p><strong>Categoría:</strong> Problemas con entradas</p>
            <p><strong>Última Actualización:</strong> hace 23 días</p>
            <p><strong>Descripción:</strong> La recompensa entregada no coincide con la prometida al finalizar el torneo Clash.</p>
            <p><strong>Archivo adjunto:</strong> <a href="#">captura_clash.png</a></p>
            <div class="close-btn">
                <button onclick="cerrarDetallesTicket(1)">Cerrar</button>
            </div>
        </div>
    </div>
    <script src="scripts.js"></script>
</body>
</html>

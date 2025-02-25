<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Tickets - Ticketerra</title>
    <link rel="icon" href="/static/imagenes/LogoFavicon.jpg" />
    <link rel="stylesheet" href="/static/css/stylesAdminSupremoTickets.css">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
</head>
<body>
  <div class="container">
    <h1>Panel de Gestión de Tickets</h1>

    <div class="header-options">
        <input id="searchInput" type="text" placeholder="Buscar tickets" />
        <select id="filterCategory">
            <option value="">Categoría</option>
            <option value="">Seleccione una categoría</option>
                <option value="entradas">Problemas con entradas</option>
                <option value="cambios">Cambios o devoluciones</option>
                <option value="informacion">Solicitudes de información adicional</option>
        </select>
        <select id="filterState">
            <option value="">Estado</option>
            <option value="pendiente">Pendiente</option>
            <option value="en-proceso">En proceso</option>
            <option value="resuelto">Resuelto</option>
        </select>
        <select id="filterPriority">
            <option value="">Prioridad</option>
            <option value="alta">Alta</option>
            <option value="media">Media</option>
        </select>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Asunto</th>
                <th>Categoría</th>
                <th>Estado</th>
                <th>Prioridad</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody id="ticketTable">
            <!-- Tickets cargados dinámicamente -->
        </tbody>
    </table>
</div>

  <script src="scripts.js"></script>
</body>
</html>

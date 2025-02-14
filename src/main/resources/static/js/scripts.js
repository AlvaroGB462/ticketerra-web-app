document.addEventListener("DOMContentLoaded", () => {
  const hamburger = document.querySelector(".hamburger");
  const nav = document.querySelector(".nav");

  hamburger.addEventListener("click", () => {
    nav.classList.toggle("active");
    hamburger.classList.toggle("is-active");
  });
});

document.addEventListener("DOMContentLoaded", () => {
  const navLinks = document.querySelectorAll(".nav-link");

  // Obtén la URL actual
  const currentPage = window.location.pathname;

  // Compara cada enlace y marca el activo
  navLinks.forEach((link) => {
    if (link.href.includes(currentPage)) {
      link.classList.add("active");
    } else {
      link.classList.remove("active");
    }
  });
});

var myCarousel = document.querySelector('#valoracionesCarrusel')
var carousel = new bootstrap.Carousel(myCarousel, {
  interval: 3000, // Intervalo de 3 segundos
  ride: 'carousel' // Inicia el carrusel automáticamente
})

document.addEventListener('DOMContentLoaded', function() {
    // Verificar si el usuario está logueado
    const isLoggedIn = false; // Cambiar a true si el usuario está logueado
    const isPremium = false; // Cambiar a true si el usuario es premium

    const linkLogin = document.getElementById('link-login');
    const linkPremium = document.getElementById('link-premium');
    const buttonRegister = document.querySelector('.button');

    if (isLoggedIn) {
        // Ocultar el botón de registro
        if (buttonRegister) {
            buttonRegister.classList.add('hidden');
        }

        // Mostrar la corona si el usuario es premium
        if (isPremium && linkPremium) {
            linkPremium.classList.add('premium');
        }
    } else {
        // Mostrar el botón de registro
        if (buttonRegister) {
            buttonRegister.classList.remove('hidden');
        }

        // Ocultar la corona si el usuario no es premium
        if (linkPremium) {
            linkPremium.classList.remove('premium');
        }
    }
});
///////////////////////////////////////////////////////////////////////////////////////////////
/*
function mostrarDetallesTicket(idTicket) {
  const todosLosDetalles = document.querySelectorAll('.ticket-details');
  todosLosDetalles.forEach(detalle => detalle.style.display = 'none');
  const seccionDetalle = document.getElementById('ticket-' + idTicket);
  if (seccionDetalle) {
      seccionDetalle.style.display = 'block';
  }
}

function cerrarDetallesTicket(idTicket) {
  const seccionDetalle = document.getElementById('ticket-' + idTicket);
  if (seccionDetalle) {
      seccionDetalle.style.display = 'none';
  }
}

//////////////////////////////////////////////////////////////////////////////////////////

document.addEventListener("DOMContentLoaded", () => {
  const tickets = [
      { id: 1, asunto: "Error en entradas", categoria: "Entradas", estado: "Pendiente", prioridad: "Alta" },
      { id: 2, asunto: "Cambio de fecha", categoria: "Cambios", estado: "En proceso", prioridad: "Media" },
  ];

  const ticketTable = document.getElementById("ticketTable");

  const renderTickets = (tickets) => {
      ticketTable.innerHTML = "";
      tickets.forEach((ticket) => {
          const row = document.createElement("tr");
          row.innerHTML = `
              <td>${ticket.id}</td>
              <td>${ticket.asunto}</td>
              <td>${ticket.categoria}</td>
              <td>${ticket.estado}</td>
              <td>${ticket.prioridad}</td>
              <td>
                  <button class="btn btn-edit" onclick="updateTicket(${ticket.id})">Editar</button>
                  <button class="btn btn-note" onclick="addNote(${ticket.id})">Nota</button>
              </td>
          `;
          ticketTable.appendChild(row);
      });
  };

  renderTickets(tickets);
});

function updateTicket(id) {
  alert(`Actualizar estado del ticket ${id}`);
}

function addNote(id) {
  alert(`Agregar nota al ticket ${id}`);
}

//////////////////////////////////////////////////////////////////////////////////////////

// Datos simulados de tickets
const tickets = [
  { id: 1, asunto: "Problema con entrada", categoria: "entradas", estado: "pendiente", prioridad: "alta" },
  { id: 2, asunto: "Devolución solicitada", categoria: "cambios", estado: "resuelto", prioridad: "media" },
  { id: 3, asunto: "Más información requerida", categoria: "informacion", estado: "en-proceso", prioridad: "baja" },
  { id: 4, asunto: "Error en la entrada", categoria: "entradas", estado: "en-proceso", prioridad: "alta" },
];

// Sector asignado al usuario
const usuarioSector = "cambios"; // Esto puede ser dinámico según el login del usuario

// Mostrar sector actual
document.getElementById("current-sector").innerText = usuarioSector;

// Cargar tickets según el sector
function cargarTickets() {
  const tableBody = document.getElementById("ticketTable");
  tableBody.innerHTML = ""; // Limpiar tabla

  const ticketsFiltrados = tickets.filter(ticket => ticket.categoria === usuarioSector);

  if (ticketsFiltrados.length === 0) {
    tableBody.innerHTML = `<tr><td colspan="6" class="text-center">No hay tickets para este sector.</td></tr>`;
    return;
  }

  ticketsFiltrados.forEach(ticket => {
    const row = document.createElement("tr");

    row.innerHTML = `
      <td>${ticket.id}</td>
      <td>${ticket.asunto}</td>
      <td>${ticket.categoria}</td>
      <td class="${getEstadoClass(ticket.estado)}">${ticket.estado}</td>
      <td>${ticket.prioridad}</td>
      <td>
        <button class="btn btn-primary btn-sm">Ver</button>
        <button class="btn btn-danger btn-sm">Eliminar</button>
      </td>
    `;

    tableBody.appendChild(row);
  });
}

// Obtener clase para estado
function getEstadoClass(estado) {
  switch (estado) {
    case "pendiente": return "status-pendiente";
    case "en-proceso": return "status-en-proceso";
    case "resuelto": return "status-resuelto";
    default: return "";
  }
}

// Ejecutar al cargar la página
document.addEventListener("DOMContentLoaded", cargarTickets);
*/
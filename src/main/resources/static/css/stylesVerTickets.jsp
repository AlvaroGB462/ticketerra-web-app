body {
  margin: 0;
  font-family: 'Open Sans', sans-serif;
  background-image: url('imagenes/Fondo.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  color: white;
  min-height: 100vh;
}

.container {
  max-width: 1000px;
  margin: 40px auto;
  background: rgba(0, 0, 0, 0.8);
  padding: 2rem;
  color: rgba(243, 244, 246, 1);
  box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.5);
  border-radius: 8px;

}
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px 40px;
}

.nav-link.active {
  font-weight: bold;
  color: #0cc0df;
  border-bottom: 2px solid #0cc0df;
}

.logo {
  display: flex;
  align-items: center;
}

.logo img {
  height: 50px;
  margin-right: 15px;
  transition: transform 0.3s ease;
}

.logo img:hover {
  transform: scale(1.1);
}

.logo h1 {
  font-family: 'Montserrat', sans-serif;
  font-size: 32px;
  font-weight: bold;
  color: #0cc0df;
  margin: 0;
}

.nav {
  display: flex;
  align-items: center;
  gap: 20px;
}

.nav a {
  font-family: 'Open Sans', sans-serif;
  font-size: 18px;
  color: white;
  transition: color 0.3s;
}

.nav a:hover {
  color: #0cc0df;
}

.bi-person-circle {
  font-size: 28px;
  color: white;
  cursor: pointer;
  transition: color 0.3s;
}

.bi-person-circle:hover {
  color: #0cc0df;
}

/* Menú hamburguesa responsivo */
.hamburger {
  display: none;
  flex-direction: column;
  gap: 5px;
  background: none;
  border: none;
  cursor: pointer;
  outline: none;
}

.hamburger span {
  width: 25px;
  height: 3px;
  background: white;
}

@media (max-width: 768px) {
  .hamburger {
    display: flex;
  }

  .nav {
    display: none;
    flex-direction: column;
    background-color: rgba(0, 0, 0, 0.8);
    position: absolute;
    top: 80px;
    right: 20px;
    padding: 20px;
    border-radius: 5px;
  }

  .nav.active {
    display: flex;
  }
}
.container h1 {
  text-align: center;
  font-size: 28px;
  margin-bottom: 20px;
  color: #0cc0df;
}
.header-options {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}
.header-options input, .header-options select {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 14px;
}
table {
  width: 100%;
  border-collapse: collapse;
}
table thead {
  color:white;
}
table th, table td {
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
.status-resuelto {
  color: #28a745;
  font-weight: bold;
}
.ticket-details {
  display: none;
  margin-top: 20px;
  background: #f4f4f4;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
.ticket-details h2 {
  font-size: 22px;
  margin-bottom: 10px;
}
.ticket-details p {
  margin: 5px 0;
}
.close-btn {
  text-align: right;
  margin-top: 15px;
}
.close-btn button {
  background-color: #d9534f;
  color: #fff;
  border: none;
  padding: 10px 15px;
  border-radius: 5px;
  cursor: pointer;
}
.close-btn button:hover {
  background-color: #c9302c;
}

input::placeholder {
  color: white;
}

input{
  color: white;
}

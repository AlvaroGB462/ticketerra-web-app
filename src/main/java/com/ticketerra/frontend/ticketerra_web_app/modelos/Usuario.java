package com.ticketerra.frontend.ticketerra_web_app.modelos;

public class Usuario {

	private String correo;
	private String nombreCompleto;
	private String contrasena;
	private String tokenRecuperacion;

	// Constructor vacío
	public Usuario() {
	}

	// Constructor con parámetros
	public Usuario(String correo, String nombreCompleto, String contrasena, String tokenRecuperacion) {
		this.correo = correo;
		this.nombreCompleto = nombreCompleto;
		this.contrasena = contrasena;
		this.tokenRecuperacion = tokenRecuperacion;
	}

	// Getter y Setter para correo
	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	// Getter y Setter para nombreCompleto
	public String getNombreCompleto() {
		return nombreCompleto;
	}

	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}

	// Getter y Setter para contrasena
	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	// Getter y Setter para tokenRecuperacion
	public String getTokenRecuperacion() {
		return tokenRecuperacion;
	}

	public void setTokenRecuperacion(String tokenRecuperacion) {
		this.tokenRecuperacion = tokenRecuperacion;
	}

	// Método toString
	@Override
	public String toString() {
		return "Usuario{" + "correo='" + correo + '\'' + ", nombreCompleto='" + nombreCompleto + '\'' + ", contrasena='"
				+ contrasena + '\'' + ", tokenRecuperacion='" + tokenRecuperacion + '\'' + '}';
	}
}

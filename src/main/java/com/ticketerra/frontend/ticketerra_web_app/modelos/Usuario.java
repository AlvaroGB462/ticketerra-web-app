package com.ticketerra.frontend.ticketerra_web_app.modelos;

public class Usuario {

    private Long id;
    private String correo;
    private String nombreCompleto;
    private String contrasena;
    private String tokenConfirmacion;
    private Boolean activo = false;
    private String tokenRecuperacion;
    private String rol = "user";
    private String telefono;
    private String codigoPostal;
    private Long fechaRegistro;

    // Constructor vacío
    public Usuario() {
        this.activo = false;
        this.rol = "user";
    }

    // Constructor con parámetros
    public Usuario(Long id, String correo, String nombreCompleto, String contrasena, String tokenConfirmacion, Boolean activo, String tokenRecuperacion, String rol, String telefono, String codigoPostal, Long fechaRegistro) {
        this.id = id;
        this.correo = correo;
        this.nombreCompleto = nombreCompleto;
        this.contrasena = contrasena;
        this.tokenConfirmacion = tokenConfirmacion;
        this.activo = activo;
        this.tokenRecuperacion = tokenRecuperacion;
        this.rol = rol;
        this.telefono = telefono;
        this.codigoPostal = codigoPostal;
        this.fechaRegistro = fechaRegistro;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getTokenConfirmacion() {
        return tokenConfirmacion;
    }

    public void setTokenConfirmacion(String tokenConfirmacion) {
        this.tokenConfirmacion = tokenConfirmacion;
    }

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public String getTokenRecuperacion() {
        return tokenRecuperacion;
    }

    public void setTokenRecuperacion(String tokenRecuperacion) {
        this.tokenRecuperacion = tokenRecuperacion;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public Long getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Long fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "id=" + id +
                ", correo='" + correo + '\'' +
                ", nombreCompleto='" + nombreCompleto + '\'' +
                ", contrasena='" + contrasena + '\'' +
                ", tokenConfirmacion='" + tokenConfirmacion + '\'' +
                ", activo=" + activo +
                ", tokenRecuperacion='" + tokenRecuperacion + '\'' +
                ", rol='" + rol + '\'' +
                ", telefono='" + telefono + '\'' +
                ", codigoPostal='" + codigoPostal + '\'' +
                ", fechaRegistro=" + fechaRegistro +
                '}';
    }
}

package com.ticketerra.frontend.ticketerra_web_app.servicios;

import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ticketerra.frontend.ticketerra_web_app.modelos.Usuario;

@Service
public class RegistroServicio {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private RestTemplate restTemplate;

    private final String API_URL = "http://localhost:8081/api/usuarios";

    // Almacenamiento temporal de usuarios no confirmados
    private ConcurrentHashMap<String, Usuario> usuariosPendientes = new ConcurrentHashMap<>();

    public String registrarUsuario(Usuario usuario) {
        // Encriptar la contraseña antes de guardarla temporalmente
        usuario.setContrasena(new BCryptPasswordEncoder().encode(usuario.getContrasena()));

        // Asignar valores por defecto si no se proporcionan
        if (usuario.getRol() == null) {
            usuario.setRol("user");  // Asignar rol por defecto
        }
        if (usuario.getTelefono() == null) {
            usuario.setTelefono("000000000");  // Teléfono por defecto (si no se proporciona)
        }
        if (usuario.getCodigoPostal() == null) {
            usuario.setCodigoPostal("00000");  // Código postal por defecto (si no se proporciona)
        }
        if (usuario.getFechaRegistro() == null) {
            usuario.setFechaRegistro(System.currentTimeMillis());  // Fecha de registro por defecto
        }

        // Generar token de confirmación
        String token = UUID.randomUUID().toString();
        usuario.setTokenConfirmacion(token);
        usuario.setActivo(false);

        // Guardar temporalmente el usuario sin insertarlo en la base de datos
        usuariosPendientes.put(token, usuario);

        // Generar el enlace de confirmación
        String enlaceConfirmacion = "http://localhost:9094/usuarios/confirmar?token=" + token;

        // Enviar correo de confirmación
        enviarCorreo(usuario.getCorreo(), "Confirmación de cuenta",
                "Haz clic en el siguiente enlace para activar tu cuenta: " + enlaceConfirmacion);

        return "Registro iniciado. Revisa tu correo para confirmar la cuenta.";
    }


    // Método para enviar correo de confirmación
    private void enviarCorreo(String destinatario, String asunto, String mensaje) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(destinatario);
        mailMessage.setSubject(asunto);
        mailMessage.setText(mensaje);

        try {
            mailSender.send(mailMessage);
            System.out.println("Correo enviado a: " + destinatario);
        } catch (Exception e) {
            System.out.println("Error al enviar el correo: " + e.getMessage());
        }
    }

    // Método para confirmar la cuenta
    public String confirmarCuenta(String token) {
        // Verificar si el token existe en la lista de usuarios pendientes
        if (!usuariosPendientes.containsKey(token)) {
            return "Error: Token inválido o expirado.";
        }

        // Obtener el usuario desde la lista de pendientes
        Usuario usuario = usuariosPendientes.remove(token);

        // Enviar el usuario a la base de datos
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Usuario> entity = new HttpEntity<>(usuario, headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(API_URL + "/registro", HttpMethod.POST, entity,
                    String.class);
            return "Cuenta activada correctamente. Ahora puedes iniciar sesión.";
        } catch (Exception e) {
            return "Error al activar la cuenta.";
        }
    }
}

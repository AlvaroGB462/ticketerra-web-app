package com.ticketerra.frontend.ticketerra_web_app.servicios;

import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ticketerra.frontend.ticketerra_web_app.modelos.Usuario;

@Service
public class LoginServicio {

    private final RestTemplate restTemplate;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    private final JavaMailSender javaMailSender;

    private final String API_URL = "http://localhost:8081/api/usuarios/login"; // API base URL

    public LoginServicio(RestTemplate restTemplate, JavaMailSender javaMailSender) {
        this.restTemplate = restTemplate;
        this.javaMailSender = javaMailSender;
    }

    public boolean autenticarUsuario(String correo, String contrasenaIngresada) {
        try {
            // Crear el cuerpo de la petición
            Map<String, String> request = Map.of("correo", correo);

            // Enviar petición a la API
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, String>> entity = new HttpEntity<>(request, headers);

            ResponseEntity<Usuario> response = restTemplate.exchange(API_URL, HttpMethod.POST, entity, Usuario.class);

            if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                Usuario usuario = response.getBody();

                // Comparar la contraseña ingresada con la encriptada en la BD
                return passwordEncoder.matches(contrasenaIngresada, usuario.getContrasena());
            }
        } catch (Exception e) {
            System.out.println("Error en autenticación: " + e.getMessage());
        }
        return false;
    }

 // Recuperar la contraseña (enviar correo con el token)
    public String recuperarContrasena(String correo) {
        Usuario usuario = new Usuario();
        usuario.setCorreo(correo);

        // Enviar solicitud para generar el token en la API
        ResponseEntity<String> response = restTemplate.postForEntity("http://localhost:8081/api/usuarios/recuperar", usuario, String.class);

        // Verificar si el token se generó correctamente
        if (response.getStatusCode() == HttpStatus.OK) {
            String token = response.getBody(); // Recibimos el token en la respuesta

            // Enviar el correo con el token
            String asunto = "Recuperación de contraseña";
            String mensaje = "Para restablecer tu contraseña, utiliza el siguiente token: " + token;

            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(correo);
            mailMessage.setSubject(asunto);
            mailMessage.setText(mensaje);

            try {
                javaMailSender.send(mailMessage);
                return "Correo enviado con éxito.";
            } catch (Exception e) {
                return "Error al enviar el correo: " + e.getMessage();
            }
        } else {
            return "Error al generar el token.";
        }
    }

    // Restablecer la contraseña
    public String restablecerContrasena(String token, String nuevaContrasena) {
        // Corregir la URL añadiendo el protocolo http://
        String url = "http://localhost:8081/api/usuarios/restablecer?token=" + token + "&nuevaContrasena=" + nuevaContrasena;
        ResponseEntity<String> response = restTemplate.postForEntity(url, null, String.class);
        return response.getBody();
    }
}

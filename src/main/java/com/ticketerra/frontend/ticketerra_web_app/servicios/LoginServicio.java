package com.ticketerra.frontend.ticketerra_web_app.servicios;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class LoginServicio {

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private JavaMailSender mailSender;

    private final String API_URL = "http://localhost:8081/api/usuarios";
    private final String FRONTEND_URL = "http://localhost:9094/usuarios";
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public boolean autenticarUsuario(String correo, String contrasenaIngresada) {
        try {
            Map<String, String> request = Map.of("correo", correo);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, String>> entity = new HttpEntity<>(request, headers);

            ResponseEntity<Map> response = restTemplate.exchange(API_URL + "/login", HttpMethod.POST, entity, Map.class);

            if (response.getStatusCode() == HttpStatus.OK) {
                String contrasenaEncriptada = (String) response.getBody().get("contrasena");

                if (passwordEncoder.matches(contrasenaIngresada, contrasenaEncriptada)) {
                    actualizarEstadoActivo(correo, true);
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    public String obtenerRolUsuario(String correo, String contrasenaIngresada) {
        try {
            Map<String, String> request = Map.of("correo", correo);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, String>> entity = new HttpEntity<>(request, headers);

            ResponseEntity<Map> response = restTemplate.exchange(API_URL + "/login", HttpMethod.POST, entity, Map.class);

            if (response.getStatusCode() == HttpStatus.OK) {
                String contrasenaEncriptada = (String) response.getBody().get("contrasena");
                String rol = (String) response.getBody().get("rol");

                if (passwordEncoder.matches(contrasenaIngresada, contrasenaEncriptada)) {
                    return rol;
                }
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    public void actualizarEstadoActivo(String correo, boolean activo) {
        Map<String, Object> request = Map.of("correo", correo, "activo", activo);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(request, headers);

        try {
            restTemplate.exchange(API_URL + "/activar/" + correo, HttpMethod.PUT, entity, Void.class);
        } catch (Exception e) {
            System.out.println("Error al actualizar el estado activo: " + e.getMessage());
        }
    }
    
    public void actualizarEstadoAinactivo(String correo, boolean activo) {
        Map<String, Object> request = Map.of("correo", correo, "activo", activo);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(request, headers);

        try {
            restTemplate.exchange(API_URL + "/desactivar/" + correo, HttpMethod.PUT, entity, Void.class);
        } catch (Exception e) {
            System.out.println("Error al actualizar el estado activo: " + e.getMessage());
        }
    }

    public String recuperarContrasena(String correo) {
        String token = UUID.randomUUID().toString();
        String urlRestablecer = FRONTEND_URL + "/restablecer/" + token;
        String cuerpoCorreo = "Usa el siguiente enlace para restablecer tu contraseña: " + urlRestablecer;

        enviarCorreo(correo, "Recuperación de contraseña", cuerpoCorreo);

        Map<String, String> request = Map.of("correo", correo, "token", token);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, String>> entity = new HttpEntity<>(request, headers);

        try {
            ResponseEntity<Map> response = restTemplate.exchange(API_URL + "/guardarToken", HttpMethod.POST, entity, Map.class);
            if (response.getStatusCode() == HttpStatus.OK) {
                return "Correo enviado con éxito. Revisa tu bandeja de entrada.";
            } else {
                return "Error al enviar el correo.";
            }
        } catch (Exception e) {
            return "Error al guardar el token en la base de datos.";
        }
    }

    public String restablecerContrasena(String token, String nuevaContrasena) {
        Map<String, String> request = Map.of("token", token, "nuevaContrasena", nuevaContrasena);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, String>> entity = new HttpEntity<>(request, headers);

        try {
            ResponseEntity<Map> response = restTemplate.exchange(API_URL + "/restablecer", HttpMethod.POST, entity, Map.class);
            return response.getStatusCode() == HttpStatus.OK ? "Contraseña restablecida exitosamente." : "Error al restablecer la contraseña.";
        } catch (Exception e) {
            return "Error al restablecer la contraseña: " + e.getMessage();
        }
    }

    private void enviarCorreo(String correo, String asunto, String cuerpo) {
        SimpleMailMessage mensaje = new SimpleMailMessage();
        mensaje.setTo(correo);
        mensaje.setSubject(asunto);
        mensaje.setText(cuerpo);

        try {
            mailSender.send(mensaje);
            System.out.println("Correo enviado con éxito a: " + correo);
        } catch (Exception e) {
            System.err.println("Error al enviar correo: " + e.getMessage());
        }
    }
}

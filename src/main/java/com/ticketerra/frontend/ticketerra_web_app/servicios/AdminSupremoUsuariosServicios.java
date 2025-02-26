package com.ticketerra.frontend.ticketerra_web_app.servicios;

import java.util.Arrays;

import java.util.List;
import java.util.Collections;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.client.HttpClientErrorException;

import com.ticketerra.frontend.ticketerra_web_app.modelos.Usuario;

@Service
public class AdminSupremoUsuariosServicios {

    private final RestTemplate restTemplate;
    private final String API_URL = "http://localhost:8081/api/usuarios";

    public AdminSupremoUsuariosServicios(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public List<Usuario> obtenerUsuarios() {
        try {
        	Usuario[] usuarios = restTemplate.getForObject(API_URL + "/lista", Usuario[].class);
            if (usuarios != null) {
                System.out.println("Usuarios obtenidos en el servicio de la capa web: " + Arrays.toString(usuarios));
            }
            return (usuarios != null) ? Arrays.asList(usuarios) : Collections.emptyList();
        } catch (HttpClientErrorException e) {
            System.err.println("Error al obtener usuarios: " + e.getMessage());
            return Collections.emptyList();
        }
    }


    public void eliminarUsuario(String correo) {
        try {
            restTemplate.delete(API_URL + "/eliminar?correo=" + correo);
        } catch (HttpClientErrorException e) {
            System.err.println("Error al eliminar usuario: " + e.getMessage());
        }
    }
}
package com.ticketerra.frontend.ticketerra_web_app.controladores;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ticketerra.frontend.ticketerra_web_app.modelos.Usuario;
import com.ticketerra.frontend.ticketerra_web_app.servicios.AdminSupremoUsuariosServicios;

@Controller
@RequestMapping("/adminSupremoUsuarios")
public class AdminSupremoUsuariosControlador {

    private final AdminSupremoUsuariosServicios adminSupremoUsuariosServicios;

    public AdminSupremoUsuariosControlador(AdminSupremoUsuariosServicios adminSupremoUsuariosServicios) {
        this.adminSupremoUsuariosServicios = adminSupremoUsuariosServicios;
    }

    @GetMapping
    public String listarUsuarios(Model model) {
        List<Usuario> usuarios = adminSupremoUsuariosServicios.obtenerUsuarios();
        System.out.println("Usuarios obtenidos en el controlador de la capa web: " + usuarios);

        if (usuarios == null || usuarios.isEmpty()) {
            usuarios = new ArrayList<>();
        }

        model.addAttribute("usuarios", usuarios);
        return "adminSupremoUsuarios"; // Nombre de la vista donde se renderizan los usuarios
    }

    @PostMapping("/eliminar")
    @ResponseBody
    public String eliminarUsuario(@RequestParam("correo") String correo) {
        try {
            adminSupremoUsuariosServicios.eliminarUsuario(correo);
            return "Usuario eliminado correctamente.";
        } catch (Exception e) {
            return "Error al eliminar usuario: " + e.getMessage(); // Añadimos el mensaje de error
        }
    }
}

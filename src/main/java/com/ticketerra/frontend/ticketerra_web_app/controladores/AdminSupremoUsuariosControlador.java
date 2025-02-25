package com.ticketerra.frontend.ticketerra_web_app.controladores;

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
@RequestMapping("/usuarios")
public class AdminSupremoUsuariosControlador {

    private final AdminSupremoUsuariosServicios adminSupremoUsuariosServicios;

    public AdminSupremoUsuariosControlador(AdminSupremoUsuariosServicios adminSupremoUsuariosServicios) {
        this.adminSupremoUsuariosServicios = adminSupremoUsuariosServicios;
    }
    
    // Página para adminSupremo
    @GetMapping("/adminSupremoUsuarios")
    public String adminSupremoDashboard() {
        return "adminSupremoUsuarios";
    }

    @GetMapping("/lista")
    public String listarUsuarios(Model model) {
        List<Usuario> usuarios = adminSupremoUsuariosServicios.obtenerUsuarios();
        
        System.out.println("Usuarios obtenidos en la capa web: " + usuarios);

        model.addAttribute("usuarios", usuarios);
        return "adminSupremoUsuarios";
    }

    @PostMapping("/eliminar")
    @ResponseBody
    public String eliminarUsuario(@RequestParam("correo") String correo) {
        try {
            adminSupremoUsuariosServicios.eliminarUsuario(correo);
            return "Usuario eliminado correctamente.";
        } catch (Exception e) {
            return "Error al eliminar usuario: " + e.getMessage();
        }
    }
}

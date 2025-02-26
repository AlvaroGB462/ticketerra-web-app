package com.ticketerra.frontend.ticketerra_web_app.controladores;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ticketerra.frontend.ticketerra_web_app.modelos.Usuario;
import com.ticketerra.frontend.ticketerra_web_app.servicios.AdminSupremoUsuariosServicios;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/usuarios")
public class AdminSupremoUsuariosControlador {

    private final AdminSupremoUsuariosServicios adminSupremoUsuariosServicios;

    public AdminSupremoUsuariosControlador(AdminSupremoUsuariosServicios adminSupremoUsuariosServicios) {
        this.adminSupremoUsuariosServicios = adminSupremoUsuariosServicios;
    }

    @GetMapping("/adminSupremoUsuarios")
    public ModelAndView adminSupremoDashboard(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        // Obtener el rol de la sesión
        String rolUsuario = (String) session.getAttribute("rolUsuario");

        // Si el usuario no tiene el rol adecuado, redirigirlo a la página principal
        if (rolUsuario == null || !rolUsuario.equals("adminSupremo")) {
            modelAndView.setViewName("redirect:/usuarios/index");
        } else {
            modelAndView.setViewName("adminSupremoUsuarios");
        }

        return modelAndView;
    }

    @GetMapping("/lista")
    public String listarUsuarios(Model model, HttpSession session) {
        // Verificar si el usuario tiene permisos de adminSupremo
        String rolUsuario = (String) session.getAttribute("rolUsuario");

        if (rolUsuario == null || !rolUsuario.equals("adminSupremo")) {
            return "redirect:/usuarios/index"; // Redirigir si no es adminSupremo
        }

        List<Usuario> usuarios = adminSupremoUsuariosServicios.obtenerUsuarios();
        model.addAttribute("usuarios", usuarios);

        return "adminSupremoUsuarios";
    }

    @PostMapping("/eliminar")
    @ResponseBody
    public String eliminarUsuario(@RequestParam("correo") String correo, HttpSession session) {
        // Verificar si el usuario tiene permisos de adminSupremo
        String rolUsuario = (String) session.getAttribute("rolUsuario");

        if (rolUsuario == null || !rolUsuario.equals("adminSupremo")) {
            return "No tienes permisos para eliminar usuarios.";
        }

        try {
            adminSupremoUsuariosServicios.eliminarUsuario(correo);
            return "Usuario eliminado correctamente.";
        } catch (Exception e) {
            return "Error al eliminar usuario: " + e.getMessage();
        }
    }
}

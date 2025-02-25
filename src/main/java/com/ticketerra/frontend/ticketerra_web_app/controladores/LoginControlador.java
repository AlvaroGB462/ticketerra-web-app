package com.ticketerra.frontend.ticketerra_web_app.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ticketerra.frontend.ticketerra_web_app.servicios.LoginServicio;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/usuarios")
public class LoginControlador {

    @Autowired
    private LoginServicio loginServicio;

    // Página de login
    @GetMapping("/login")
    public String loginForm() {
        return "login"; // Vista del formulario de login
    }

    // Manejo de autenticación
    @PostMapping("/login")
    public String autenticarUsuario(@RequestParam String correo, @RequestParam String contrasena, HttpSession session, Model model) {
        String rolUsuario = loginServicio.obtenerRolUsuario(correo, contrasena);

        if (rolUsuario != null) {
            session.setAttribute("usuario", correo);
            session.setAttribute("rol", rolUsuario);

            // Actualizar estado activo a true cuando inicia sesión
            loginServicio.actualizarEstadoActivo(correo, true);

            // Redirigir según el rol
            if ("adminSupremo".equals(rolUsuario)) {
                return "redirect:/usuarios/adminSupremoUsuarios";
            } else {
                return "redirect:/usuarios/index";
            }
        } else {
            model.addAttribute("mensaje", "Correo o contraseña incorrectos.");
            return "login";
        }
    }


    // Cerrar sesión
    @GetMapping("/logout")
    public String cerrarSesion(HttpSession session) {
        String correo = (String) session.getAttribute("usuario");

        if (correo != null) {
            // Cambiar estado activo a false cuando el usuario cierra sesión
            loginServicio.actualizarEstadoAinactivo(correo, false);
        }

        session.invalidate();
        return "redirect:/usuarios/index";
    }

    // Página de recuperación de contraseña
    @GetMapping("/recuperar")
    public String mostrarFormularioRecuperar() {
        return "recuperar"; // Vista para el formulario de recuperación de contraseña
    }

    // Acción de recuperar contraseña (envía el correo con el token)
    @PostMapping("/recuperar")
    public String recuperarContrasena(@RequestParam String correo, Model model) {
        String mensaje = loginServicio.recuperarContrasena(correo); // Recuperamos el token
        model.addAttribute("mensaje", mensaje); // Se muestra un mensaje sobre el éxito o error
        return "recuperar"; // Vista de recuperación, muestra el mensaje
    }

    // Página para restablecer la contraseña
    @GetMapping("/restablecer/{token}")
    public String mostrarFormularioRestablecer(@PathVariable String token, Model model) {
        model.addAttribute("token", token);
        return "restablecer"; // Vista para restablecer la contraseña
    }

    // Acción para restablecer la contraseña
    @PostMapping("/restablecer")
    public String restablecerContrasena(@RequestParam String token, @RequestParam String nuevaContrasena, Model model) {
        String mensaje = loginServicio.restablecerContrasena(token, nuevaContrasena);
        model.addAttribute("mensaje", mensaje);
        return "index"; // Redirige a la página principal después de restablecer
    }
}

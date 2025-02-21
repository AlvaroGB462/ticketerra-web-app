package com.ticketerra.frontend.ticketerra_web_app.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ticketerra.frontend.ticketerra_web_app.modelos.Usuario;
import com.ticketerra.frontend.ticketerra_web_app.servicios.RegistroServicio;

@Controller
@RequestMapping("/usuarios")
public class RegistroControlador {

    @Autowired
    private RegistroServicio registroServicio;

    // Página del formulario de registro
    @GetMapping("/registrar")
    public String formularioRegistro() {
        return "registrar";
    }

    // Procesar el registro del usuario
    @PostMapping("/registrar")
    public String registrarUsuario(@ModelAttribute Usuario usuario, Model model) {
        String mensaje = registroServicio.registrarUsuario(usuario);
        model.addAttribute("mensaje", mensaje);
        return "registrar"; 
    }

    // Confirmación de cuenta
    @GetMapping("/confirmar")
    public String confirmarCuenta(@RequestParam("token") String token, Model model) {
        String mensaje = registroServicio.confirmarCuenta(token);
        model.addAttribute("mensaje", mensaje);
        return "login"; 
    }
}

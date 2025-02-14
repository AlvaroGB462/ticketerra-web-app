package com.ticketerra.frontend.ticketerra_web_app.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/usuarios")
public class LoginControlador {

	@GetMapping("/login")
    public ModelAndView loginForm() {
        ModelAndView mav = new ModelAndView("login");
        mav.addObject("mensaje", "Por favor, ingrese sus credenciales");
        return mav;
    }
}

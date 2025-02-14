package com.ticketerra.frontend.ticketerra_web_app.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class InicioControlador {

    @GetMapping("/")
    public String redirectToIndex() {
        return "redirect:/usuarios/index";
    }

    @GetMapping("/index")
    public ModelAndView loginForm() {
        return new ModelAndView("index");
    }
}


package com.ticketerra.frontend.ticketerra_web_app.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ticketerra.frontend.ticketerra_web_app.servicios.LoginServicio;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/usuarios")
public class LoginControlador {

	@Autowired
	private LoginServicio loginServicio;

	@GetMapping("/login")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}

	@PostMapping("/login")
	public ModelAndView autenticarUsuario(@RequestParam String correo, @RequestParam String contrasena,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (loginServicio.autenticarUsuario(correo, contrasena)) {
			session.setAttribute("usuario", correo);
			mav.setViewName("redirect:/usuarios/index");
		} else {
			mav.setViewName("login");
			mav.addObject("mensaje", "Correo o contraseña incorrectos.");
		}
		return mav;
	}

	@GetMapping("/logout")
	public String cerrarSesion(HttpSession session) {
		session.invalidate();
		return "redirect:/usuarios/login";
	}

	// Página de recuperar contraseña
	@GetMapping("/recuperar")
	public String mostrarFormularioRecuperar() {
		return "recuperar"; // Vista JSP de recuperación
	}

	// Recuperar la contraseña
	@PostMapping("/recuperar")
	public String recuperarContrasena(@RequestParam String correo, Model model) {
		String mensaje = loginServicio.recuperarContrasena(correo);
		model.addAttribute("mensaje", mensaje);
		return "recuperar"; // Volver a mostrar la vista con el mensaje
	}

	// Página de restablecer contraseña (cuando se hace clic en el enlace del
	// correo)
	@GetMapping("/restablecer/{token}")
	public String mostrarFormularioRestablecer(@PathVariable String token, Model model) {
		model.addAttribute("token", token);
		return "restablecer"; // Vista JSP de restablecimiento
	}

	// Restablecer la contraseña
	@PostMapping("/restablecer")
	public String restablecerContrasena(@RequestParam String token, @RequestParam String nuevaContrasena, Model model) {
		String mensaje = loginServicio.restablecerContrasena(token, nuevaContrasena);
		model.addAttribute("mensaje", mensaje);
		return "restablecer"; // Volver a mostrar la vista con el mensaje
	}
}

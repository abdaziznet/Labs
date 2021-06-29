package dev.abdaziz.belajarspringangularweb.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

    @RequestMapping("/hello")
    public void sayHello(Model model) {
        model.addAttribute("message", "Welcome to Spring Boot");
        System.out.println("Saying Hello world...");

    }
}

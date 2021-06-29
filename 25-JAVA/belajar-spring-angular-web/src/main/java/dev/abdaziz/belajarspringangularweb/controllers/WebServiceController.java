package dev.abdaziz.belajarspringangularweb.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WebServiceController {

    @GetMapping("/rest")
    public String takeRest() {
        return "Rest is only necessary - Not a goal!";
    }
}

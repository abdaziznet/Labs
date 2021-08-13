package net.abdaziz.demoherokujava8.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/catalog")
public class CatalogController {
    @GetMapping("/")
    public String GetCatalog()
    {
        return  "Hello World";
    }
}

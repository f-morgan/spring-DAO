package ru.fadeeva.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.fadeeva.service.Service;

@RestController
public class Controller {
    @Autowired
    Service service;

    @GetMapping("/products/fetch-product")
    public String getProductName(@RequestParam String name) {
        return service.getProductName(name);
    }
}

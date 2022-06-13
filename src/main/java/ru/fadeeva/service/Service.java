package ru.fadeeva.service;

import org.springframework.beans.factory.annotation.Autowired;
import ru.fadeeva.repository.MyRepository;

@org.springframework.stereotype.Service
public class Service {
    @Autowired
    MyRepository repository;

    public String getProductName(String name) {
        return repository.getProductName(name);
    }
}

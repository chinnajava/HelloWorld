package com.test;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloWorld {

    @RequestMapping("/")
    public String index() {
        return "Hello from Spring Boot!";
    }

}
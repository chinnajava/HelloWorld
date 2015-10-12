package com.test;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloWorld {

    @RequestMapping("/")
    public String index(@RequestParam(value="name", defaultValue = "JAVA") String name) {
        return "Hello " + name + " from Spring Boot! ";
    }

}
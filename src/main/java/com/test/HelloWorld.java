package com.test;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloWorld {

    @RequestMapping("/")
    public Greeting index(@RequestParam(value="name", defaultValue = "JAVA") String name) {
        return new Greeting(name,"Hello " + name + " from Spring Boot!");
    }
}

 class Greeting {

    private final String param;
    private final String content;

    public Greeting(String param, String content) {
        this.param = param;
        this.content = content;

    }

    public String getParam() {
        return param;
    }

    public String getContent() {
        return content;
    }
}
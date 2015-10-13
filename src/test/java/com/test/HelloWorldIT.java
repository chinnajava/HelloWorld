package com.test;

import static com.jayway.restassured.RestAssured.when;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertThat;

import java.net.URL;

import com.jayway.restassured.RestAssured;
import org.apache.http.HttpStatus;
import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.IntegrationTest;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.boot.test.TestRestTemplate;
import org.springframework.boot.test.WebIntegrationTest;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.client.RestTemplate;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = DemoApplication.class)
@WebAppConfiguration
@IntegrationTest({"server.port=0"})
public class HelloWorldIT {

    @Value("${local.server.port}")
    private int port;

    private RestTemplate template;


    @Before
    public void setUp() throws Exception {
        template = new TestRestTemplate();
        RestAssured.port = port;

    }
    @Test
    public void testDefaultValue() {
        when().
                get("/").
                then().
                statusCode(HttpStatus.SC_OK).
                body("param", Matchers.is("JAVA")).
                body("content", Matchers.is("Hello JAVA from Spring Boot!"));
    }
    @Test
    public void testParamValue() {
        when().
                get("/?name=chi").
                then().
                statusCode(HttpStatus.SC_OK).
                body("param", Matchers.is("chi")).
                body("content", Matchers.is("Hello chi from Spring Boot!"));
    }
}
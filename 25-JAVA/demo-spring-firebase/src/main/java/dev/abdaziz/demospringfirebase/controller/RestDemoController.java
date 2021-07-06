package dev.abdaziz.demospringfirebase.controller;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import dev.abdaziz.demospringfirebase.model.Person;
import dev.abdaziz.demospringfirebase.service.FirebaseService;

@RestController
public class RestDemoController {
    @Autowired
    FirebaseService firebaseService;

    @GetMapping("/getUserDetails")
    public Person getUserDetails(@RequestHeader String name) throws InterruptedException, ExecutionException {
        return firebaseService.getUserDetails(name);
    }

    @PostMapping("/createUser")
    public String postExample(@RequestBody Person person) throws InterruptedException, ExecutionException {
        return firebaseService.saveUserDetails(person);
    }

    @PutMapping("/updateUser")
    public String updateUser(@RequestBody Person person) {
        return "Updated user " + person.getName();
    }

    @DeleteMapping("/deleteUser")
    public String deleteUser(@RequestHeader String name) throws InterruptedException, ExecutionException {
        return firebaseService.deleteUser(name);
    }

}

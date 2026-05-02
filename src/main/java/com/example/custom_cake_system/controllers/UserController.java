package com.example.custom_cake_system.controllers;

import DTOs.UserDTO;
import com.example.custom_cake_system.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import models.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/user")
@Controller
public class UserController {

    HttpServletRequest request;

    @Autowired
    UserService userService;

    public UserController(HttpServletRequest request) {
        this.request = request;
    }

    @GetMapping("/login")
    public String login(){
        return "user/login";
    }

    @GetMapping("/signup")
    public String signup(){
        return "user/signup";
    }

    @PostMapping("/perform_signup")
    public String signup(@RequestParam String username,
                         @RequestParam String email,
                         @RequestParam String address,
                         @RequestParam String phone,
                         @RequestParam String password) throws ServletException {

        Response response = userService.registerUser(new UserDTO(0, password,username, false, email, address, phone));
        if(!response.status){
            return "redirect:/user/signup?error=exists";
        }
        request.login(username, password);
        return "redirect:/home";
    }
}

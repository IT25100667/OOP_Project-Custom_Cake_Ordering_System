package com.example.custom_cake_system.services;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
public class CookieServices {


    Authentication user = SecurityContextHolder.getContext().getAuthentication();

    public String isEmployee(){
        return user.getAuthorities().stream().map(r -> r.getAuthority())
                .toList().get(0);
    }

    public String getUsername(){
        return user.getName();
    }
}

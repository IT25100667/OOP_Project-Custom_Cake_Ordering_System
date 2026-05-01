package com.example.custom_cake_system.services;
import DTOs.UserDTO;
import com.example.custom_cake_system.data_access.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    UsersRepository repo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {


        UserDTO user = repo.getUserDetails(username, true);
        if(user==null){
            throw new UsernameNotFoundException("User not found: " + username);
        }

        return org.springframework.security.core.userdetails.User
                .withUsername(user.username)
                .password(user.getPassword())
                .roles(String.valueOf(user.employee ? 1:0))
                .build();
    }


}

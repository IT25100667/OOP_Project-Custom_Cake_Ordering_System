package com.example.custom_cake_system.controllers;
import com.example.custom_cake_system.data_access.ProductsRepository;
import DTOs.ProductDTO;
import DTOs.UserDTO;
import com.example.custom_cake_system.data_access.UsersRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@RequestMapping("/products")
@Controller
public class ProductsController {


    private ProductsRepository productsRepository;
    private UsersRepository usersRepository;

    public ProductsController(ProductsRepository productsRepository, UsersRepository usersRepository) {
        this.productsRepository = productsRepository;
        this.usersRepository = usersRepository;
    }

    @GetMapping({"","/hello"})
    public String getUsers(Model model){
        List<UserDTO> userDetails = usersRepository.getAllUsers();
        model.addAttribute("users", userDetails);
        return "products/index";
    }

    @GetMapping("/products")
    public String getProducts(Model model){
        List<ProductDTO> products = productsRepository.getProducts();
        model.addAttribute("products", products);
        return "products/products";

    }
}

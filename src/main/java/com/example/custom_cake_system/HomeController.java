package com.example.custom_cake_system;
import com.example.custom_cake_system.data_access.ProductsRepository;
import DTOs.ProductDTO;
import DTOs.UserDTO;
import com.example.custom_cake_system.data_access.UsersRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@RequestMapping({"","/"})
@Controller
public class HomeController {


    private ProductsRepository productsRepository;
    private UsersRepository usersRepository;

    public HomeController(ProductsRepository productsRepository, UsersRepository usersRepository) {
        this.productsRepository = productsRepository;
        this.usersRepository = usersRepository;
    }


    @GetMapping({"/home","","/"})
    public String Home(Model model){
        List<ProductDTO> products = productsRepository.getProducts();
        model.addAttribute("products", products);
        return "home/index";
    }

    @GetMapping({"/about","/about/"})
    public String About(Model model){
        return "home/about";
    }
}

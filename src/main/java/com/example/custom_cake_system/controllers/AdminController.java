package com.example.custom_cake_system.controllers;

import com.example.custom_cake_system.data_access.OrdersRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.stream.Collectors;

@RequestMapping("/admin")
@Controller()
public class AdminController {

    private OrdersRepository ordersRepository;

    public AdminController(OrdersRepository ordersRepository) {
        this.ordersRepository = ordersRepository;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model){

        var orders = ordersRepository.getOrdersWithoutCustomOrderDetails();
        model.addAttribute("orders",orders);
        model.addAttribute("totalPrice", orders.stream().mapToDouble(obj-> obj.getTotalPrice()).sum());
        return "admin/dashboard";
    }
}

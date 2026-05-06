package com.example.custom_cake_system.controllers;
import com.example.custom_cake_system.data_access.OrdersRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/order")
@Controller
public class OrderController {

    OrdersRepository repository;

    public OrderController(OrdersRepository repository) {
        this.repository = repository;
    }

    @PostMapping("/updateOrderStatus")
    public void updateOrderStatus(@RequestParam int orderId, @RequestParam String orderStatus){
        repository.updateOrderStatus(orderId, orderStatus);
    }
}

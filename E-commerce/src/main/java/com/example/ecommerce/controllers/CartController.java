package com.example.ecommerce.controllers;

import com.example.ecommerce.models.Cart;
import com.example.ecommerce.models.Product;
import com.example.ecommerce.models.User;
import com.example.ecommerce.repositories.ProductRepository;
import com.example.ecommerce.repositories.UserRepository;
import com.example.ecommerce.services.CartService;
import com.example.ecommerce.services.ProductService;
import com.example.ecommerce.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;
    private final UserService userService;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    public CartController(CartService cartService, UserService userService) {
        this.cartService = cartService;
        this.userService = userService;
    }

    @GetMapping
    public String viewCart(Principal principal, Model model) {
        User user = userRepository.findByEmail(principal.getName());
        Cart cart = cartService.getCartByUser(user);
        model.addAttribute("cart", cart);
        return "cart";
    }

    @PostMapping("/add/{productId}")
    public String addToCart(Principal principal, @PathVariable Long productId) {
        User user = userRepository.findByEmail(principal.getName());
        Product product = productService.findById(productId);
        cartService.addToCart(user, product);
        return "redirect:/cart";
    }

    @PostMapping("/{id}/remove")
    public String removeFromCart(@PathVariable(value = "id") long id, Principal principal) {
        User user = userRepository.findByEmail(principal.getName());
        cartService.removeFromCart(user, id);
        return "redirect:/cart";
    }

    @PostMapping("/buy")
    public String buyCart(Principal principal, Model model) {
        User user = userRepository.findByEmail(principal.getName());
        Cart cart = cartService.getCartByUser(user);
        model.addAttribute("product", cart.getProducts());
        model.addAttribute("totalPrice", cart.getTotalPrice());
        return "cart-buy";
    }
}

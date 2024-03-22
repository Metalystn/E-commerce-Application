package com.example.ecommerce.services;

import com.example.ecommerce.models.Cart;
import com.example.ecommerce.models.Product;
import com.example.ecommerce.models.User;
import com.example.ecommerce.repositories.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

    private final CartRepository cartRepository;

    @Autowired
    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public Cart getCartByUser(User user) {
        return cartRepository.findByUser(user);
    }

    public void addToCart(User user, Product product) {
        Cart cart = getCartByUser(user);
        if (cart == null) {
            cart = new Cart();
            cart.setUser(user);
        }
        cart.getProducts().add(product);
        cartRepository.save(cart);
    }
    public void removeFromCart(User user, Long productId) {
        Cart cart = getCartByUser(user);
        if (cart != null) {
            cart.getProducts().removeIf(product -> product.getId().equals(productId));
            cartRepository.save(cart);
        }
    }

}

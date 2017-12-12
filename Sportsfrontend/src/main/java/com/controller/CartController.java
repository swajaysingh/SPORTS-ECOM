package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.DAO.CartDao;
import com.DAO.CustomerDao;
import com.model.Cart;
import com.model.Customer;

@Controller
public class CartController {

	@Autowired
	CustomerDao cdao;

	@Autowired
	CartDao cartdao;

	@RequestMapping("/cart/getCartId")
	public String getCartId(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Customer customer = cdao.getCustomerByUsername(username);
		model.addAttribute("cartId", customer.getCart().getCartId());
		return "cart";
	}

	// get cart
	@RequestMapping("/cart/getCart/{cartId}")
	public @ResponseBody Cart getCartItems(@PathVariable(value = "cartId") int cartId) {
		return cartdao.getCartByCartId(cartId);
	}
}


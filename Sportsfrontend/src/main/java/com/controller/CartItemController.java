package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.CartDao;
import com.DAO.CartItemDao;
import com.DAO.CustomerDao;
import com.DAO.ProductDao;
import com.model.Cart;
import com.model.CartItem;
import com.model.Customer;
import com.model.Product;

@Controller
public class CartItemController {

	@Autowired
	CustomerDao cdao;

	@Autowired
	ProductDao productDao;

	@Autowired
	CartItemDao cartItemdao;

	@Autowired
	CartDao cartdao;

	@RequestMapping("/cart/add/{productId}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void addCartItem(@PathVariable(value = "productId") int productId) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Customer customer = cdao.getCustomerByUsername(username);
		Cart cart = customer.getCart();
		List<CartItem> cartItems = cart.getCartItems();

		Product product = productDao.getProduct(productId);
		for (int i = 0; i < cartItems.size(); i++) {
			CartItem cartItem = cartItems.get(i);
			if (product.getProductId() == cartItem.getProduct().getProductId()) {
				cartItem.setQuantity(cartItem.getQuantity() + 1);// increment
																	// the
																	// quantity
				cartItem.setTotalPrice(cartItem.getQuantity() * product.getPrice());// update
																					// the
																					// total
																					// price
				cartItemdao.addCartItem(cartItem);// update the quantity in the
													// cartitem

				return;
			}

		}

		CartItem cartItem = new CartItem();
		cartItem.setQuantity(1);
		cartItem.setProduct(product);// set product id
		cartItem.setTotalPrice(product.getPrice() * 1);
		cartItem.setCart(cart);// set cart id
		cartItemdao.addCartItem(cartItem);// insert query

		// model.addAttribute("cart", cart);

		// return "cart";

	}

	@RequestMapping("/cart/removecartitem/{cartItemId}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public String removeCartItem(@PathVariable(value = "cartItemId") int cartItemId) {
		System.out.println(cartItemId );
		CartItem cartItem = cartItemdao.getCartItem(cartItemId);
		cartItemdao.removeCartItem(cartItem);
		return "redirect:/getTocartAgain";
		
		
		
	}
	
	@RequestMapping("/getTocartAgain")
	public String getCartId(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Customer customer = cdao.getCustomerByUsername(username);
		model.addAttribute("cartId", customer.getCart().getCartId());
		return "cart";
	}

	@RequestMapping("/cart/removeAllItems/{cartId}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeAllCartItem(@PathVariable(value = "cartId") int cartId) {
		Cart cart = cartdao.getCartByCartId(cartId);
		cartItemdao.removeAllCartItems(cart);
	}
}

package com.DAO;

import com.model.Cart;
import com.model.CartItem;

public interface CartItemDao {

	void addCartItem(CartItem cartItem);

	void removeCartItem(CartItem cartItemId);

	void removeAllCartItems(Cart cart);

	CartItem getCartItem(int cartItemId);
}

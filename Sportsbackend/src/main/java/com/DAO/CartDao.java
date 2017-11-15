package com.DAO;

import java.util.List;

import com.model.Cart;

public interface CartDao 
{
	public void insert(Cart cart);
	   public List<Cart> findCartById(String userId);
	   public Cart getCart(int cartId,String usermail);
	   public boolean deleteCart(int cartId);
	   public void updateCart(Cart cart);
	
}

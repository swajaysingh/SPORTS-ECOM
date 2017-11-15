/*package com.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.DAO.CartDao;
import com.DAO.OrdersDao;
import com.DAO.ProductDao;
import com.DAO.UserDao;
import com.model.Cart;
import com.model.Orders;
import com.model.Product;
import com.model.User;

@Controller
public class CartController 
{
	@Autowired
	UserDao userDao;

	@Autowired
	CartDao cartDao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	OrdersDao ordersDao;

	@RequestMapping(value = "/ProductDesc/cart/{productId}",method=RequestMethod.POST)
	public String showCart(@PathVariable("productId")int productId,Model m,HttpServletRequest req)
	{
		Principal principal = req.getUserPrincipal();
		String userId = principal.getName();
		
		User user = userDao.getUserByUserId(userId);
		Product product = productDao.getProduct(productId);
		String cartProductName = product.getProductName();
		Double cartPrice = (double) product.getPrice();
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		Cart cart = new Cart(productId,user,cartPrice,quantity);
		cart.setCartProdName(cartProductName);
		cart.setCartImg(Integer.toString(productId));
		cartDao.insert(cart);
		List<Cart> cart1 = cartDao.findCartById(userId);
		m.addAttribute("cartInfo",cart1);
		return "cart";
	}
	
	@RequestMapping(value = "/shipping")
	public String shipping(Model m,HttpServletRequest req)
	{
		Principal principal = req.getUserPrincipal();
		String userId = principal.getName();
		
		User listUser = userDao.getUserByUserId(userId);
		m.addAttribute("User",listUser);
		List<Cart> listCart = cartDao.findCartById(userId);
		m.addAttribute("Cart",listCart);
		return "checkout";
	}
	
	   @RequestMapping(value = "/invoiceProcess")
	   public String invoice(HttpServletRequest req,@RequestParam("total")Double total,@RequestParam("payment")String payment,Model m)
	   {
		   Principal principal = req.getUserPrincipal();
		   String userId = principal.getName();
		   User user = userDao.getUserByUserId(userId);
		   
		   Orders order = new Orders();
		   order.setPayment(payment);
		   order.setTotal(total);
		   order.setUser(user);
		   ordersDao.addOrders(order);
		   m.addAttribute("userList",user);
		   m.addAttribute("orderList",order);
		   List<Cart> listCart = cartDao.findCartById(userId);
			m.addAttribute("Cart",listCart);
		   return "invoice";
	   }
	   @RequestMapping("/ack")
	   public String ackPage(Model m)
	   {
		   return "ackOrder";
	   }
	   @RequestMapping(value ="/deletePCart/{cartId}")
		public String deleteCart(@PathVariable("cartId")int cartId,Model m,HttpServletRequest req)
		{
			Principal principal = req.getUserPrincipal();
			String userId = principal.getName();
			cartDao.deleteCart(cartId);
			List<Cart> cart1 = cartDao.findCartById(userId);
			m.addAttribute("cartInfo",cart1);
			return "cart";
		}
	
}
*/
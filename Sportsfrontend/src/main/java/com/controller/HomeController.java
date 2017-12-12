package com.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.CartDao;
import com.DAO.CategoryDao;
import com.DAO.CustomerDao;
import com.model.Customer;

/**
 * @author swajay pc
 *
 */
@Controller
public class HomeController {

	@Autowired
	CustomerDao customerDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	CategoryDao categoryDao;

	@RequestMapping("/AdminHome")
	public ModelAndView showAdminHome() {
		ModelAndView mv = new ModelAndView("/AdminHome");
		return mv;
	}

	@RequestMapping("/aboutUs")
	public String aboutUs() {
		return "aboutUs";
	}

	@RequestMapping("/checkout")

	public String checkout(Model m, HttpServletRequest req) {
		Principal principal = req.getUserPrincipal();
		String username = principal.getName();
		Customer listCustomer = customerDao.getCustomerByUsername(username);
		m.addAttribute("Customer", listCustomer);
		return "checkout";
	}

	/*
	 * @RequestMapping("/invoiceProcess")
	 * 
	 * 
	 * public String invoice(Model m, HttpServletRequest req) { Principal
	 * principal = req.getUserPrincipal(); String username =
	 * principal.getName(); Customer listCustomer =
	 * customerDao.getCustomerByUsername(username); m.addAttribute("Customer",
	 * listCustomer);
	 * 
	 * public String invoice(HttpServletRequest req, @RequestParam("payment")
	 * String payment, Model m) { Principal principal = req.getUserPrincipal();
	 * String username = principal.getName(); Customer customer =
	 * customerDao.getCustomerByUsername(username); CustomerOrder order = new
	 * CustomerOrder(); order.setPayment(payment);
	 * customerOrderDao.addCustomerOrder(order); m.addAttribute("Customer",
	 * customer); m.addAttribute("orderList", order); List<Category> list =
	 * categoryDao.retriveCategory(); m.addAttribute("addlist", list);
	 * 
	 * return "invoice"; }
	 */

	@RequestMapping("/ackOrder")

	public String ackpage(Model m) {

		return "ackOrder";
	}

}

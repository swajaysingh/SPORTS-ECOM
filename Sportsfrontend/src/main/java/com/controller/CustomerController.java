package com.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.CustomerDao;
import com.model.BillingAddress;
import com.model.Customer;
import com.model.ShippingAddress;
import com.model.User;

@Controller
public class CustomerController {

	
	@Autowired
	CustomerDao cdao;
	
	// To display registration form
	@RequestMapping(value = "/customer/registration", method = RequestMethod.GET)
	public ModelAndView getRegistrationForm() {
		Customer customer = new Customer();
		User user = new User();

		BillingAddress billingAddress = new BillingAddress();
		ShippingAddress shippingAddress = new ShippingAddress();

		customer.setUser(user);
		customer.setBillingAddress(billingAddress);
		customer.setShippingAddress(shippingAddress);
		return new ModelAndView("registrationCustomer", "customer", customer);

	}

	// to insert the data
	@RequestMapping(value = "/customer/registration", method = RequestMethod.POST)
	public String registerCustomer(@Valid @ModelAttribute(value = "customer") Customer customer, BindingResult result,
			Model model) {
		if (result.hasErrors())
			return "registrationCustomer";

		cdao.addCustomer(customer);
		model.addAttribute("registration success", "Registered Successfully. Login using username and password");
		return "login";
	}
	
}

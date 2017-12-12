package com.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.CustomerDao;
import com.DAO.UserDao;
import com.model.BillingAddress;
import com.model.Customer;
import com.model.ShippingAddress;
import com.model.User;

@Controller
public class UserController {

	@Autowired
	UserDao userDao;

	@Autowired
	CustomerDao cdao;

	// oldcode

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView goToRegister() {

		ModelAndView mav = new ModelAndView();
		mav.addObject("user", new User());
		mav.setViewName("register");
		return mav;
	}

	@RequestMapping(value = "saveRegister", method = RequestMethod.POST)
	public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result) {

		if (result.hasErrors())
			return "register";

		user.setRole("ROLE_USER");
		user.setEnabled(true);
		userDao.insertUser(user);
		// mav.setViewName("index");
		return "login";
	}

	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null)
			model.addAttribute("error", "Invalid username and password... Please enter the correctly");
		if (logout != null)
			model.addAttribute("logout", "logout successfully");

		return "login";
	}

	@RequestMapping("/home")
	public String home() {
		return "home";

	}

	@RequestMapping("/")
	public String slas() {

		return "index";

	}

	@RequestMapping("/index")
	public String indexpage() {

		return "index";

	}
}

package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	
	
	@RequestMapping("/AdminHome")
	public ModelAndView showAdminHome() {
		ModelAndView mv = new ModelAndView("/AdminHome");
		return mv;
	}

	@RequestMapping("/aboutUs")
	public String aboutUs() {
		return "aboutUs";
	}
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	
}

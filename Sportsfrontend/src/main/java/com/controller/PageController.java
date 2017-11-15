package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.UserDao;
import com.model.User;


/*
@Controller
@ComponentScan("com.Dao")
public class PageController {
	
	
	@Autowired
	UserDao userDao;
	
	
	@RequestMapping("/Reg")
	public String nextPag(Model m) {
		return "Register";
	}

	@RequestMapping("/register")
	public String addUser(@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("password") String password,
			@RequestParam("address")String address,@RequestParam("phone")String phone,@RequestParam("role")String role)
	{
		
		User user = new User();
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setAddress(address);
		user.setPhone(phone);
		user.setRole(role);
		userDao.addUser(user);
		return "Register";
	}
	
	@RequestMapping(value="/Register",method=RequestMethod.GET)
	public ModelAndView goToRegister(){
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("user",new User());
		mav.setViewName("Register");
		return mav;
	}
	
	
	@RequestMapping(value="saveRegister", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user")User user,BindingResult res){
		
		ModelAndView mav = new ModelAndView();
		user.setUserRole("ROLE_USER");
		user.setEnabled("enabled");
		userDao.insertUser(user);
		mav.setViewName("index");
		return "Login";
	}
	
	@RequestMapping("/Login")
	public String loggin()
	{
	return "Login";	
	}
	@RequestMapping("/getLogin")
	public String getLoginDetails(@RequestParam("email")String email,@RequestParam("password")String password,Model m)
	{
	User user = userDao.getUserByEmail(email);
	String Email = user.getEmail();
	String Password = user.getPassword();
	if(Email.equals(email) && Password.equals(password))
	{
	return "ProductDetails";	
	}
	else
	{
		return "Login";
		
	}
	}

	@RequestMapping("/loginSuccess")
	public String loggedin(HttpServletRequest req,Model m)
	{
		Principal principal = req.getUserPrincipal();
		String name = principal.getName();
		m.addAttribute("name",name);
		
	    return "index";	
	}
	
	
	@RequestMapping(value="/Login",method=RequestMethod.GET)
	public ModelAndView goToLogin(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("user",new User());
		mav.setViewName("Login");
		return mav;
	}
	

	
	@RequestMapping(value="/loginSuccess",method=RequestMethod.POST)
	public ModelAndView onLogin(HttpServletRequest request,@ModelAttribute("user")User user) {
		
		ModelAndView mav = new ModelAndView();
		String userMailId = request.getParameter("userMailId");
		String userPassword = request.getParameter("userPassword");
		System.out.println(userMailId+"  "+userPassword);
		boolean result = userDao.authenticateUser(userMailId, userPassword);
		user = userDao.getUserByUserId(userMailId);
		if(result == true){
			System.out.println("success"+user.getUserRole());
			if(user.getUserRole().equals("ROLE_ADMIN")){
				mav.setViewName("index");
				return mav; 
			}
			else{
			mav.setViewName("index");
			return mav;
			} 
		}
		else{
			System.out.println("failure");
			mav.setViewName("Error");
			return mav;
		}
		
	}


}
*/
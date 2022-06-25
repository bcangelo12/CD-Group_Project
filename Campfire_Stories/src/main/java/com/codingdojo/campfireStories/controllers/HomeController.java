package com.codingdojo.campfireStories.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.campfireStories.models.User;
import com.codingdojo.campfireStories.models.LoginUser;
import com.codingdojo.campfireStories.services.UserService;



@Controller

public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String index(@ModelAttribute("newUser") User user, @ModelAttribute("newLogin") LoginUser loginUser) {
		return "loginRegister.jsp";
	}

	// Register User
	
	@PostMapping("/register")
	public String registerUser(@Valid @ModelAttribute("newUser") User user,
			BindingResult results,
			HttpSession session,
			@ModelAttribute("newLogin") LoginUser loginUser) {
		//Validation
		userService.validate(user, results);
		if(results.hasErrors()) {
			return "loginRegister.jsp";
		}
		
		//Register User
		userService.registerUser(user);
		
		//Put user in session
		session.setAttribute("loggedInUser", user);
		return "redirect:/dashboard"; // Name of mainpage??
	}
	
	
	//Login User
	
	@PostMapping("/login")
	public String loginUser(@Valid @ModelAttribute("newLogin") LoginUser loginUser,
			BindingResult results,
			HttpSession session,
			@ModelAttribute("newUser") User user) {
		
		//Authenticate
		userService.authenticate(loginUser, results);
		if(results.hasErrors()) {
			return "loginRegister.jsp";
		}
		User loggedInUser = userService.findByEmail(loginUser.getEmail());
		//Put user in Session
		session.setAttribute("LoggedInUser", loggedInUser);
		return "redirect:/dashboard";
	}
	
	
	//Logout
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}

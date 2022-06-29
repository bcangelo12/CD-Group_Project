package com.codingdojo.campfireStories.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.campfireStories.models.LoginUser;
import com.codingdojo.campfireStories.models.User;
import com.codingdojo.campfireStories.services.UserService;

@Controller

public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String index(@ModelAttribute("newUser") User user, @ModelAttribute ("newLogin") LoginUser loginUser) {
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
			session.setAttribute("loggedInUser", user.getId());
			return "redirect:/home"; // Name of mainpage??
		}
		
		
		//Login User
		
		@PostMapping("/login")
		public String loginUser(@ModelAttribute("newLogin") LoginUser loginUser,
				BindingResult result,
				HttpSession session,
				@ModelAttribute("newUser") User user) {
			//Authenticate
			userService.authenticate(loginUser, result);
			if(result.hasErrors()) {
				return "loginRegister.jsp";
			}

			User loggedInUser = userService.findByEmail(loginUser.getEmail());
			//Put user in Session
			session.setAttribute("loggedInUser", loggedInUser.getId());

			return "redirect:/home";
		}
		
		
		//Logout
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
}

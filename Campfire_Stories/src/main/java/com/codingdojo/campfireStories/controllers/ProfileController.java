package com.codingdojo.campfireStories.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.codingdojo.campfireStories.models.Story;
import com.codingdojo.campfireStories.models.User;

@Controller
public class ProfileController {
	
	@GetMapping("/users/{id}")
	public String showUser(@PathVariable("id") Long id, Model model, HttpSession session, User user, Story story) {
		// set up models for user and stories
		return "UserPage.jsp";
	}
	

}

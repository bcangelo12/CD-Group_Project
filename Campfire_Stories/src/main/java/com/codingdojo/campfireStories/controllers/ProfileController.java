package com.codingdojo.campfireStories.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.codingdojo.campfireStories.models.Story;
import com.codingdojo.campfireStories.models.User;
import com.codingdojo.campfireStories.services.StoryService;
import com.codingdojo.campfireStories.services.UserService;

@Controller
public class ProfileController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private StoryService storyServ;
	
	@GetMapping("/users/{id}")
	public String showUser(@PathVariable("id") Long id, Model model, HttpSession session, Story story) {
		// set up models for user and stories
//		if(session.getAttribute("loggedInUser")!=null)
		User loadedUser = userServ.findById(id);
		model.addAttribute("user", loadedUser);
		model.addAttribute("userStories",storyServ.getAllStories());

		return "UserPage.jsp";
	}

}

package com.codingdojo.campfireStories.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
		if(session.getAttribute("loggedInUser")==null) {
			return "redirect:/logout";
		} else if(session.getAttribute("loggedInUser")==id) {
			User loadedUser = userServ.findById(id);
			model.addAttribute("loadedUser", loadedUser);
			model.addAttribute("stories",storyServ.getAllStories());
			return "UserPage.jsp";
		} else {
			return "redirect:/logout";
		}
	}
	
	@RequestMapping("/users/{id}/{storyId}/unfavorite")
	public String favoriteStory(@PathVariable("id") Long id, @PathVariable("storyId") Long storyId, HttpSession session, Model model) {
		if(session.getAttribute("loggedInUser")==null) {
			return "redirect:/logout";
		} else if(session.getAttribute("loggedInUser")==id) {
			Story story = storyServ.findStoryById(storyId);
			User user = userServ.findById(id);
			
			user.getFavorites().remove(story);
			userServ.updateUser(user);
			model.addAttribute("loadedUser", userServ.findById(id));
			return "redirect:/users/{id}";
		} else {
			return "redirect:/logout";
		}
	}
	
}

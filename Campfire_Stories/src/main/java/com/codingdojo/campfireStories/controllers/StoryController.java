package com.codingdojo.campfireStories.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.codingdojo.campfireStories.services.StoryService;
import com.codingdojo.campfireStories.services.UserService;

@Controller
public class StoryController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private StoryService storyServ;
	
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		
//		if (session.getAttribute("userId") == null) {
//			return "redirect:/logout";
//		}
//		else {
//			Long userId = (Long) session.getAttribute("userId");
//			model.addAttribute("user", userServ.findById(userId));
			return "home.jsp";
//		}
	}
	
	
	@GetMapping("/stories/{storyGenre}")
	public String stories(@PathVariable("storyGenre") String storyGenre, HttpSession session, Model model) {
		
//		if (session.getAttribute("userId") == null) {
//			return "redirect:/logout";
//		}
//		else {
//			Long userId = (Long) session.getAttribute("userId");
//			model.addAttribute("user", userServ.findById(userId));
			model.addAttribute("stories", storyServ.getAllStoriesByGenre(storyGenre));
			return "showstories.jsp";	
//		}
	}
}

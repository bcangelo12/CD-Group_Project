package com.codingdojo.campfireStories.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.campfireStories.models.Story;
import com.codingdojo.campfireStories.models.User;
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
		
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/logout";
		}
		else {
			Long userId = (Long) session.getAttribute("loggedInUser");
			model.addAttribute("user", userServ.findById(userId));
			return "home.jsp";
		}
	}
	
	
	@GetMapping("/stories/{storyGenre}")
	public String stories(@PathVariable("storyGenre") String storyGenre, HttpSession session, Model model) {
		
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/logout";
		}
		else {
			Long userId = (Long) session.getAttribute("loggedInUser");
			model.addAttribute("user", userServ.findById(userId));
			model.addAttribute("stories", storyServ.getAllStoriesByGenre(storyGenre));
			return "showstories.jsp";	
		}
	}

	//create new stories
	@GetMapping("/stories/new")
	public String newStory(@ModelAttribute("story") Story story, Model model, HttpSession session) {
	    
		if(session.getAttribute("loggedInUser") == null) {
			return "redirect:/logout";
		}
		
	    User user = userServ.findById((Long)session.getAttribute("loggedInUser"));
	    
		model.addAttribute("user", user);
	    
	    return "newStory.jsp";
	}
	
	@PostMapping("/stories/new")
	public String index(@Valid @ModelAttribute("story") Story story, BindingResult result, String storyGenre, HttpSession session) {
		
		if(result.hasErrors()) {
			return "newStory.jsp";
		}
		
		else {
			User user = userServ.findById((Long)session.getAttribute("loggedInUser"));
			story.setUser(user);
			story.setStoryGenre(storyGenre);
			storyServ.createStory(story);
//			user.getStoryFavorited().add(story);
			return "redirect:/home";
		}
	}
	
	//edit stories
	@GetMapping("/stories/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
	    
		if(session.getAttribute("loggedInUser") == null) {
			return "redirect:/logout";
		}
		
		Story story = storyServ.findStoryById(id);
	    model.addAttribute("story", story);
	    
	    return "editStory.jsp";
	}
	
	@PutMapping("/stories/{id}/edit")
	public String update(@Valid @ModelAttribute("story") Story story, BindingResult result, String storyGenre, HttpSession session) {
	    
		if (result.hasErrors()) {
	        return "redirect:/stories/{id}/edit";
	    } 
	    
		else {
			User user = userServ.findById((Long)session.getAttribute("loggedInUser"));
			story.setUser(user);
	        storyServ.updateStory(story);
	        return "redirect:/home";
	    }
	}

}

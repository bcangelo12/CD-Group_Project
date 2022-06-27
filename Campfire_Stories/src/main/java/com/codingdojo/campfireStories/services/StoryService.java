package com.codingdojo.campfireStories.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.campfireStories.models.Story;
import com.codingdojo.campfireStories.models.User;
import com.codingdojo.campfireStories.respositories.StoryRepository;

@Service
public class StoryService {
	
	@Autowired
	private StoryRepository storyRepo;
	
	public List<Story> getAllStories() {
		return storyRepo.findAll();
	}
	
	public Story findStoryById(Long id) {
		Story story = storyRepo.findById(id).orElse(null);
		return story;
	}
	
	public List<Story> getAllStoriesByGenre(String storyGenre) {
		return storyRepo.findAllByStoryGenre(storyGenre);
	}
	
	public void favoriteStory(Story story, User user) {
		List<User> favoriters = story.getFavoriters();
		favoriters.add(user);
		storyRepo.save(story);
	}
	
	public void unFavoriteStory(Story story, User user) {
		List<User> favoriters = story.getFavoriters();
		favoriters.remove(user);
		storyRepo.save(story);
	}
	
//	create a new story
	public Story createStory(Story story) {
		return storyRepo.save(story);
	}
	
//	update story
	public Story updateStory(Story story) {
		return storyRepo.save(story);
	}
}

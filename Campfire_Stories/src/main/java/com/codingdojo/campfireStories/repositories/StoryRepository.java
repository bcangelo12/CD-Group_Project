package com.codingdojo.campfireStories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.campfireStories.models.Story;
import com.codingdojo.campfireStories.models.User;

@Repository
public interface StoryRepository extends CrudRepository<Story, Long>{
	List<Story> findAll();
	List<Story> findAllByStoryGenre(String storyGenre);
	List<Story> findByFavoriters(User user);
}

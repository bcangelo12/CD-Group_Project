package com.codingdojo.campfireStories.respositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.campfireStories.models.Story;

@Repository
public interface StoryRepository extends CrudRepository<Story, Long>{
	List<Story> findAll();
}

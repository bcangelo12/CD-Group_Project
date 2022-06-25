package com.codingdojo.campfireStories.respositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.codingdojo.campfireStories.models.User;

@Repository

public interface UserRepository extends CrudRepository<User, Long> {
	
	User findByEmail(String email);

}
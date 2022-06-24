package com.codingdojo.campfireStories.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.campfireStories.models.User;
import com.codingdojo.campfireStories.respositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	public List<User> getAllUsers() {
		return userRepo.findAll();
	}
	
	public User findById(Long id) {
		return userRepo.findById(id).orElse(null);
	}
	
	public User findByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
}

package com.codingdojo.campfireStories.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import com.codingdojo.campfireStories.models.LoginUser;
import com.codingdojo.campfireStories.models.User;
import com.codingdojo.campfireStories.respositories.UserRepository;

@Service

public class UserService {
	
	@Autowired
	private com.codingdojo.campfireStories.respositories.UserRepository userRepo;
	
	public void validate(User newUser, Errors errors) {
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			errors.rejectValue("password", "missmatch", "Passwords don't match");
		}
		if(userRepo.findByEmail(newUser.getEmail()) != null) {
			errors.rejectValue("email", "duplicate", "Email already exists");
		}
	}
	
	
	public User registerUser(User newUser) {
		
		String hashedPass = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		
		newUser.setPassword(hashedPass);
		
		userRepo.save(newUser);
		
		return null;
	}
	
	//Find user by email
	
	public User findByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
	//Find user by id
	
	public User findById(User newUser) {
		return userRepo.findByEmail(newUser.getEmail());
	}
	
	//Authenticate user
	public boolean authenticate(LoginUser newLogin, Errors errors) {
		User user = userRepo.findByEmail(newLogin.getEmail());
		if(user==null) {
			errors.rejectValue("email", "not found", "Email not found");
			return false;
		} else {
			if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
				errors.rejectValue("password", "matches", "Invalid Password");
				return false;
			}
		}
		
		return true;
	}	
}
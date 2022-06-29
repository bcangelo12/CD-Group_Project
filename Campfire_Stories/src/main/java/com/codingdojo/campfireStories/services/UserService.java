package com.codingdojo.campfireStories.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import com.codingdojo.campfireStories.models.LoginUser;
import com.codingdojo.campfireStories.models.User;
import com.codingdojo.campfireStories.repositories.UserRepository;

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
	
	//Reg, Validate and Authen
	
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
	
	public User updateUser(User user) {
		return userRepo.save(user);
	}
}

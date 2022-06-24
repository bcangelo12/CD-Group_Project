package com.codingdojo.campfireStories.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="A User Name is required for registration!")
	@Size(min=1,message="Your User Name must be at least 1 character in length.")
	private String userName;
	
	@NotEmpty(message="An email is required for registration!")
	@Email(message="Please enter a valid email address.")
	private String email;
	
	@NotEmpty(message="A password is required!")
	@Size(min=8,max=128,message="The password must have at least 8 characters!")
	private String password;
	
	@Transient
	@NotEmpty(message="A confirmation password is required!")
	@Size(min=8,max=128,message="The confirmation password must have at least 8 characters!")
	private String confirm;
	
	// boilerplate for story mapping
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)
	private List<Story> stories;
	
	// boilerplate for favorite mapping
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
			name="favorites",
			joinColumns=@JoinColumn(name="user_id"),
			inverseJoinColumns=@JoinColumn(name="story_id"))
	private List<Story> storyFavorited;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public List<Story> getStories() {
		return stories;
	}

	public void setStories(List<Story> stories) {
		this.stories = stories;
	}

	public List<Story> getStoryFavorited() {
		return storyFavorited;
	}

	public void setStoryFavorited(List<Story> storyFavorited) {
		this.storyFavorited = storyFavorited;
	}
	
}

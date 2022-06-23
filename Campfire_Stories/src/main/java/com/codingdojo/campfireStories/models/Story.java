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
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name="stories")
public class Story {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="You must give your story a title!")
	@Size(min=5,message="Your story title must be at least 5 characters long!")
	private String storyTitle;
	
	@NotEmpty(message="You must have some content for your story!")
	@Size(min=15,message="Your story must be at least 15 characters long!")
	private String storyContent;
	
	@NotEmpty(message="You must give your story a genre!")
	private String storyGenre;
	
	// boilerplate for story mapping
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="user_id")
	private User user;
	
	// boilerplate for favorite mapping
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
			name="favorites",
			joinColumns=@JoinColumn(name="favorite_id"),
			inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<User> favoriters;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStoryTitle() {
		return storyTitle;
	}

	public void setStoryTitle(String storyTitle) {
		this.storyTitle = storyTitle;
	}

	public String getStoryContent() {
		return storyContent;
	}

	public void setStoryContent(String storyContent) {
		this.storyContent = storyContent;
	}

	public String getStoryGenre() {
		return storyGenre;
	}

	public void setStoryGenre(String storyGenre) {
		this.storyGenre = storyGenre;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getFavoriters() {
		return favoriters;
	}

	public void setFavoriters(List<User> favoriters) {
		this.favoriters = favoriters;
	}
	
	
}

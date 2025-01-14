package com.skilldistillery.nationalperks.data;

import java.util.List;

import com.skilldistillery.nationalperks.entities.User;

public interface UserDAO {
	
	public User authenticateUser(String username, String password);
	
	public User registerUser(User user);
	
	public User editUserProfile(User user, int userId);
	
	public List<User> listAllUsers();
	
	public User findUserProfileById(int userId);
		
}

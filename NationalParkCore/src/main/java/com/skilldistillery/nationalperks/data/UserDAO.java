package com.skilldistillery.nationalperks.data;

import com.skilldistillery.nationalperks.entities.User;

public interface UserDAO {
	
	public User authenticateUser(String username, String password);
	
	public User registerUser(User user);
	
	public User editUserProfile(User user, int userId);
		
}
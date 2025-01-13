package com.skilldistillery.nationalperks.data;

import java.util.List;

import com.skilldistillery.nationalperks.entities.Park;
import com.skilldistillery.nationalperks.entities.User;

public interface UserDAO {
	
	User authenticateUser(String username, String password);
	
}
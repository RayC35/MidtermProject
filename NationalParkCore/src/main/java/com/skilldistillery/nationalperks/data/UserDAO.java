package com.skilldistillery.nationalperks.data;

import java.util.List;

import com.skilldistillery.nationalperks.entities.Park;
import com.skilldistillery.nationalperks.entities.User;

public interface UserDAO {
	
	User authenticateUser(String username, String password);
	public Park readCookieById(int id);
	public List<Park> readAllParks();
	public List<Park> readParksByKeyword(String keyword);
	public Park updatePark(Park park, int id);
	
}
package com.skilldistillery.nationalperks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.nationalperks.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
}

package com.skilldistillery.nationalperks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.nationalperks.data.UserDAO;
import com.skilldistillery.nationalperks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDao.authenticateUser("admin", "test")); // delete later
		return "home";
	}
	
	@GetMapping("goRegister.do")
	public String goRegister(HttpSession session) {
		return "register";
	}

	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public String doRegister(HttpSession session, User user) {
		try {
			user = userDao.registerUser(user);
			session.setAttribute("loggedInUser", user);
		return "userProfile";	
		} catch (Exception e) {
			e.printStackTrace();
			return "home";
		}
	}
	
	

}

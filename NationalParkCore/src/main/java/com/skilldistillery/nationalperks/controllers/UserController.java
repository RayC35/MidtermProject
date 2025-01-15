package com.skilldistillery.nationalperks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalperks.data.ParkVisitDAO;
import com.skilldistillery.nationalperks.data.UserDAO;
import com.skilldistillery.nationalperks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private ParkVisitDAO parkVisitDao;

	@GetMapping({ "/", "home.do" })
	public String home(Model model) {
		return "home";
	}

	@GetMapping("goRegister.do")
	public String goRegister(HttpSession session) {
		return "register";
	}

	@PostMapping("register.do")
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

	@GetMapping("goLogin.do")
	public String goLogin(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "home";
		} else {
			return "login";
		}
	}

	@PostMapping("login.do")
	public String doLogin(User user, HttpSession session, Model model) {
		user = userDao.authenticateUser(user.getUsername(), user.getPassword());
		if (user != null) {
			session.setAttribute("loggedInUser", user);
			model.addAttribute("parkVisitList", parkVisitDao.listUserParkVisits(user.getId()));
			return "userProfile";
		} else {
			return "login";
		}
	}

	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "home";
	}

	@GetMapping("goUserProfile.do")
	public String goUserProfile(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "userProfile";
		} else {
			return "login";
		}
	}

	@GetMapping("goEditUserProfile.do")
	public String goEditProfile(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "editUserProfile";
		} else {
			return "login";
		}
	}

	@PostMapping("editUserProfile.do")
	public String doEdit(HttpSession session, User updatedUser) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			updatedUser = userDao.editUserProfile(updatedUser, loggedInUser.getId());
			session.setAttribute("loggedInUser", updatedUser);
			return "userProfile";
		} else {
			return "login";
		}
	}

	@GetMapping("listAllUsers.do")
	public String listAllUsers(Model model) {
		List<User> allUsers = userDao.listAllUsers();
		model.addAttribute("userList", allUsers);
		return "allUsers";
	}

	private boolean isAdmin(User user) {
		return user.getRole().equals("admin");
	}

	@GetMapping("adminGoUserProfile.do")
	public String adminGoUserProfile(HttpSession session, @RequestParam("userId") int userId) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (isAdmin(loggedInUser)) {
			User foundUser = userDao.findUserProfileById(userId);
			session.setAttribute("adminFoundUser", foundUser);
			return "adminViewUserProfile";
		} else {
			return "home";
		}
	}

	@GetMapping("goAdminEditUserProfile.do")
	public String goAdminEditProfile(HttpSession session, @RequestParam("userId") int userToEditId) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (isAdmin(loggedInUser)) {
			User foundUser = userDao.findUserProfileById(userToEditId);
			session.setAttribute("adminFoundUser", foundUser);
			return "adminEditUserProfile";
		} else {
			return "home";
		}
	}

	@PostMapping("adminEditUserProfile.do")
	public String doAdminEditUserProfile(HttpSession session, User adminUpdatedUser) {
		User adminFoundUser = (User) session.getAttribute("adminFoundUser");
		if (adminFoundUser != null) {
			adminUpdatedUser = userDao.adminEditUserProfile(adminUpdatedUser, adminFoundUser.getId());
			session.setAttribute("adminFoundUser", adminUpdatedUser);
			return "adminViewUserProfile";
		} else {
			return "adminEditUserProfile";
		}
	}

	@PostMapping("adminDisableUser.do")
	public String doAdminDisableUser(HttpSession session, User adminDisabledUser) {
		User adminFoundUser = (User) session.getAttribute("adminFoundUser");
		if (adminFoundUser != null) {
			adminDisabledUser = userDao.adminEditUserProfile(adminDisabledUser, adminFoundUser.getId());
			session.setAttribute("adminFoundUser", adminDisabledUser);
			return "allUsers";
		} else {
			return "adminEditUserProfile";
		}
	}
}

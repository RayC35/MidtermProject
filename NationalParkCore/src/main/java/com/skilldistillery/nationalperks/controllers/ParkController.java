package com.skilldistillery.nationalperks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalperks.data.ParkDAO;
import com.skilldistillery.nationalperks.entities.Park;
import com.skilldistillery.nationalperks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class ParkController {
	@Autowired
	private ParkDAO parkDao;

	@GetMapping("listAllParks.do")
	public String listAllParks(Model model) {
		List<Park> allParks = parkDao.listAllParks();
		model.addAttribute("parkList", allParks);
		return "allParks";
	}
	
	@GetMapping ("parkDetails.do")
	public String parkDetails(Model model, @RequestParam ("parkId") int parkId) {
		Park foundPark = parkDao.findParkById(parkId);
		model.addAttribute("park", foundPark);
		return "parkDetails";
	}
	
	
	private boolean isAdmin(User user) {
		return user.getRole().equals("admin");
	}
	
	@GetMapping("goAdminEditParkDetails.do")
	public String goAdminEditParkDetails(HttpSession session, @RequestParam("parkId") int parkToEditId) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		Park foundPark = parkDao.findParkById(parkToEditId);
		if (isAdmin(loggedInUser)) {
			session.setAttribute("adminFoundPark", foundPark);
			return "adminEditParkDetails";
		} else {
			return "home";
		}
	}

	@PostMapping("adminEditParkDetails.do")
	public String doAdminEditParkDetails(HttpSession session, Park adminUpdatedPark) {
		Park adminFoundPark = (Park) session.getAttribute("adminFoundPark");
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (adminFoundPark != null) {
			adminUpdatedPark = parkDao.adminEditParkDetails(adminUpdatedPark, adminFoundPark.getId());
			session.setAttribute("park", adminUpdatedPark);
			session.setAttribute("user", loggedInUser);
			return "parkDetails";
		} else {
			return "adminEditParkDetails";
		}
	}


}

package com.skilldistillery.nationalperks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalperks.data.ParkVisitDAO;
import com.skilldistillery.nationalperks.entities.ParkVisit;
import com.skilldistillery.nationalperks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class ParkVisitController {

	@Autowired
	private ParkVisitDAO parkVisitDao;

	@GetMapping("listAllUserParkVisits.do")
	public String listAllUserParkVisits(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		int userId = user.getId();
		List<ParkVisit> userParkVisits = parkVisitDao.listUserParkVisits(userId);
		session.setAttribute("parkVisitList", userParkVisits);
		return "allUserParkVisits";
	}

	@GetMapping("parkVisitDetails.do")
	public String parkVisitDetails(HttpSession session, @RequestParam("parkVisitId") int parkVisitId) {
		ParkVisit foundParkVisit = null;
		foundParkVisit = parkVisitDao.findParkVisitById(parkVisitId);
		if (foundParkVisit != null) {
			session.setAttribute("parkVisit", foundParkVisit);
		} else {
			return "allUserParkVisits";
		}
		return "parkVisitDetails";
	}

	@GetMapping("goCreateParkVisit.do")
	public String goCreateParkVisit(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			return "createParkVisit";
		} else {
			return "home";
		}
	}
	
	@PostMapping("createParkVisit.do")
	public String createParkVisit(HttpSession session, ParkVisit createdParkVisit) {
		ParkVisit newParkVisit = parkVisitDao.createParkVisit(createdParkVisit);
		if (newParkVisit != null) {
			session.setAttribute("parkVisit", newParkVisit);
			return "allUserParkVisits";
		} else {
			return "userProfile";
		}
	}

}

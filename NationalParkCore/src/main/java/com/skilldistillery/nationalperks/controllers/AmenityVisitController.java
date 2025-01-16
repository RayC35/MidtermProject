package com.skilldistillery.nationalperks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalperks.data.AmenityVisitDAO;
import com.skilldistillery.nationalperks.entities.AmenityVisit;
import com.skilldistillery.nationalperks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class AmenityVisitController {

	@Autowired
	private AmenityVisitDAO amenityVisitDao;

	@GetMapping("amenityVisitDetails.do")
	public String findAmenityVisitById(Model model, @RequestParam("amenityVisitId") int amenityVisitId) {
		AmenityVisit foundAmenityVisit = null;
		try {
			foundAmenityVisit = amenityVisitDao.findAmenityVisitById(amenityVisitId);
			model.addAttribute("amenity", foundAmenityVisit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "amenityVisitDetails";
	}

	@GetMapping("listAllAmenityVisitsByAmenityId.do")
	public String listAllAmenityVisitsByAmenity(Model model, @RequestParam("amenityId") int amenityId) {
		List<AmenityVisit> allAmenityVisits = amenityVisitDao.listAllAmenityVisitsByAmenityId(amenityId);
		model.addAttribute("amenityList", allAmenityVisits);
		return "amenityDetails";
	}

	@GetMapping("goCreateAmenityVisit.do")
	public String goCreateAmenityVisit(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			return "createAmenityVisit";
		} else {
			return "home";
		}
	}

	@PostMapping("createAmenityVisit.do")
	public String createParkVisit(HttpSession session, AmenityVisit createdAmenityVisit) {
		AmenityVisit newAmenityVisit = amenityVisitDao.createAmenityVisit(createdAmenityVisit);
		if (newAmenityVisit != null) {
			session.setAttribute("amenityVisit", newAmenityVisit);
			return "amenityDetails";
		} else {

			return "createAmenityVisit";
		}
	}
}

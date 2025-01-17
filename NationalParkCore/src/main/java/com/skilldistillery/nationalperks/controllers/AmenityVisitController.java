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
			model.addAttribute("amenityVisit", foundAmenityVisit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "viewAmenityVisit";
	}

	@GetMapping("listAmenityVisitsByAmenity.do")
	public String listAmenityVisitsByAmenity(Model model, @RequestParam("amenity") int amenityId) {
		List<AmenityVisit> allAmenityVisits = amenityVisitDao.listAllAmenityVisitsByAmenityId(amenityId);
		model.addAttribute("amenityVisitList", allAmenityVisits);
		return "listAmenityVisitsByAmenity";
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

	@GetMapping("goEditAmenityVisit.do")
	public String goEditAmenityVisit(HttpSession session, Model model,
			@RequestParam("amenityVisitId") int amenityVisitId) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		AmenityVisit managedAmenityVisit = amenityVisitDao.findAmenityVisitById(amenityVisitId);
		if (loggedInUser != null) {
			session.setAttribute("editedAmenityVisit", managedAmenityVisit);
			model.addAttribute("amenityVisit", managedAmenityVisit);
			return "editAmenityVisit";
		} else {
			return "createAmenityVisit";
		}
	}

	@PostMapping("editAmenityVisit.do")
	public String doEditAmenityVisit(HttpSession session, Model model, AmenityVisit updatedAmenityVisit) {
//		AmenityVisit managedAmenityVisit = (AmenityVisit) session.getAttribute("editedAmenityVisit");
		if (updatedAmenityVisit != null) {
			updatedAmenityVisit = amenityVisitDao.editAmenityVisit(updatedAmenityVisit, updatedAmenityVisit.getId());
//			session.setAttribute("amenityVisit", updatedAmenityVisit);
			session.removeAttribute("editedAmenityVisit");
			return "redirect:amenityVisitDetails.do?amenityVisitId=" + updatedAmenityVisit.getId();
		} else {
			return "createAmenityVisit";
		}
	}

}

package com.skilldistillery.nationalperks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalperks.data.AmenityDAO;
import com.skilldistillery.nationalperks.data.AmenityVisitDAO;
import com.skilldistillery.nationalperks.entities.Amenity;
import com.skilldistillery.nationalperks.entities.AmenityVisit;
import com.skilldistillery.nationalperks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class AmenityController {

	@Autowired
	private AmenityDAO amenityDao; 
	
	@Autowired
	private AmenityVisitDAO amenityVisitDao;
	
	@GetMapping("listAllAmenitiesByParkId.do")
	public String listAllAmenitiesByParkId(Model model, @RequestParam("parkId") int parkId) {
		List<Amenity> allAmenities = amenityDao.listAllAmenitiesByParkId(parkId);
		model.addAttribute("amenityList", allAmenities);
		return "listAllAmenitiesByPark";
	}
	
	@GetMapping("amenityDetails.do")
	public String findAmenityById(Model model, @RequestParam("amenityId") int amenityId) {
		Amenity foundAmenity = null;
		try {
			foundAmenity = amenityDao.findAmenityById(amenityId);
			List<AmenityVisit> amenityVisits = amenityVisitDao.listAllAmenityVisitsByAmenityId(amenityId);
			model.addAttribute("amenityVisits", amenityVisits);
			model.addAttribute("amenity", foundAmenity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "amenityDetails";
	}
	@GetMapping("goCreateAmenity.do")
	public String goCreateAmenity(HttpSession session) {
		User user = (User) session.getAttribute("loggedIn");
		if (user != null) {
			return "createAmenity";
			} else {
			return "home";
			}
	}
	@PostMapping("createAmenity.do")
	public String createAmenity(HttpSession session, Amenity createdAmenity) {
		Amenity newAmenity = amenityDao.createAmenity(createdAmenity);
		if (newAmenity != null) {
			session.setAttribute("amenity", newAmenity);
			return "amenityDetails";
		} else {
			return "createAmenity";
		}
	}
	
	@GetMapping("goAdminEditAmenity.do")
	public String goAdminEditAmenity(HttpSession session,
			@RequestParam("amenityId") int amenityToEditId) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		Amenity managedAmenity = amenityDao.findAmenityById(amenityToEditId);
		if (loggedInUser.getRole().equals("admin")) {
			session.setAttribute("amenity", managedAmenity);
			return "adminEditAmenity";
		} else {
			return "createAmenity";
		}
	}

	@PostMapping("adminEditAmenity.do")
	public String doAdminEditAmenity(HttpSession session, Amenity updatedAmenity) {
		Amenity managedAmenity = (Amenity) session.getAttribute("amenity");
		if (managedAmenity != null) {
			updatedAmenity = amenityDao.adminEditAmenity(updatedAmenity, managedAmenity.getId());
			session.setAttribute("amenity", updatedAmenity);
			return "userProfile";
		} else {
			return "createAmenity";
		}
	}
	
	@GetMapping("listAllAmenities.do")
	public String listAllAmenities(Model model) {
		List<Amenity> allAmenities = amenityDao.listAllAmenities();
		model.addAttribute("amenityList", allAmenities);
		return "allAmenities";
	}
}

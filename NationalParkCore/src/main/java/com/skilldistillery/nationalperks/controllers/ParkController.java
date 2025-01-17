package com.skilldistillery.nationalperks.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalperks.data.AmenityDAO;
import com.skilldistillery.nationalperks.data.ParkDAO;
import com.skilldistillery.nationalperks.entities.Amenity;
import com.skilldistillery.nationalperks.entities.AmenityCategory;
import com.skilldistillery.nationalperks.entities.Park;
import com.skilldistillery.nationalperks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class ParkController {
	@Autowired
	private ParkDAO parkDao;
	
	@Autowired
	private AmenityDAO amenityDao;

	private boolean isAdmin(User user) {
		return user.getRole().equals("admin");
	}

	@GetMapping("listAllParks.do")
	public String listAllParks(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		List<Park> allParks = parkDao.listAllParks();
		model.addAttribute("parkList", allParks);
		session.setAttribute("user", user);
		return "allParks";
	}

	@GetMapping("parkDetails.do")
	public String parkDetails(Model model, @RequestParam("parkId") int parkId) {
		Park foundPark = parkDao.findParkById(parkId);
		List<Amenity> amenities = amenityDao.listAllAmenitiesByParkId(parkId);
		model.addAttribute("park", foundPark);
		model.addAttribute("amenities", generateAmenityMap(amenities));
		return "parkDetails";
	}
	
	private Map<String, List<Amenity>> generateAmenityMap(List<Amenity> amenities) {
		Map<String, List<Amenity>> amenityCategoryMap = new HashMap<>();
		for (Amenity amenity : amenities) {
			List<AmenityCategory> categories = amenity.getAmenityCategories();
			for (AmenityCategory category : categories) {
				if(amenityCategoryMap.containsKey(category.getName())) {
					List<Amenity> amenitiesList = amenityCategoryMap.get(category.getName());
					amenitiesList.add(amenity);
				} else {
					List<Amenity> newAmenityList = new ArrayList<>();
					newAmenityList.add(amenity);
					amenityCategoryMap.put(category.getName(), newAmenityList);
				}
				
			}
			
		}
		return amenityCategoryMap;
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
			session.setAttribute("message", "Unable to edit park details.");
			return "error";
		}
	}

}

package com.skilldistillery.nationalperks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalperks.data.AmenityDAO;
import com.skilldistillery.nationalperks.data.AmenityVisitDAO;
import com.skilldistillery.nationalperks.entities.Amenity;
import com.skilldistillery.nationalperks.entities.AmenityVisit;

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
	
}

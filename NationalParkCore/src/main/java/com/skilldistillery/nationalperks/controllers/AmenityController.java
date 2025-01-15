package com.skilldistillery.nationalperks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalperks.data.AmenityDAO;
import com.skilldistillery.nationalperks.entities.Amenity;

@Controller
public class AmenityController {

	@Autowired
	private AmenityDAO amenityDao; 
	
	@GetMapping("listAllAmenitiesByParkId.do")
	public String listAllAmenitiesByParkId(Model model, @RequestParam("parkId") int parkId) {
		List<Amenity> allAmenities = amenityDao.listAllAmenitiesByParkId(parkId);
		model.addAttribute("amenityList", allAmenities);
		return "listAllAmenitiesByPark";
	}
	
	@GetMapping("amenityDetails.do")
	public String findAmenityById(Model model, int amenityId) {
		Amenity foundAmenity = null;
		try {
			foundAmenity = amenityDao.findAmenityById(amenityId);
			model.addAttribute("amenity", foundAmenity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "amenityDetails";
	}
	
	
	
}

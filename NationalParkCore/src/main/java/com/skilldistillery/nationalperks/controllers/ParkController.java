package com.skilldistillery.nationalperks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalperks.data.ParkDAO;
import com.skilldistillery.nationalperks.entities.Park;

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

}

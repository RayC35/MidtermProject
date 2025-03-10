package com.skilldistillery.nationalperks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalperks.data.AmenityVisitDAO;
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
		if (user != null) {
			List<ParkVisit> userParkVisits = parkVisitDao.listUserParkVisits(user.getId());
			session.setAttribute("parkVisitList", userParkVisits);
			return "allUserParkVisits";			
		}
		else {
			return "home";
		}
	}

	@GetMapping("parkVisitDetails.do")
	public String parkVisitDetails(HttpSession session, @RequestParam("parkVisitId") int parkVisitId) {
		ParkVisit foundParkVisit = null;
		foundParkVisit = parkVisitDao.findParkVisitById(parkVisitId);
		if (foundParkVisit != null) {
			session.setAttribute("parkVisit", foundParkVisit);
			session.setAttribute("parkVisitImages", foundParkVisit.getParkVisitImages());
			session.setAttribute("amenityVisits", foundParkVisit.getAmenityVisits());
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
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			ParkVisit newParkVisit = parkVisitDao.createParkVisit(createdParkVisit, user.getId());
			if (newParkVisit != null) {
				session.setAttribute("parkVisit", newParkVisit);
				return "redirect:parkVisitDetails.do?parkVisitId="+newParkVisit.getId();
			} else {
				return "userProfile";
			}
		} else {
			return "login";
		}
	}

	@GetMapping("goEditParkVisitDetails.do")
	public String goEditParkVisitDetails(HttpSession session, @RequestParam("parkVisitId") int parkVisitToEditId) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		ParkVisit managedParkVisit = parkVisitDao.findParkVisitById(parkVisitToEditId);
		if (loggedInUser != null) {
			session.setAttribute("parkVisit", managedParkVisit);
			session.setAttribute("parkVisitImages", managedParkVisit.getParkVisitImages());
			return "editParkVisit";
		} else {
			return "createParkVisit";
		}
	}

	@PostMapping("editParkVisitDetails.do")
	public String doEditParkVisitDetails(HttpSession session, Model model, ParkVisit updatedParkVisit) {
		ParkVisit managedParkVisit = (ParkVisit) session.getAttribute("parkVisit");
		if (managedParkVisit != null) {
			updatedParkVisit = parkVisitDao.editParkVisit(updatedParkVisit, managedParkVisit.getId());
			session.setAttribute("parkVisit", updatedParkVisit);
			session.setAttribute("parkVisitImages", managedParkVisit.getParkVisitImages());
			model.addAttribute("parkVisit", updatedParkVisit);
			model.addAttribute("parkVisitImages", managedParkVisit.getParkVisitImages());
			return "redirect:listAllUserParkVisits.do";
		} else {
			return "editParkVisitDetails";
		}
	}

	@GetMapping("listParkVisitsByPark.do")
	public String listParkVisitsByPark(Model model, @RequestParam("park") int parkId) {
		List<ParkVisit> parkVisitsByPark = parkVisitDao.findParkVisitsByParkId(parkId);
		model.addAttribute("parkVisitList", parkVisitsByPark);
		return "listParkVisitsByPark";
	}

}

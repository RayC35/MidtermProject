package com.skilldistillery.nationalperks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalperks.entities.AmenityVisit;
import com.skilldistillery.nationalperks.entities.Park;
import com.skilldistillery.nationalperks.entities.ParkVisit;
import com.skilldistillery.nationalperks.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class ParkVisitDAOImpl implements ParkVisitDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<ParkVisit> listUserParkVisits(int userId) {
		String jpql = "SELECT p FROM ParkVisit p WHERE p.user.id = :id";
		List<ParkVisit> userParkVisits = em.createQuery(jpql, ParkVisit.class).setParameter("id", userId)
				.getResultList();
		return userParkVisits;
	}

	@Override
	public ParkVisit findParkVisitById(int parkVisitId) {
		ParkVisit foundParkVisit = null;
		try {
			foundParkVisit = em.find(ParkVisit.class, parkVisitId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return foundParkVisit;
	}

	@Override
	public ParkVisit createParkVisit(ParkVisit parkVisit) {
		parkVisit.setEnabled(true);
		parkVisit.setPublished(true);
		em.persist(parkVisit);
		return parkVisit;
	}

	@Override
	public ParkVisit editParkVisit(ParkVisit parkVisit, int parkVisitId) {
		ParkVisit managedParkVisit = em.find(ParkVisit.class, parkVisitId);
		managedParkVisit.setRemarks(parkVisit.getRemarks());
		managedParkVisit.setRating(parkVisit.getRating());
		managedParkVisit.setStartDate(parkVisit.getStartDate());
		managedParkVisit.setEndDate(parkVisit.getEndDate());
		managedParkVisit.setTitle(parkVisit.getTitle());
		managedParkVisit.setImageURL(parkVisit.getImageURL());
		managedParkVisit.setPublished(parkVisit.getPublished());
		managedParkVisit.setEnabled(parkVisit.getEnabled());
		em.persist(managedParkVisit);
		return managedParkVisit;
	}

}

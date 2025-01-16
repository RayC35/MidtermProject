package com.skilldistillery.nationalperks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalperks.entities.AmenityVisit;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class AmenityVisitDAOImpl implements AmenityVisitDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public AmenityVisit findAmenityVisitById(int amenityVisitId) {
		AmenityVisit foundAmenityVisit = null;
		try {
			foundAmenityVisit = em.find(AmenityVisit.class, amenityVisitId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return foundAmenityVisit;
	}

	@Override
	public List<AmenityVisit> listAllAmenityVisitsByAmenityId(int amenityId) {
		String jpql = "SELECT a FROM AmenityVisit a WHERE a.amenity.id = :id";
		List<AmenityVisit> amenityVisitsByAmenity = em.createQuery(jpql, AmenityVisit.class)
													  .setParameter("id", amenityId).getResultList();
		return amenityVisitsByAmenity;
	}

	@Override
	public List<AmenityVisit> listAllAmenityVisitsByUserId(int userId) {
		String jpql = "SELECT a FROM AmenityVisit a WHERE a.parkVisit.user.id = :id";
		List<AmenityVisit> amenityVisitByUser = em.createQuery(jpql, AmenityVisit.class)
													  .setParameter("id", userId).getResultList();
		return amenityVisitByUser;
	}

	@Override
	public AmenityVisit createAmenityVisit(AmenityVisit amenityVisit) {
		amenityVisit.setEnabled(true);
		em.persist(amenityVisit);
		return amenityVisit;
	}

	@Override
	public AmenityVisit editAmenityVisit(AmenityVisit amenityVisit, int amenityVisitId) {
		AmenityVisit managedAmenityVisit = em.find(AmenityVisit.class, amenityVisitId);
		managedAmenityVisit.setRemarks(amenityVisit.getRemarks());
		managedAmenityVisit.setRating(amenityVisit.getRating());
		managedAmenityVisit.setDateVisited(amenityVisit.getDateVisited());
		managedAmenityVisit.setEnabled(amenityVisit.getEnabled());
		em.persist(managedAmenityVisit);
		return managedAmenityVisit;
	}

}

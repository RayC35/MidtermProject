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

//	@Override
//	public List<AmenityVisit> listAllAmenityVisitsByUserId(int userId) {
//		String jpql = "SELECT a FROM AmenityVisit a WHERE a.user.id = :id";
//		List<AmenityVisit> amenityVisitsByAmenity = em.createQuery(jpql, AmenityVisit.class)
//													  .setParameter("id", amenityId).getResultList();
//		return amenityVisitsByAmenity;
//	}

}

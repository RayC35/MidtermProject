package com.skilldistillery.nationalperks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalperks.entities.Amenity;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class AmenityDAOImpl implements AmenityDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Amenity> listAllAmenitiesByParkId(int parkId) {
		String jpql = "SELECT a FROM Amenity a JOIN a.amenityCategories ac WHERE a.park.id =:id ORDER BY ac.name";
		List<Amenity> amenitiesByPark = em.createQuery(jpql, Amenity.class)
				.setParameter("id", parkId).getResultList();
		return amenitiesByPark;
	}

	@Override
	public Amenity findAmenityById(int amenityId) {
		Amenity foundAmenity = null;
		try {
			foundAmenity = em.find(Amenity.class, amenityId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return foundAmenity;
	}

	@Override
	public Amenity createAmenity(Amenity createdAmenity) {
		createdAmenity.setEnabled(true);
		em.persist(createdAmenity);
		return createdAmenity;
	}

	@Override
	public Amenity adminEditAmenity(Amenity editedAmenity, int amenityId) {
		Amenity managedAmenity = em.find(Amenity.class, amenityId);
		managedAmenity.setName(editedAmenity.getName());
		managedAmenity.setImageURL(editedAmenity.getImageURL());
		managedAmenity.setDescription(editedAmenity.getDescription());
		managedAmenity.setCostRange(editedAmenity.getCostRange());
		managedAmenity.setLatitude(editedAmenity.getLatitude());
		managedAmenity.setLongitude(editedAmenity.getLongitude());
		managedAmenity.setWebsiteURL(editedAmenity.getWebsiteURL());
		managedAmenity.setAmenityCategories(editedAmenity.getAmenityCategories());
		managedAmenity.setPark(editedAmenity.getPark());
		managedAmenity.setEnabled(editedAmenity.getEnabled());
		em.persist(managedAmenity);
		return managedAmenity;		
	}

	@Override
	public List<Amenity> listAllAmenities() {
		String jpql = "SELECT a FROM Amenity a";
		List<Amenity> allAmenities = em.createQuery(jpql, Amenity.class).getResultList();
		return allAmenities;
	}
}
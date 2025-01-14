package com.skilldistillery.nationalperks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalperks.entities.Park;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class ParkDAOImpl implements ParkDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Park> listAllParks() {
		String jpql = "SELECT p FROM Park p";
		List<Park> allParks = em.createQuery(jpql, Park.class).getResultList();
		return allParks;
	}

	@Override
	public Park findParkById(int parkId) {
		Park foundPark = null;
		try {
			foundPark = em.find(Park.class, parkId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return foundPark;
	}

}

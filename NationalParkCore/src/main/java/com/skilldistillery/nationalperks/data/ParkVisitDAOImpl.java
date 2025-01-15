package com.skilldistillery.nationalperks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalperks.entities.ParkVisit;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class ParkVisitDAOImpl implements ParkVisitDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<ParkVisit> listUserParkVisits() {
		return null;
	}

	@Override
	public ParkVisit findParkVisitById(int parkVisitId) {
		return null;
	}

	@Override
	public ParkVisit createParkVisit() {
		return null;
	}

}

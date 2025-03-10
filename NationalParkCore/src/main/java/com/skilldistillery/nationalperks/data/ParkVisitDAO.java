package com.skilldistillery.nationalperks.data;

import java.util.List;

import com.skilldistillery.nationalperks.entities.ParkVisit;

public interface ParkVisitDAO {
	
	public List<ParkVisit> listUserParkVisits(int userId);
	
	public ParkVisit findParkVisitById(int parkVisitId);
	
	public ParkVisit createParkVisit(ParkVisit parkVisit, int userId);
	
	public ParkVisit editParkVisit (ParkVisit parkVisit, int parkVisitId);
	
	public List<ParkVisit> findParkVisitsByParkId (int parkId);
 
}

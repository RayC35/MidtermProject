package com.skilldistillery.nationalperks.data;

import java.util.List;

import com.skilldistillery.nationalperks.entities.AmenityVisit;

public interface AmenityVisitDAO {
	
	public AmenityVisit findAmenityVisitById(int amenityVisitId);
	
	public List<AmenityVisit> listAllAmenityVisitsByAmenityId(int amenityId);
	
	public List<AmenityVisit> listAllAmenityVisitsByUserId(int userId);
	
	public AmenityVisit createAmenityVisit(AmenityVisit amenityVisit);

}

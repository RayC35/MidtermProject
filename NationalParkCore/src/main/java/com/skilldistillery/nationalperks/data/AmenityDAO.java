package com.skilldistillery.nationalperks.data;

import java.util.List;

import com.skilldistillery.nationalperks.entities.Amenity;

public interface AmenityDAO {

	public List<Amenity> listAllAmenitiesByParkId(int parkId);
	public Amenity findAmenityById(int amenityId);
	public Amenity createAmenity(Amenity createdAmenity);
	Amenity adminEditAmenity(Amenity editedAmenity, int amenityId);
}

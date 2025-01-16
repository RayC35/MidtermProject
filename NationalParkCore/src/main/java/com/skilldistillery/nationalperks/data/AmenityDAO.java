package com.skilldistillery.nationalperks.data;

import java.util.List;

import com.skilldistillery.nationalperks.entities.Amenity;

public interface AmenityDAO {

	public List<Amenity> listAllAmenitiesByParkId(int parkId);

	public Amenity findAmenityById(int amenityId);

	public Amenity createAmenity(Amenity createdAmenity);
<<<<<<< HEAD

	public List<Amenity> listAllAmenities();
=======
	Amenity adminEditAmenity(Amenity editedAmenity, int amenityId);
>>>>>>> ade8808be6eb4dafadef3001439daa4fb3aa3974
}

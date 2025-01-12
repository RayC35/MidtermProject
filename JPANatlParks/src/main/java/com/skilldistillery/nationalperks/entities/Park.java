package com.skilldistillery.nationalperks.entities;

import java.time.LocalTime;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Park {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	private String description;
	@Column(name = "main_entrance_latitude")
	private Double mainEntranceLatitude;
	@Column(name = "main_entrance_longitude")
	private Double mainEntranceLongitude;
	@Column(name = "state_abbreviation")
	private String stateAbbreviation;
	@Column(name = "opening_time")
	private LocalTime openingTime;
	@Column(name = "closing_time")
	private LocalTime closingTime;
	@Column(name = "entry_fee")
	private Double entryFee;
	@Column(name = "website_url")
	private String websiteURL;
	@Column(name = "image_url")
	private String imageURL;
	
	@OneToMany(mappedBy = "park")
	private List<Amenity> amenities;
	@OneToMany(mappedBy="park")
	private List<ParkComment> parkComments;
	
	@OneToMany(mappedBy="park")
	private List<ParkVisit> parkVisits;

	public Park() {
	}

	
	public List<Amenity> getAmenities() {
		return amenities;
	}


	public void setAmenities(List<Amenity> amenities) {
		this.amenities = amenities;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getMainEntranceLatitude() {
		return mainEntranceLatitude;
	}

	public void setMainEntranceLatitude(Double mainEntranceLatitude) {
		this.mainEntranceLatitude = mainEntranceLatitude;
	}

	public Double getMainEntranceLongitude() {
		return mainEntranceLongitude;
	}

	public void setMainEntranceLongitude(Double mainEntranceLongitude) {
		this.mainEntranceLongitude = mainEntranceLongitude;
	}

	public String getStateAbbreviation() {
		return stateAbbreviation;
	}

	public void setStateAbbreviation(String stateAbbreviation) {
		this.stateAbbreviation = stateAbbreviation;
	}

	public LocalTime getOpeningTime() {
		return openingTime;
	}

	public void setOpeningTime(LocalTime openingTime) {
		this.openingTime = openingTime;
	}

	public LocalTime getClosingTime() {
		return closingTime;
	}

	public void setClosingTime(LocalTime closingTime) {
		this.closingTime = closingTime;
	}

	public Double getEntryFee() {
		return entryFee;
	}

	public void setEntryFee(Double entryFee) {
		this.entryFee = entryFee;
	}

	public String getWebsiteURL() {
		return websiteURL;
	}

	public void setWebsiteURL(String websiteURL) {
		this.websiteURL = websiteURL;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public List<ParkComment> getParkComments() {
		return parkComments;
	}

	public void setParkComments(List<ParkComment> parkComments) {
		this.parkComments = parkComments;
	}

	public List<ParkVisit> getParkVisits() {
		return parkVisits;
	}

	public void setParkVisits(List<ParkVisit> parkVisits) {
		this.parkVisits = parkVisits;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Park other = (Park) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Park [id=" + id + ", name=" + name + ", description=" + description + ", mainEntranceLatitude="
				+ mainEntranceLatitude + ", mainEntranceLongitude=" + mainEntranceLongitude + ", stateAbbreviation="
				+ stateAbbreviation + ", openingTime=" + openingTime + ", closingTime=" + closingTime + ", entryFee="
				+ entryFee + ", websiteURL=" + websiteURL + ", imageURL=" + imageURL + "]";
	}

}

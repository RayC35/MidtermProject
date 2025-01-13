package com.skilldistillery.nationalperks.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "amenity_visit")
public class AmenityVisit {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private Integer rating;
	
	private String remarks;
	
	@Column(name = "date_visited")
	private LocalDate dateVisited;
	
	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;

	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;
	
	private Boolean enabled;
	
	@ManyToOne
	@JoinColumn(name = "amenity_id")
	private Amenity amenity;
	
	@ManyToOne
	@JoinColumn(name = "park_visit_id")
	private ParkVisit parkvisit;
	
	@OneToMany(mappedBy = "amenityVisit")
	List<AmenityVisitComment> amenityVisitComments;

	public AmenityVisit() {
		super();
	}

	public List<AmenityVisitComment> getAmenityVisitComments() {
		return amenityVisitComments;
	}

	public void setAmenityVisitComments(List<AmenityVisitComment> amenityVisitComments) {
		this.amenityVisitComments = amenityVisitComments;
	}

	public ParkVisit getParkvisit() {
		return parkvisit;
	}

	public void setParkvisit(ParkVisit parkvisit) {
		this.parkvisit = parkvisit;
	}

	public Amenity getAmenity() {
		return amenity;
	}

	public void setAmenity(Amenity amenity) {
		this.amenity = amenity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String comment) {
		this.remarks = comment;
	}

	public LocalDate getDateVisited() {
		return dateVisited;
	}

	public void setDateVisited(LocalDate dateVisited) {
		this.dateVisited = dateVisited;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
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
		AmenityVisit other = (AmenityVisit) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Amenity_Visit [id=" + id + ", rating=" + rating + ", comment=" + remarks + ", dateVisited="
				+ dateVisited + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate + ", enabled=" + enabled
				+ "]";
	}
	
}

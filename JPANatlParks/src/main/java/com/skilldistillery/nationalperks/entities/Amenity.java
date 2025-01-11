package com.skilldistillery.nationalperks.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Amenity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@Column(name = "cost_range")
	private Integer costRange;
	
	@Column(name = "image_url")
	private String ImageURL;
	
	@Column(name = "website_url")
	private String websiteURL;
	
	private Double latitude;
	
	private Double longitude;
	
	private Boolean enabled;
	
	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;

	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;

	public Amenity() {
		super();
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

	public Integer getCostRange() {
		return costRange;
	}

	public void setCostRange(Integer costRange) {
		this.costRange = costRange;
	}

	public String getImageURL() {
		return ImageURL;
	}

	public void setImageURL(String imageURL) {
		ImageURL = imageURL;
	}

	public String getWebsiteURL() {
		return websiteURL;
	}

	public void setWebsiteURL(String websiteURL) {
		this.websiteURL = websiteURL;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
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
		Amenity other = (Amenity) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Amenity [id=" + id + ", name=" + name + ", description=" + description + ", costRange=" + costRange
				+ ", ImageURL=" + ImageURL + ", websiteURL=" + websiteURL + ", latitude=" + latitude + ", longitude="
				+ longitude + ", enabled=" + enabled + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate
				+ "]";
	}
	
	

}

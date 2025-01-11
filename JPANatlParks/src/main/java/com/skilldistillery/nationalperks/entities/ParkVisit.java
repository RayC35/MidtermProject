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
@Table(name = "park_visit")
public class ParkVisit {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private String remarks;
	@Column(name = "start_date")
	private LocalDate startDate;
	@Column(name = "end_date")
	private LocalDate endDate;
	private Integer rating;
	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;
	@Column(name = "image_url")
	private String imageURL;
	private Boolean published;
	private Boolean enabled;

	@ManyToOne
	@JoinColumn(name = "park_id")
	private Park park;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy = "parkVisit")
	private List<ParkVisitComment> parkVisitComments;

	@OneToMany(mappedBy = "parkVisit")
	private List<ParkVisitImage> parkVisitImages;

	public ParkVisit() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
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

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public Boolean getPublished() {
		return published;
	}

	public void setPublished(Boolean published) {
		this.published = published;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public Park getPark() {
		return park;
	}

	public void setPark(Park park) {
		this.park = park;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<ParkVisitComment> getParkVisitComments() {
		return parkVisitComments;
	}

	public void setParkVisitComments(List<ParkVisitComment> parkVisitComments) {
		this.parkVisitComments = parkVisitComments;
	}

	public List<ParkVisitImage> getParkVisitImages() {
		return parkVisitImages;
	}

	public void setParkVisitImages(List<ParkVisitImage> parkVisitImages) {
		this.parkVisitImages = parkVisitImages;
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
		ParkVisit other = (ParkVisit) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ParkVisit [id=" + id + ", title=" + title + ", remarks=" + remarks + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", rating=" + rating + ", createDate=" + createDate + ", lastUpdate="
				+ lastUpdate + ", imageURL=" + imageURL + ", published=" + published + ", enabled=" + enabled
				+ ", park=" + park + ", user=" + user + ", parkVisitComments=" + parkVisitComments
				+ ", parkVisitImages=" + parkVisitImages + "]";
	}

}

package com.skilldistillery.nationalperks.entities;

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
@Table(name = "amenity_visit_comment")
public class AmenityVisitComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String comment;
	
	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;

	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;
	
	private Boolean enabled;
	
	@ManyToOne
	@JoinColumn(name="amenity_visit_id")
	private AmenityVisit amenityVisit;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name= "in_reply_to_id")
	private AmenityVisitComment commentRepliedTo;
	
	@OneToMany(mappedBy="commentRepliedTo")
	private List<AmenityVisitComment> commentReplies;

	public AmenityVisitComment() {
		super();
	}


	public AmenityVisit getAmenityVisit() {
		return amenityVisit;
	}

	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public void setAmenityVisit(AmenityVisit amenityVisit) {
		this.amenityVisit = amenityVisit;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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

	public AmenityVisitComment getCommentRepliedTo() {
		return commentRepliedTo;
	}


	public void setCommentRepliedTo(AmenityVisitComment commentRepliedTo) {
		this.commentRepliedTo = commentRepliedTo;
	}


	public List<AmenityVisitComment> getCommentReplies() {
		return commentReplies;
	}


	public void setCommentReplies(List<AmenityVisitComment> commentReplies) {
		this.commentReplies = commentReplies;
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
		AmenityVisitComment other = (AmenityVisitComment) obj;
		return id == other.id;
	}


	@Override
	public String toString() {
		return "AmenityVisitComment [id=" + id + ", comment=" + comment + ", createDate=" + createDate + ", lastUpdate="
				+ lastUpdate + ", enabled=" + enabled + ", amenityVisit=" + amenityVisit + ", user=" + user
				+ ", commentRepliedTo=" + commentRepliedTo + ", commentReplies=" + commentReplies + "]";
	}


}

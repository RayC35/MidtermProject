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
	
	@Column(name = "in_reply_to_id")
	private Integer inReplyToId;
	
	private Boolean enabled;

	public AmenityVisitComment() {
		super();
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

	public Integer getInReplyToId() {
		return inReplyToId;
	}

	public void setInReplyToId(Integer inReplyToId) {
		this.inReplyToId = inReplyToId;
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
		AmenityVisitComment other = (AmenityVisitComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "AmenityVisitComment [id=" + id + ", comment=" + comment + ", createDate=" + createDate + ", lastUpdate="
				+ lastUpdate + ", inReplyToId=" + inReplyToId + ", enabled=" + enabled + "]";
	}
	
}

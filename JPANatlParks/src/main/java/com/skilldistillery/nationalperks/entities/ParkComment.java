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
@Table(name = "park_comment")
public class ParkComment {

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
	@JoinColumn(name = "park_id")
	private Park park;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "in_reply_to_id")
	private ParkComment commentRepliedTo;

	@OneToMany(mappedBy = "commentRepliedTo")
	private List<ParkComment> commentReplies;

	public ParkComment() {
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

	public ParkComment getCommentRepliedTo() {
		return commentRepliedTo;
	}

	public void setCommentRepliedTo(ParkComment commentRepliedTo) {
		this.commentRepliedTo = commentRepliedTo;
	}

	public List<ParkComment> getCommentReplies() {
		return commentReplies;
	}

	public void setCommentReplies(List<ParkComment> commentReplies) {
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
		ParkComment other = (ParkComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ParkComment [id=" + id + ", comment=" + comment + ", createDate=" + createDate + ", lastUpdate="
				+ lastUpdate + ", enabled=" + enabled + ", park=" + park + ", user=" + user + "]";
	}

}

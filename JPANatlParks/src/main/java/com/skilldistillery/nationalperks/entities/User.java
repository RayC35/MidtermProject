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
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private Boolean enabled;
	private String role;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	@Column(name = "image_url")
	private String imageURL;
	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;
	private String email;
	private String biography;
	
	@ManyToMany
	@JoinTable(name="wishlist_park",
	joinColumns =@JoinColumn(name="user_id"),
	inverseJoinColumns=@JoinColumn(name="park_id"))
	private List<Park> wishlistParks;
	
	@ManyToMany
	@JoinTable(name="favorite_park",
	joinColumns =@JoinColumn(name="user_id"),
	inverseJoinColumns=@JoinColumn(name="park_id"))
	private List<Park> favoriteParks;

	@ManyToMany
	@JoinTable(name="followed_user",
	joinColumns=@JoinColumn(name="user_id"),
	inverseJoinColumns=@JoinColumn(name="followed_user_id"))
	private List<User> following;
	
	@ManyToMany(mappedBy="following")
	private List<User> followers;
	
	@OneToMany(mappedBy="user")
	private List<AmenityVisitComment> amenityVisitComments;
	
	public User() {
	}
	

	public List<AmenityVisitComment> getAmenityVisitComments() {
		return amenityVisitComments;
	}



	public void setAmenityVisitComments(List<AmenityVisitComment> amenityVisitComments) {
		this.amenityVisitComments = amenityVisitComments;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getLastUpate() {
		return lastUpdate;
	}

	public void setLastUpate(LocalDateTime lastUpate) {
		this.lastUpdate = lastUpate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}
	
	public List<Park> getWishlistParks() {
		return wishlistParks;
	}

	public void setWishlistParks(List<Park> wishlistParks) {
		this.wishlistParks = wishlistParks;
	}

	public List<Park> getFavoriteParks() {
		return favoriteParks;
	}

	public void setFavoriteParks(List<Park> favoriteParks) {
		this.favoriteParks = favoriteParks;
	}
	

	public List<User> getFollowers() {
		return followers;
	}

	public void setFollowers(List<User> followers) {
		this.followers = followers;
	}

	public List<User> getFollowing() {
		return following;
	}

	public void setFollowing(List<User> following) {
		this.following = following;
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", firstName=" + firstName + ", lastName=" + lastName + ", imageURL=" + imageURL
				+ ", createDate=" + createDate + ", lastUpdate=" + lastUpdate + ", email=" + email + ", biography="
				+ biography + "]";
	}

}

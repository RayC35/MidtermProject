package com.skilldistillery.nationalperks.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPANatlParks");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		user = null;
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("test", user.getPassword());
		assertEquals(2025, user.getCreateDate().getYear());
	}
	
	@Test
	void test_User_Park_ManyToMany_favorite_mapping() {
		assertNotNull(user);
		assertTrue(user.getFavoriteParks().size() >0);
	}

	@Test
	void test_User_Park_ManyToMany_wishlist_mapping() {
		assertNotNull(user);
		user = em.find(User.class, 2);
		assertTrue(user.getWishlistParks().size() >0);
	}
	
	@Test
	void test_User_User_ManyToMany_follwers_mapping() {
		assertNotNull(user);
		assertTrue(user.getFollowers().size() == 0);
				
	}
	
	@Test
	void test_User_User_ManyToMany_following_mapping() {
		assertNotNull(user);
		assertTrue(user.getFollowing().size() > 0);
				
	}
	
	@Test
	void test_User_ParkVisitComment_OneToMany_mapping() {
		assertNotNull(user);
		assertTrue(user.getParkVisitComments().size() > 0);		
	}
	@Test
	void test_User_ParkVisit_OneToMany_mapping() {
		assertNotNull(user);
		assertTrue(user.getParkVisits().size() > 0);		
	}
}

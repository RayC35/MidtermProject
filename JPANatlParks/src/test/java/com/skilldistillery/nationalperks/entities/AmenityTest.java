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

public class AmenityTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Amenity amenity;
	
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
		amenity = em.find(Amenity.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		amenity = null;
		em.close();
	}

	@Test
	void test_Amenity_entity_mapping() {
		assertNotNull(amenity);
		assertEquals("Yosemite Visitor Center", amenity.getName());
	}
	@Test
	void test_Amenity_Park_ManyToOne_mapping() {
		assertNotNull(amenity);
		assertEquals("Yosemite", amenity.getPark().getName());
	}
	@Test
	void test_Amenity_AmenityVisits_OneToMany_mapping() {
		assertNotNull(amenity);
		assertTrue(amenity.getAmenityVisits().size() > 0);
	}
	@Test
	void test_Amenity_AmenityCategories_ManyToMany_mapping() {
		assertNotNull(amenity);
		assertTrue(amenity.getAmenityCategories().size() > 0);
	}

}


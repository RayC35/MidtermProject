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

class ParkTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Park park;

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
		park = em.find(Park.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		park = null;
		em.close();
	}

	@Test
	void test_Park_entity_mapping() {
		assertNotNull(park);
		assertEquals("Yosemite", park.getName());
	}
	@Test
	void test_Park_Amenity_OneToMany_mapping() {
		assertNotNull(park);
		assertTrue(park.getAmenities().size() > 0);
	}
	

}

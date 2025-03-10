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

class ParkVisitTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ParkVisit visit;

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
		visit = em.find(ParkVisit.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		visit = null;
		em.close();
	}

	@Test
	void test_ParkVisit_entity_mapping() {
		assertNotNull(visit);
		assertEquals(5, visit.getRating());
	}
	@Test
	void test_ParkVisit_AmenityVisit_OneToMany_mapping() {
		assertNotNull(visit);
		assertTrue(visit.getAmenityVisits().size() > 0);
	}

	@Test
	void test_ParkVisit_Park_ManyToOne_entity_mapping() {
		assertNotNull(visit);
		assertEquals(1, visit.getPark().getId());
	}
	
	@Test
	void test_ParkVisit_User_ManyToOne_entity_mapping() {
		assertNotNull(visit);
		assertEquals(4, visit.getUser().getId());
	}
	
	@Test
	void test_ParkVisit__ParkVisitComment_OneToMany_entity_mapping() {
		assertNotNull(visit);
		assertTrue(visit.getParkVisitComments().size() > 0);
	}
	
	@Test
	void test_ParkVisit__ParkVisitImages_OneToMany_entity_mapping() {
		assertNotNull(visit);
		assertTrue(visit.getParkVisitImages().size() > 0);
	}
}

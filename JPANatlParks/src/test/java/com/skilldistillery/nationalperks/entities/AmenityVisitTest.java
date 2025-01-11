package com.skilldistillery.nationalperks.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class AmenityVisitTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private AmenityVisit amenityVisit;

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
		amenityVisit = em.find(AmenityVisit.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		amenityVisit = null;
		em.close();
	}

	@Test
	void test_AmenityVisit_entity_mapping() {
		assertNotNull(amenityVisit);
		assertEquals(5, amenityVisit.getRating());
	}

}


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

class ParkVisitImageTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ParkVisitImage image;

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
		image = em.find(ParkVisitImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		image = null;
		em.close();
	}

	@Test
	void test_ParkVisitImage_entity_mapping() {
		assertNotNull(image);
		assertEquals("test park_visit_image", image.getDescription());
	}

}

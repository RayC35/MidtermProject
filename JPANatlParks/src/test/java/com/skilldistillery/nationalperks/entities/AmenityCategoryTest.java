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

public class AmenityCategoryTest {
	
		private static EntityManagerFactory emf;
		private EntityManager em;
		private AmenityCategory amenityCategory;
		
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
			amenityCategory = em.find(AmenityCategory.class, 1);
		}

		@AfterEach
		void tearDown() throws Exception {
			amenityCategory = null;
			em.close();
		}

		@Test
		void test_AmenityCategory_entity_mapping() {
			assertNotNull(amenityCategory);
			assertEquals("Visitor's Center", amenityCategory.getName());
		}

	}


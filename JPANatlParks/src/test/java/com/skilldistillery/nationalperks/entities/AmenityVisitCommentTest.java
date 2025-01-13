package com.skilldistillery.nationalperks.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class AmenityVisitCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private AmenityVisitComment amenityVisitComment;
	
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
		amenityVisitComment = em.find(AmenityVisitComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		amenityVisitComment = null;
		em.close();
	}

	@Test
	void test_AmenityVisitComment_entity_mapping() {
		assertNotNull(amenityVisitComment);
		assertEquals("Thanks for this great review, Lisa!", amenityVisitComment.getComment());
	}
	@Test
	void test_AmenityVisitComment_AmenityVisit_ManyToOne_mapping() {
		assertNotNull(amenityVisitComment);
		assertEquals(2, amenityVisitComment.getAmenityVisit().getId());
	}
	
	@Test
	void test_AmenityVisitComment_User_ManyToOne_mapping() {
		assertNotNull(amenityVisitComment);
		assertEquals("parksKingKong", amenityVisitComment.getUser().getUsername());
	}
	
	@Test
	void test_AmenityVisitComment_CommentReplies_ManyToOne_mapping() {
		assertNotNull(amenityVisitComment);
		assertNull(amenityVisitComment.getCommentRepliedTo());
	}

}

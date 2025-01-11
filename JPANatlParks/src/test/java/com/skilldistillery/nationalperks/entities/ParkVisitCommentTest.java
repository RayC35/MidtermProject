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

class ParkVisitCommentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ParkVisitComment comment;

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
		comment = em.find(ParkVisitComment.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		comment = null;
		em.close();
	}

	@Test
	void test_Park_entity_mapping() {
		assertNotNull(comment);
		assertEquals("in reply to ", comment.getComment());
	}
	
	@Test
	void test_ParkVisitComment_ParkVisit_ManyToOne_entity_mapping() {
		assertNotNull(comment);
		assertEquals(1, comment.getParkVisit().getId());
	}
	
	@Test
	void test_ParkVisitComment_User_ManyToOne_entity_mapping() {
		assertNotNull(comment);
		assertEquals(2, comment.getUser().getId());
	}
	
	@Test
	void test_ParkVisitComment_CommentRepliedTo_ManyToOne_entity_mapping() {
		assertNotNull(comment);
		assertEquals(1, comment.getCommentRepliedTo().getId());
	}
	
	@Test
	void test_ParkVisitComment_CommentReplies_OneToMany_entity_mapping() {
		assertNotNull(comment);
		assertTrue(comment.getCommentReplies().size() == 0);
		comment = em.find(ParkVisitComment.class, 1);
		assertTrue(comment.getCommentReplies().size() > 0);
	}


}

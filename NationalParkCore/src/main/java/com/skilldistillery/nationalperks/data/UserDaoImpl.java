package com.skilldistillery.nationalperks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalperks.entities.Park;
import com.skilldistillery.nationalperks.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";
		User authenticatedUser = null;
		try {
			authenticatedUser = em.createQuery(jpql, User.class).setParameter("un", username)
					.setParameter("pw", password).getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid User: " + username);
			e.printStackTrace();
		}
		return authenticatedUser;
	}

	@Override
	public User registerUser(User user) {
		user.setEnabled(true);
		user.setRole("user");
		em.persist(user);
		return user;
	}

	@Override
	public User editUserProfile(User user, int userId) {
		User managedUser = em.find(User.class, userId);
		managedUser.setFirstName(user.getFirstName());
		managedUser.setLastName(user.getLastName());
		managedUser.setPassword(user.getPassword());
		managedUser.setEmail(user.getEmail());
		managedUser.setBiography(user.getBiography());
		managedUser.setImageURL(user.getImageURL());
		em.persist(managedUser);
		return managedUser;
	}

	@Override
	public List<User> listAllUsers() {
		String jpql = "SELECT u FROM User u";
		List<User> allUsers = em.createQuery(jpql, User.class).getResultList();
		return allUsers;
	}

	@Override
	public User findUserProfileById(int userId) {
		User foundUser = null;
		try {
			foundUser = em.find(User.class, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return foundUser;
	}

}

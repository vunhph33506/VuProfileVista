package com.VuProfileVista.controller.dao;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.VuProfileVista.model.User;
import com.VuProfileVista.utils.JPAUtils;

public class UserDao {
	private EntityManager em = JPAUtils.getEntityManager();

	@SuppressWarnings("removal")
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

	public User getLogin(String username, String password) {
		try {
			String jpql = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			query.setParameter("password", password);
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public java.util.List<User> findAll() {
		try {
			String jpql = "SELECT u FROM User u";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	public User findByUsername(String username) {
		try {
			TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.username = :username", User.class);
			query.setParameter("username", username);
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public Boolean save(User user) {
		try {
			em.getTransaction().begin();
			em.persist(user);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			return false;
		}
	}

	public Boolean update(User user) {
		try {
			em.getTransaction().begin();
			em.merge(user);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			return false;
		}
	}

	public Boolean delete(Integer id) {
		try {
			em.getTransaction().begin();
			User u = em.find(User.class, id);
			em.remove(u);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}
}

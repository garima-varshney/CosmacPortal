package com.sample.CosmacBack.dao;

import org.hibernate.SessionFactory;

import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sample.CosmacBack.model.Authorization;
import com.sample.CosmacBack.model.Billing;
import com.sample.CosmacBack.model.Product;
import com.sample.CosmacBack.model.Shipping;
import com.sample.CosmacBack.model.Users;

@Repository("usersDao")
@Transactional
public class UsersDaoImpl implements UsersDao {

	@Autowired
	private SessionFactory sessionFactory;

	public boolean addUser(Users u) {
		Session s = sessionFactory.getCurrentSession();
		try 
		{
			System.out.println("-- UsersDaoImpl -- addUser begins -- ");
			u.getBilling().setUsers(u);
			u.getShipping().setU(u);
			u.setEnable(true);
			System.out.println("-- UsersDaoImpl -- Persisting user data --");
			s.persist(u);
			System.out.println("-- UsersDaoImpl -- Persisting billing data --");
			s.persist(u.getBilling());
			System.out.println("-- UsersDaoImpl -- Persisting shipping data --");
			s.persist(u.getShipping());
			System.out.println("-- UsersDaoImpl -- Authorizing user --");
			Authorization auth = new Authorization();
			auth.setRole("ROLE_USER");
			auth.setUserId(u.getEmail());
			System.out.println("User role: " + auth.getRole());
			System.out.println("User id: " + auth.getUserId());
			System.out.println("Role id: " + auth.getRoleId());
			System.out.println("-- UsersDaoImpl -- Persisting Authorization --");
			s.persist(auth);
			System.out.println("-- UsersDaoImpl -- addUser ends -- ");
			return true;
		} catch (Exception e) {
			System.out.println("-- ERROR --");
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateUser(Users u) {
		Session s = sessionFactory.getCurrentSession();
		try {
			System.out.println("-- UsersDaoImpl -- updateUser begins -- ");
			s.update(u);
			System.out.println("-- UsersDaoImpl -- updateUser ends -- ");
			return true;
		} catch (Exception e) {
			System.out.println("-- ERROR --");
			e.printStackTrace();
			return false;
		}

	}

	public boolean deleteUserById(int userId) {
		Session s = sessionFactory.getCurrentSession();
		Users u = (Users) s.get(Users.class, userId);
		try {
			System.out.println("-- UserDaoImlp ---- deleteUserById begins -- ");
			s.delete(u);
			System.out.println("-- UserDaoImlp ---- deleteUserById ends -- ");
			return true;
		} catch (Exception e) {
			System.out.println("-- ERROR --");
			e.printStackTrace();
			return false;
		}
	}

	public Users getUserById(int userId) {
		Session s = sessionFactory.getCurrentSession();
		try {
			System.out.println("-- UserDaoImlp ---- getUserById begins -- ");
			Users u = (Users) s.get(Users.class, userId);
			System.out.println("-- UserDaoImlp ---- getUserById ends -- ");
			return u;
		} catch (Exception e) {
			System.out.println("-- ERROR --");
			e.printStackTrace();
			return null;
		}
	}

	public Users getUserByUsername(String uname) {
		Session s = sessionFactory.getCurrentSession();
		try {
			System.out.println("-- UserDaoImlp ---- getUserByUsername begins -- ");
			Query query = s.createQuery("from Users where email=:uname").setParameter("uname", uname);			
			Users u = (Users) query.uniqueResult();
			System.out.println("-- UserDaoImlp ---- getUserByUsername ends -- ");
			return u;
		} catch (Exception e) {
			System.out.println("-- ERROR --");
			e.printStackTrace();
			return null;
		}
	}

	public List<Users> displayUsers() {
		Session s = sessionFactory.getCurrentSession();
		try{
			System.out.println("-- UserDaoImlp ---- DisplayUsers begins -- ");
			Query query = s.createQuery("from Users");
			List<Users> list = (List<Users>) query.list();
			System.out.println("-- UserDaoImlp ---- DisplayUsers ends -- ");
			return list;
		}
		catch(Exception e){
			System.out.println("-- ERROR --");
			e.printStackTrace();			
			return null;
		}
	}

}
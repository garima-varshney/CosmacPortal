package com.sample.CosmacBack.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.NonUniqueResultException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sample.CosmacBack.model.Cart;

@Repository("cartDao")
@Transactional
public class CartDaoImpl implements CartDao {

	@Autowired(required = true)
	SessionFactory sessionFactory;

	/* Method to add element to Cart */
	public boolean addToCart(Cart c) {
		System.out.println("-- Starting addToCart method of cartDaoImpl --");
		Session session = sessionFactory.getCurrentSession();
		try {
			session.persist(c);
			System.out.println("--  CartDaoImpl -- One element added to Cart -- ");
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("Exception occured" + e);
			throw e;
		}
	}

	public boolean updateCart(Cart c) {
		System.out.println("-- Starting updateCart method in cartDaoImpl -- ");
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(c);
			System.out.println("-- CartDaoImpl -- Cart updated -- ");
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("Exception occured" + e);
			throw e;
		}
	}

	public boolean deleteItem(int id) {
		System.out.println(" -- Starting deleteItem method of cartDaoImpl -- ");
		Session session = sessionFactory.getCurrentSession();
		try {
			Cart c = (Cart) session.get(Cart.class, id);
			session.delete(c);
			System.out.println("-- CartDaoImpl -- Cart element deleted -- ");
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("Exception occured" + e);
			throw e;
		}
	}

	public Cart getCartById(int id) {
		System.out.println("-- Starting getCartById method in cartDaoImpl -- ");
		Session session = sessionFactory.getCurrentSession();
		try {
			Cart c = (Cart) session.get(Cart.class, id);
			System.out.println("-- CartDaoImpl -- getCartById ends here -- ");
			return c;
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("Exception occured" + e);
			throw e;
		}
	}

	public List<Cart> displayCart(String username) {
		System.out.println("CartDaoImpl -- displayCart -- Starting displayCart method");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("from Cart where username='" + username + "' and status='NEW'");
			List<Cart> list = (List<Cart>) query.list();
			System.out.println("CartDaoImpl -- displayCart -- obatined query -- result --" + list);
			return list;
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("Exception occured" + e);
			throw e;
		}
	}

	public int clearCart(String username) {
		System.out.println("-- CartDaoImpl -- clearCart -- Begins --");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("delete from Cart where username='" + username + "'");
			System.out.println("-- CartDaoImpl -- clearCart ends here --");
			return query.executeUpdate();
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("Exception occured" + e);
			throw e;
		}
	}

	public int getQuantity(String username, String pName) {
		System.out.println("-- CartDaoImpl -- getQuantity -- Begins --");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery(
					"Select quantity from Cart where username='" + username + "'and productName='" + pName + "'");
			Integer result = (Integer) query.uniqueResult();
			System.out.println("-- CartDaoImpl -- getQuantity ends here -- Returning obtained quantity --");
			return result;
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("Exception occured" + e);
			throw e;
		}
	}

	public long getTotalAmount(String username) {
		System.out.println("-- CartDaoImpl -- getTotalAmount -- Begins --");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery(
					"Select SUM(price*quantity) from Cart where username='" + username + "' and status='NEW'");
			if (query.uniqueResult() == null) {
				System.out.println("-- CartDaoImpl -- getTotalAmount ends here -- Result was Null");
				return 0;
			} else {
				long result = (Long) query.uniqueResult();
				System.out.println("-- CartDaoImpl -- getTotalAmount ends here -- Result is " + result);
				return result;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("Exception occured" + e);
			throw e;
		}
	}

	public Cart getCartByUsername(String username, String pName) {
		System.out.println("-- CartDaoImpl -- getCartByUsername -- begins!");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery(
					"from Cart WHERE username='" + username + "'and productName='" + pName + "' and status = 'NEW'");
			if (query.uniqueResult() == null) {
				System.out.println("-- CartDaoImpl -- getCartByUsername ends here -- Query Result is -- " + query.uniqueResult());
				return null;
			} else {
				Cart cart = (Cart) query.uniqueResult();
				System.out.println("-- CartDaoImpl -- getCartByUsername ends here -- CART is -- " + cart + "username"
						+ cart.getUsername() + "  " + cart.getCartId());
				return cart;
			}
		} catch (HibernateException e) {
			System.out.println("--- HibernateException ---- ");
			e.printStackTrace();
			throw e;
		}
	}

	public long getNumberOfProducts(String username) {
		System.out.println("-- CartDaoImpl -- getNumberOfProducts -- Begins --");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session
					.createQuery("Select SUM(quantity) from Cart where username='" + username + "' and status='NEW'");
			if (query.uniqueResult() == null) {
				System.out.println("-- CartDaoImpl -- getNumberOfProducts ends here -- result is NULL ");
				return 0;
			} else {
				long result = (Long) query.uniqueResult();
				System.out.println("-- CartDaoImpl -- getNumberOfProducts ends here -- result -- " + result);
				return result;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("Exception occured" + e);
			throw e;
		}
	}

}
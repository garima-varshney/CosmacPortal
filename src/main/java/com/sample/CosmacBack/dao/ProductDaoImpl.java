package com.sample.CosmacBack.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sample.CosmacBack.model.Product;

@Repository("productDao")
@Transactional
public class ProductDaoImpl implements ProductDao {

	@Autowired	
	HttpSession httpSession;

	@Autowired
	private SessionFactory sessionFactory;

	public boolean addProduct(Product p) {
		Session session = sessionFactory.getCurrentSession();
		try {
			System.out.println("ProductDaoImpl -- addProduct begins -- ");
			session.persist(p);
			System.out.println("ProductDaoImpl -- addProduct ends -- ");
			return true;
		} catch (Exception e) {
			System.out.println("Exception occured " + e);
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateProduct(Product p) {
		Session session = sessionFactory.getCurrentSession();
		try {
			System.out.println("ProductDaoImpl -- updateProduct begins -- ");
			session.update(p);
			System.out.println("ProductDaoImpl -- updateProduct ends -- ");
			return true;
		} catch (Exception e) {
			System.out.println("Exception occured " + e);
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteProductById(int prodId) {
		Session session = sessionFactory.getCurrentSession();
		try {
			System.out.println("ProductDaoImpl -- deleteProductById begins -- ");
			Product p = (Product) session.get(Product.class, prodId);
			session.delete(p);
			System.out.println("ProductDaoImpl -- deleteProductById ends -- ");
			return true;
		} catch (Exception e) {
			System.out.println("Exception occured " + e);
			e.printStackTrace();
			return false;
		}
	}

	public Product displayProductById(int prodId) {
		Session session = sessionFactory.getCurrentSession();
		try {
			System.out.println("ProductDaoImpl -- displayProductById begins -- ");
			Product p = (Product) session.get(Product.class, prodId);
			System.out.println("ProductDaoImpl -- displayProductById ends -- ");
			return p;
		} catch (Exception e) {
			System.out.println("Exception occured " + e);
			e.printStackTrace();
			return null;
		}
	}

	public List<Product> displayProduct() {
		Session session = sessionFactory.getCurrentSession();
		try {
			System.out.println("ProductDaoImpl -- displayProduct begins -- ");
			Query query = session.createQuery("from Product");
			List<Product> list = (List<Product>) query.list();
			System.out.println("ProductDaoImpl -- displayProduct ends -- ");
			return list;
		} catch (Exception e) {
			System.out.println("Exception occured " + e);
			e.printStackTrace();
			return null;
		}
	}

	public List<Product> displayProductByCategory(String catId) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("ProductDaoImpl -- displayProductByCategory begins -- ");
			Query query = session.createQuery("from Product where catid=:catId").setParameter("catId", catId);
			List<Product> list = (List<Product>) query.list();	
			System.out.println("ProductDaoImpl -- displayProductByCategory ends -- ");
			return list;
		}
		catch (Exception e) 
		{
			System.out.println("Exception occured " + e);
			e.printStackTrace();
			return null;
		}
	}
}
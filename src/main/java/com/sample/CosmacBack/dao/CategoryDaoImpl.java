package com.sample.CosmacBack.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sample.CosmacBack.model.Category;

@Repository("categoryDao")
@Transactional
public class CategoryDaoImpl implements CategoryDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public boolean addCategory(Category c) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("CategoryDaoImpl -- addCategory begins");
			c.setCategoryId(c.getCategoryName());
			session.persist(c);
			System.out.println("CategoryDaoImpl -- addCategory ends");
			return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateCategory(Category c) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("CategoryDaoImpl -- updateCategory begins");
			session.update(c);
			System.out.println("CategoryDaoImpl -- updateCategory ends");
			return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteCategoryById(String catId) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("CategoryDaoImpl -- deleteCategoryById begins");
			Category c = (Category)session.get(Category.class,catId);
			session.delete(c);
			System.out.println("CategoryDaoImpl -- deleteCategoryById ends");
			return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return false;
		}
	}

	public Category displayCategoryById(String catId) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("CategoryDaoImpl -- displayCategoryById begins");
			Category c = (Category)session.get(Category.class,catId);
			System.out.println("CategoryDaoImpl -- displayCategoryById ends");
			return c;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return null;
		}
	}

	public List<Category> displayCategory() {
		Session session = sessionFactory.getCurrentSession();
		try{
			System.out.println("CategoryDaoImpl -- displayCategory begins");
			Query query=session.createQuery("from Category");
			List<Category> list = (List<Category>) query.list();
			System.out.println("CategoryDaoImpl -- displayCategory ends");
			return list;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return null;
		}
	}

}
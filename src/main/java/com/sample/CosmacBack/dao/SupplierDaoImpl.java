package com.sample.CosmacBack.dao;

import java.util.List;
import java.util.UUID;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sample.CosmacBack.model.Supplier;

@Repository("supplierDao")
@Transactional
public class SupplierDaoImpl implements SupplierDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public boolean addSupplier(Supplier s) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("SupplierDaoImpl -- addSupplier begins -- ");
			s.setSuppId(s.getSuppNm()+"_"+(UUID.randomUUID().toString().substring(0,4)));
			session.persist(s);
			System.out.println("SupplierDaoImpl -- addSupplier ends -- ");
			return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateSupplier(Supplier s) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("SupplierDaoImpl -- updateSupplier begins -- ");
			session.update(s);
			System.out.println("SupplierDaoImpl -- updateSupplier ends -- ");
			return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteSupplierById(String suppId) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("SupplierDaoImpl -- deleteSupplierById begins -- ");
			Supplier s = (Supplier)session.get(Supplier.class,suppId);
			session.delete(s);
			System.out.println("SupplierDaoImpl -- deleteSupplierById ends -- ");
			return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return false;
		}			
	}

	public boolean deleteSupplier(Supplier s) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("SupplierDaoImpl -- deleteSupplier begins -- ");
			session.delete(s);
			System.out.println("SupplierDaoImpl -- deleteSupplier ends -- ");
			return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return false;
		}
	}

	public Supplier displaySupplierById(String suppId) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("SupplierDaoImpl -- displaySupplierById begins -- ");
			Supplier s = (Supplier)session.get(Supplier.class,suppId);
			System.out.println("SupplierDaoImpl -- displaySupplierById ends -- ");
			return s;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return null;
		}
	}

	public List<Supplier> displaySuppliers() {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("SupplierDaoImpl -- displaySuppliers begins -- ");
			Query query = session.createQuery("from Supplier");
			List<Supplier> list = (List<Supplier>) query.list();
			System.out.println("SupplierDaoImpl -- displaySuppliers ends -- ");
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

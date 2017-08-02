package com.sample.CosmacBack.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sample.CosmacBack.model.CustomerOrder;
import com.sample.CosmacBack.model.Users;

@Repository("customerOrderDao")
@Transactional
public class CustomerOrderDaoImpl implements CustomerOrderDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public boolean addCustomerOrder(CustomerOrder customerOrder) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("CustomerOrderDaoImpl -- addCustomerOrder begins");
			Users u = customerOrder.getUsers();
			customerOrder.setCustomerBilling(u.getBilling());
			customerOrder.setCustomerShipping(u.getShipping());
			customerOrder.setOrderStatus("Placed");
			session.saveOrUpdate(customerOrder);
			session.saveOrUpdate(u.getBilling());
			session.saveOrUpdate(u.getShipping());
			System.out.println("CustomerOrderDaoImpl -- addCustomerOrder ends");
			return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return false;
		}
	}

	public List<CustomerOrder> getAllOrders() {
		Session session = sessionFactory.getCurrentSession();
		try{
			System.out.println("CustomerOrderDaoImpl -- getAllOrders begins");
			Query query=session.createQuery("from CustomerOrder");
			List<CustomerOrder> list = (List<CustomerOrder>) query.list();
			System.out.println("CustomerOrderDaoImpl -- getAllOrders ends");
			return list;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return null;
		}
	}	

	public CustomerOrder getCustomerOrderById(int id) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("CustomerOrderDaoImpl -- getCustomerOrderById begins");
			CustomerOrder c = (CustomerOrder)session.get(CustomerOrder.class,id);
			System.out.println("CustomerOrderDaoImpl -- getCustomerOrderById ends");
			return c;
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return null;
		}	
	}

	public int changeOrderStatus(int id, String status) {
		Session session = sessionFactory.getCurrentSession();
		try
		{
			System.out.println("CustomerOrderDaoImpl -- changeOrderStatus begins");
			Query query = session.createQuery("UPDATE CustomerOrder SET orderStatus = '" + status + "' where id = " + id);
			System.out.println("CustomerOrderDaoImpl -- changeOrderStatus ends");
			return query.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("Exception occured "+e);
			e.printStackTrace();
			return 0;
		}	
	}

}
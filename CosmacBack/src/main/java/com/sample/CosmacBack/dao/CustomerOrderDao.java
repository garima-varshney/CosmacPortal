package com.sample.CosmacBack.dao;

import java.util.List;

import com.sample.CosmacBack.model.CustomerOrder;

public interface CustomerOrderDao {

		public boolean addCustomerOrder(CustomerOrder customerOrder);
		public List<CustomerOrder> getAllOrders();
		public CustomerOrder getCustomerOrderById(int id);
		public int changeOrderStatus(int id, String status);
		
}

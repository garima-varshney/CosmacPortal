package com.sample.CosmacBack.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.stereotype.Component;

@Entity
@Component
public class CustomerOrder implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "billing_Id")
	private Billing CustomerBilling;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "shipping_Id")
	private Shipping CustomerShipping;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "user_Id")
	private Users users;

	private String orderStatus;
	
	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Billing getCustomerBilling() {
		return CustomerBilling;
	}

	public void setCustomerBilling(Billing customerBilling) {
		CustomerBilling = customerBilling;
	}

	public Shipping getCustomerShipping() {
		return CustomerShipping;
	}

	public void setCustomerShipping(Shipping customerShipping) {
		CustomerShipping = customerShipping;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}
	
}
package com.sample.CosmacBack.model;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.*;

import org.hibernate.validator.constraints.*;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name="BILLING_DETAILS")
public class Billing implements Serializable {

	public Billing()
	{
		billId = UUID.randomUUID().toString().toUpperCase();
	}

	private static final long serialVersionUID = 1L;
	
	@Id	
	@Column(name="Billing_Id")
	private String billId;

	@NotEmpty(message = "*cannot be null")
	@Column(name="Address")
	private String addLine;	

	@NotEmpty(message = "*cannot be null")
	@Column(name="City")
	private String city;
	
	@NotEmpty(message = "*cannot be null")
	@Column(name="State")
	private String state;
	
	@NotEmpty(message = "*cannot be null")
	@Column(name="Zipcode")
	private String zipcode;
	
	@NotEmpty(message = "*cannot be null")
	@Column(name="Country")
	private String country;
	
	@OneToOne(mappedBy="billing")
	Users users;

	@OneToOne(mappedBy="CustomerBilling")
	CustomerOrder customerOrder;

	public String getBillId() {
		return billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}

	public String getAddLine() {
		return addLine;
	}

	public void setAddLine(String addLine) {
		this.addLine = addLine;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public CustomerOrder getCustomerOrder() {
		return customerOrder;
	}

	public void setCustomerOrder(CustomerOrder customerOrder) {
		this.customerOrder = customerOrder;
	}
	
}
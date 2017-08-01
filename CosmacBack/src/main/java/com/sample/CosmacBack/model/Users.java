package com.sample.CosmacBack.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.*;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "USER_DETAILS")
public class Users implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name = "UserId")
	private int userId;

	@NotEmpty(message = "*cannot be null")
	@Column(name = "First_Name")
	private String fName;

	@NotEmpty(message = "*cannot be null")
	@Column(name = "Last_Name")
	private String lName;
	
	@NotEmpty(message = "*cannot be null")
	@Email(message="*enter a valid email address")
	@Pattern(regexp=".+@.+\\..+", message="*enter a valid email address")	
	@Column(name = "Email", unique = true)
	private String email;

	@NotEmpty(message = "*cannot be null")
	@Size(min=4,max=12,message="*should be 4-12 characters")
	@Column(name = "Username")
	private String uname;

	@NotEmpty(message = "*cannot be null")
	@Size(min=6,max=14,message="*should be 6-14 characters")
	@Column(name = "Password")
	private String pass;
	
	@NotEmpty(message = "*cannot be null")
	@Pattern(regexp="[0-9]{10}", message="*enter a valid number")	
	@Column(name = "MobileNo")
	private String mobile;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="billId")
	private Billing billing;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="shipId")
	private Shipping shipping;

	@OneToMany(mappedBy="userDetails",fetch=FetchType.EAGER,cascade=CascadeType.REMOVE)
	private List<Cart> cart;
	
	@OneToOne(mappedBy="users")
	CustomerOrder customerOrder;

	private boolean enable;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Billing getBilling() {
		return billing;
	}

	public void setBilling(Billing billing) {
		this.billing = billing;
	}

	public Shipping getShipping() {
		return shipping;
	}

	public void setShipping(Shipping shipping) {
		this.shipping = shipping;
	}

	public List<Cart> getCart() {
		return cart;
	}

	public void setCart(List<Cart> cart) {
		this.cart = cart;
	}

	public CustomerOrder getCustomerOrder() {
		return customerOrder;
	}

	public void setCustomerOrder(CustomerOrder customerOrder) {
		this.customerOrder = customerOrder;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

}
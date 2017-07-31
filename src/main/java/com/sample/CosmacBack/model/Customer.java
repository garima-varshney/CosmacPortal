package com.sample.CosmacBack.model;

import java.io.Serializable;
import java.util.UUID;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "CUSTOMER_DETAILS")
public class Customer implements Serializable {

	private static final long serialVersionUID = 1L;

	public Customer() {
		custId = UUID.randomUUID().toString().substring(0, 15).toUpperCase();
	}

	@Id
	@Column(name = "Customer_Id")
	private String custId;

	@NotEmpty(message = "*cannot be null")
	@Column(name = "Email", unique = true)
	private String email;

	@NotEmpty(message = "*cannot be null")
	@Column(name = "Username", unique = true)
	private String uname;

	@NotEmpty(message = "*cannot be null")
	@Size(min = 6, max = 14)
	@Column(name = "Password")
	private String pass;

	@NotEmpty(message = "*cannot be null")
	@Size(min = 10, max = 10)
	@Column(name = "MobileNo", unique = true)
	private String mobile;
	
	private String bill_Id;
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="bill_Id" ,insertable=false,nullable=false,updatable=false)
	private Billing billing;

	private String shipp_Id;
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="shipp_Id" ,insertable=false,nullable=false,updatable=false)
	private Shipping shipping;
	
	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

}
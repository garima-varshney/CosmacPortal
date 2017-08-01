package com.sample.CosmacBack.model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.*;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name="SUPPLIERS")
public class Supplier implements Serializable{

	private static final long serialVersionUID = 1L;
		
	@Id
	@Column(name="SupplierId")
	private String suppId;

	@NotEmpty(message = "*cannot be null")
	@Column(name="SupplierName")
	private String suppNm;

	@NotEmpty(message = "*cannot be null")
	@Column(name="SupplierLocation")
	private String suppLcn;
	
	@OneToMany(mappedBy="supplier",fetch=FetchType.EAGER,cascade=CascadeType.REMOVE)
	Set<Product>getproduct;
	
	public String getSuppId() {
		return suppId;
	}

	public void setSuppId(String suppId) {
		this.suppId = suppId;
	}

	public String getSuppNm() {
		return suppNm;
	}

	public void setSuppNm(String suppNm) {
		this.suppNm = suppNm;
	}

	public String getSuppLcn() {
		return suppLcn;
	}

	public void setSuppLcn(String suppLcn) {
		this.suppLcn = suppLcn;
	}

}

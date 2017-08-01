package com.sample.CosmacBack.model;

import java.io.Serializable;
import javax.persistence.*;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Component
@Table(name = "PRODUCTS")
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name = "Product_Id")
	private int prdId;

	@NotEmpty(message = "*cannot be null")
	@Column(name = "Product_Name")
	private String prName;

	String catid;
	@ManyToOne
	@JoinColumn(name = "catid", insertable = false, nullable = false, updatable = false)
	Category category;

	String supplierId;
	@ManyToOne
	@JoinColumn(name = "supplierid", insertable = false, nullable = false, updatable = false)
	Supplier supplier;

	@Column(name = "Price")
	private long price;

	@NotEmpty(message = "*cannot be null")
	@Column(name = "Product_Description")
	private String prodDesc;

	@Column(name = "Quantity")
	private int quantity;
	
	@Transient
	MultipartFile image;

	public int getPrdId() {
		return prdId;
	}

	public void setPrdId(int prdId) {
		this.prdId = prdId;
	}

	public String getPrName() {
		return prName;
	}

	public void setPrName(String prName) {
		this.prName = prName;
	}

	public String getCatid() {
		return catid;
	}

	public void setCatid(String catid) {
		this.catid = catid;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getProdDesc() {
		return prodDesc;
	}

	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
}
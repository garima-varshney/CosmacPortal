package com.sample.CosmacBack.model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.*;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name="CATEGORIES")
public class Category implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="CategoryId")
	private String categoryId;

	@NotEmpty(message = "*cannot be null")
	@Column(name="CategoryName")
	private String categoryName;

	@NotEmpty(message = "*cannot be null")
	@Column(name="CategoryDescription")
	private String categoryDesc;	

	@OneToMany(mappedBy="category",fetch=FetchType.EAGER,cascade=CascadeType.REMOVE)
	Set<Product>products;
	
	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDesc() {
		return categoryDesc;
	}

	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
		
}

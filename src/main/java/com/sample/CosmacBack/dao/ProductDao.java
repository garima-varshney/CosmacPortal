package com.sample.CosmacBack.dao;

import java.util.List;

import com.sample.CosmacBack.model.Product;

public interface ProductDao {

	public boolean addProduct(Product p);
	public boolean updateProduct(Product p);
	public boolean deleteProductById(int prodId) ;
	public Product displayProductById(int prodId);
	public List<Product> displayProduct();
	public List<Product> displayProductByCategory(String catId);
}

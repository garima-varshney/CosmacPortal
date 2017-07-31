package com.sample.CosmacBack.dao;

import java.util.List;

import com.sample.CosmacBack.model.Cart;

public interface CartDao {
	
	public boolean addToCart(Cart c);
	public boolean updateCart(Cart c);
	public boolean deleteItem(int id);
	public Cart getCartById(int id);
	public List<Cart> displayCart(String username);
	public int clearCart(String username);
	public long getNumberOfProducts(String username);
	public int getQuantity(String username,String pName);
	public long getTotalAmount(String username);
	public Cart getCartByUsername(String username,String pName);
}



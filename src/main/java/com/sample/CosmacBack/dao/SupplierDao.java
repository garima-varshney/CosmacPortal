package com.sample.CosmacBack.dao;

import java.util.List;

import com.sample.CosmacBack.model.Supplier;

public interface SupplierDao {

	public boolean addSupplier(Supplier s);
	public boolean updateSupplier(Supplier s);
	public boolean deleteSupplierById(String suppId) ;
	public boolean deleteSupplier(Supplier s);
	public Supplier displaySupplierById(String suppId);
	public List<Supplier> displaySuppliers();
}
package com.sample.CosmacBack.dao;

import java.util.List;

import com.sample.CosmacBack.model.Category;

public interface CategoryDao {

	public boolean addCategory(Category c);
	public boolean updateCategory(Category c);
	public boolean deleteCategoryById(String catId) ;
	public Category displayCategoryById(String catId);
	public List<Category> displayCategory();
}
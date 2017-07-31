package com.sample.CosmacFront.controller;

import org.springframework.stereotype.Controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.CosmacBack.dao.CategoryDao;
import com.sample.CosmacBack.model.Category;

@Controller
public class CategoryController {

	@Autowired
	CategoryDao categoryDao;

	/* Mapping to display Category Page */
	@RequestMapping("/Category")
	public String categoryRegister(Model model) 
	{
		model.addAttribute("category", new Category());
		model.addAttribute("categoryList", categoryDao.displayCategory());
		return "Category";
	}

	/* Mapping to add a Category */
	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public String submit(@Valid @ModelAttribute("category") Category c, BindingResult result, Model model) 
	{
		if (result.hasErrors()) 
		{
			System.out.println("error");
			return "Category";
		} 
		else 
		{
			if (c.getCategoryId() == null) 
			{
				System.out.println("CategoryController -- Adding a new Category --");
				categoryDao.addCategory(c);
				return "redirect:/Category";
			} 
			else 
			{
				System.out.println("CategoryController -- Updating Category --");
				categoryDao.updateCategory(c);
				return "redirect:/Category";
			}
		}
	}

	/* Mapping to delete a Category*/
	@RequestMapping(value = "/deleteCategory/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String id) 
	{
		System.out.println("CategoryController -- Deleting Category --");
		categoryDao.deleteCategoryById(id);
		return "redirect:/Category";
	}

	/* Mapping for editing Category */
	@RequestMapping(value = "/editCategory/{id}")
	public String edit(@PathVariable("id") String id, Model model) 
	{
		System.out.println("CategoryController -- Editing Category --");
		model.addAttribute("category", categoryDao.displayCategoryById(id));
		model.addAttribute("categoryList", categoryDao.displayCategory());
		return "Category";
	}
}
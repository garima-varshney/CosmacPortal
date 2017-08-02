package com.sample.CosmacFront.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.CosmacBack.dao.CategoryDao;
import com.sample.CosmacBack.dao.ProductDao;

@Controller
public class PageController {
	
	@Autowired
	HttpSession httpSession;

	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping(value="/")
	public String home()
	{
		httpSession.setAttribute("categoryL", categoryDao.displayCategory());
		return "index";
	}

	@RequestMapping(value="/AboutUs")
	public String showAboutUs()
	{
		return "AboutUs";	
	}
	
	@RequestMapping(value="/ContactUs")
	public String showContactUs()
	{
		return "ContactUs";	
	}
	
	@RequestMapping(value="/Home")
	public String showHome()
	{
		return "Home";	
	}
	
	@RequestMapping(value="/SignIn")
	public String showSignIn()
	{
		return "SignIn";	
	}

	@RequestMapping(value="/ShowProduct/{id}")
	public String showShowProduct(@PathVariable("id") String id)
	{
		httpSession.setAttribute("productL", productDao.displayProductByCategory(id));
		return "ShowProduct";
	}

	@RequestMapping(value="/Shop")
	public String showShop()
	{
		httpSession.setAttribute("allProducts", productDao.displayProduct());
		return "Shop";
	}
	
	@RequestMapping(value="/ProductDesc/{id}")
	public String showProductDesc(@PathVariable("id") int id, Model model)
	{
		httpSession.setAttribute("prdDesc", productDao.displayProductById(id));
		return "ProductDesc";
	}

	@RequestMapping(value="/AddingProduct")
	public String showAddingProduct(Model model, RedirectAttributes redirect)
	{
		redirect.addFlashAttribute("warning","You need to Sign in first!");
		return "redirect:/SignIn";
	}
	
	@RequestMapping(value="/SignOut")
	public String showSignOut(Model model)
	{
		model.addAttribute("message", "Signed out Sucessfully");
		return "model";
	}

}
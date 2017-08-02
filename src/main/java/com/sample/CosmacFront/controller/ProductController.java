package com.sample.CosmacFront.controller;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.sample.CosmacBack.dao.CategoryDao;
import com.sample.CosmacBack.dao.ProductDao;
import com.sample.CosmacBack.dao.SupplierDao;
import com.sample.CosmacBack.model.Product;

@Controller
public class ProductController {
	
	@Autowired	
	HttpSession httpSession;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	SupplierDao supplierDao;
	
	@RequestMapping("/Product")
	public String productRegister(Model model)
	{
		httpSession.setAttribute("catList", categoryDao.displayCategory());
		httpSession.setAttribute("suppList", supplierDao.displaySuppliers());
		model.addAttribute("product",new Product());
		model.addAttribute("productList", productDao.displayProduct());
		return "Product";
	}
	
	@RequestMapping(value="/addProduct", method = RequestMethod.POST)
	public String submit(@Valid @ModelAttribute("product")Product product, BindingResult result, Model model)
	{
		if(result.hasErrors())
		{
        	System.out.println("error");
            return "Product";
		}
		else
		{
			if(product.getPrdId()==0)
			{
	        	System.out.println("-- Adding Product --");
				productDao.addProduct(product);
	
	        	System.out.println("-- Adding Product Image --");
				MultipartFile part=product.getImage();
				System.out.println(part);
				ServletContext con=httpSession.getServletContext();
				String filelocation=con.getRealPath("/resources/images/");
				System.out.println("File Location "+filelocation);
				String filename=filelocation+"\\"+product.getPrdId()+".jpg";
				System.out.println("File Name "+filename);
				 try 
					 {
					 	 System.out.println("Converting file to bytes");
						 byte b[]=part.getBytes();
						 System.out.println("Writing file to Output stream");
						 FileOutputStream fos=new FileOutputStream(filename);
						 fos.write(b);
						 System.out.println("Closing file");
						 fos.close();
					 } 
				 catch(IOException e) 
					 {
					        throw new RuntimeException("IOException "+e); 
					 }
				 catch(Exception e)
					 {
					        throw new RuntimeException("Exception "+e); 
					 }			
	    		return "redirect:/Product";
			}
			else
			{
				System.out.println("-- Updating Product --");
				productDao.updateProduct(product);
				return"redirect:/Product";
			}
		}
	}
	
	@RequestMapping(value = "/deleteProduct/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) 
	{
		System.out.println("-- Deleting Product --");
		productDao.deleteProductById(id);
		return "redirect:/Product";
	}
	
	@RequestMapping(value = "/editProduct/{id}")
	public String edit(@PathVariable("id") int id, Model model) 
	{
		System.out.println("-- Editing Product --");
		model.addAttribute("product", productDao.displayProductById(id));
		model.addAttribute("productList", productDao.displayProduct());
		return "Product";
	}
	
}
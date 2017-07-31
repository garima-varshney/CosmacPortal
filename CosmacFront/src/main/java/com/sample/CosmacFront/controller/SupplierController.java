package com.sample.CosmacFront.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.CosmacBack.dao.SupplierDao;
import com.sample.CosmacBack.model.Product;
import com.sample.CosmacBack.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	SupplierDao supplierDao;
	
	@RequestMapping("/Supplier")
	public String supplierRegister(Model model)
	{
		model.addAttribute("supplier",new Supplier());
		model.addAttribute("supplierList", supplierDao.displaySuppliers());
		return "Supplier";
	}

	@RequestMapping(value="/addSupplier", method = RequestMethod.POST)
	public String submit(@Valid @ModelAttribute("")Supplier supplier, BindingResult result, Model model)
	{
		if(result.hasErrors())
		{
        	System.out.println("error");
            return "Supplier";
		}
		else{
		}
			if(supplier.getSuppId() == null)			
			{
	        	System.out.println("-- Adding Supplier  --");
				supplierDao.addSupplier(supplier);
	    		return "redirect:/Supplier";
			}
			else
			{
				System.out.println(" -- Updating Supplier -- ");
				supplierDao.updateSupplier(supplier);
	    		return "redirect:/Supplier";
			}
	}
	
	@RequestMapping(value = "/deleteSupplier/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String id) 
	{
		System.out.println("-- Deleting Supplier -- ");
		supplierDao.deleteSupplierById(id);
		return "redirect:/Supplier";
	}
	
	@RequestMapping(value = "/editSupplier/{id}")
	public String edit(@PathVariable("id") String id, Model model) 
	{
		System.out.println("-- Editing Supplier --");
		model.addAttribute("supplier", supplierDao.displaySupplierById(id));
		model.addAttribute("supplierList", supplierDao.displaySuppliers());
		return "Supplier";
	}
	
}

package com.sample.CosmacFront.controller;

import org.springframework.stereotype.Controller;

import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.CosmacBack.dao.UsersDao;
import com.sample.CosmacBack.model.Billing;
import com.sample.CosmacBack.model.Shipping;
import com.sample.CosmacBack.model.Users;

@Controller
public class UserController {

	@Autowired
	UsersDao usersDao;

	@RequestMapping("/SignUp")
	public String userRegister(Model model) {
		model.addAttribute("user", new Users());
		return "SignUp";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String submit(@Valid @ModelAttribute("user") Users u, BindingResult result, Model model,RedirectAttributes redirect) {
		if (result.hasErrors()) {
			System.out.println("-- error occurred --");
			return "SignUp";
		} else {
			System.out.println("-- UserController -- addUser begins -- ");
			Users user = new Users();
			Shipping shipping = new Shipping();
			Billing billing = new Billing();
			user.setBilling(billing);
			user.setShipping(shipping);
			usersDao.addUser(u);
			redirect.addFlashAttribute("success", "You have been registered with COSMAC");
			return "redirect:/SignUp";
		}
	}

	@RequestMapping(value = "/User")
	public String showUsers(Model model)
	{
		model.addAttribute("usersList", usersDao.displayUsers());
		return "User";
	}
}
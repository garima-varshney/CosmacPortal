package com.sample.CosmacFront.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.CosmacBack.dao.UsersDao;
import com.sample.CosmacBack.model.Users;

@Controller
public class CheckoutController {

	@Autowired
	private UsersDao usersDao;
	
	@Autowired
	private HttpSession httpSession;

	@RequestMapping("/order")
	public String createOrder() {
		// CustomerOrder customerOrder = new CustomerOrder();
		System.out.println("CheckoutController -- begins -- ");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loggedInUsername = auth.getName();
		Users u = usersDao.getUserByUsername(loggedInUsername);
		System.out.println("CheckoutController -- ends -- ");
		return "redirect:/checkout?userId="+u.getUserId();
	}
}
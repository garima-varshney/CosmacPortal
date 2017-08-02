package com.sample.CosmacFront.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	/* Admin Home Page mapping */
	@RequestMapping("/adminHome")
	public String adminHome()
	{
		System.out.println("adminHome");
		return "/admin/adminHome";
	}
	
}
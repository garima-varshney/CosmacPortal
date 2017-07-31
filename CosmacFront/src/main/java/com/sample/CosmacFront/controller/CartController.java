package com.sample.CosmacFront.controller;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.CosmacBack.dao.CartDao;
import com.sample.CosmacBack.dao.ProductDao;
import com.sample.CosmacBack.dao.UsersDao;
import com.sample.CosmacBack.model.Cart;
import com.sample.CosmacBack.model.Product;
import com.sample.CosmacBack.model.Users;

@RequestMapping("/myCart")
@Controller
public class CartController {

	@Autowired
	HttpSession httpSession;

	@Autowired
	ProductDao productDao;

	@Autowired
	UsersDao usersDao;

	@Autowired
	CartDao cartDao;

	/* Cart Page mapping */
	@RequestMapping(value = "/all")
	public String getCart() {
		System.out.println(" -- CartController -- Show Cart begins -- ");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loggedInUsername = auth.getName();
		System.out.println(" -- CartController -- loggedInUsername -- " + loggedInUsername);
		httpSession.setAttribute("numberProducts", cartDao.getNumberOfProducts(loggedInUsername));
		httpSession.setAttribute("cartList", cartDao.displayCart(loggedInUsername));
		httpSession.setAttribute("totalAmount", cartDao.getTotalAmount(loggedInUsername));
		System.out.println(" -- CartController -- Show Cart ends -- ");
		return "Cart";
	}

	/* Mapping to Add to Cart */
	@RequestMapping(value = "/addToCart/{id}")
	public String showCart(@PathVariable("id") int id, Model model, Principal p, RedirectAttributes redirect) {
		System.out.println(" -- addToCart -- ");
		try {
			System.out.println(" -- CartController -- addToCart begins -- ");
			Cart cart = new Cart();
			Product product = productDao.displayProductById(id);
			String username = p.getName();
			System.out.println(" -- CartController -- addToCart -- getUserByUsername -- " + username);
			Users u = usersDao.getUserByUsername(username);
			cart.setProductName(product.getPrName());
			cart.setPrice(product.getPrice());
			cart.setDateAdded(new Date());
			cart.setStatus("NEW");
			cart.setUsername(username);
			cart.setUserId(u.getUserId());
			System.out.println(" -- CartController -- addToCart -- Check if Cart already exists -- ");
			Cart existCart = cartDao.getCartByUsername(username, cart.getProductName());
			if (existCart != null) {
				System.out.println(" CartController -- addToCart -- Updating existing product!");
				int currentQuantity = cartDao.getQuantity(username, cart.getProductName());
				cart.setCartId(existCart.getCartId());
				cart.setQuantity(currentQuantity + 1);
				boolean flag = cartDao.updateCart(cart);
				if (flag) {
					redirect.addFlashAttribute("success", product.getPrName() + " successfully added to your cart!");
					httpSession.setAttribute("numberProducts", cartDao.getNumberOfProducts(username));
					return "redirect:/myCart/all";
				} else {
					redirect.addFlashAttribute("error", "Failed to add product to cart!");
					return "redirect:/Shop";
				}
			} else {
				System.out.println(" -- CartController -- addToCart -- Adding new product!");
				cart.setQuantity(1);
				boolean flag = cartDao.addToCart(cart);
				if (flag) {
					redirect.addFlashAttribute("success", product.getPrName() + " successfully added to your cart!");
					httpSession.setAttribute("numberProducts", cartDao.getNumberOfProducts(username));
					return "redirect:/myCart/all";
				} else {
					redirect.addFlashAttribute("error", "Failed to add product to cart!");
					return "redirect:/Shop";
				}
			}
		} catch (Exception e) {
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "Cart";
		}
	}

	/* Mapping to Delete a product from Cart */
	@RequestMapping("/deleteProduct/{id}")
	public String deleteCartItem(@PathVariable("id") int id, Model model, RedirectAttributes redirect) {
		try {
			System.out.println("-- CartController -- deleteCartItem begins -- ");
			Cart cart = cartDao.getCartById(id);
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();
			int checkQ = cartDao.getQuantity(username, cart.getProductName());
			if (checkQ > 1) {
				cart.setQuantity(checkQ - 1);
				cartDao.updateCart(cart);
				redirect.addFlashAttribute("success", "Cart updated successfully.");
				System.out.println("CartController -- deleteCartItem -- Item deleted successfully.");
				return "redirect:/myCart/all";
			} else {
				cartDao.deleteItem(id);
				System.out.println("CartController -- deleteCartItem -- Item removed successfully.");
				redirect.addFlashAttribute("success", "Item removed successfully.");
				return "redirect:/myCart/all";
			}
		} catch (Exception e) {
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}

	/* Mapping to clear the Cart */
	@RequestMapping("/clearCart")
	public String clearCart(RedirectAttributes redirect, Model model) {
		try {
			System.out.println("-- CartController -- clearCart begins -- ");
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();
			int flag = cartDao.clearCart(username);
			if (flag >= 1) {
				redirect.addFlashAttribute("success", "All Items removed successfully.");
				return "redirect:/myCart/all";
			} else {
				redirect.addFlashAttribute("error", "Failed to clear cart!");
				return "redirect:/myCart/all";
			}
		} catch (Exception e) {
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "error";
		}
	}

}
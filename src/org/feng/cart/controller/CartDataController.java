/**
 * 
 */
package org.feng.cart.controller;

import org.feng.cart.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ½ª·å
 *
 */
@Controller
@RequestMapping(value="/cart/data", produces="text/html;charset=utf-8")
public class CartDataController {
	
	@Autowired
	@Qualifier("cartService")
	private CartService cs;
	
	@RequestMapping("cart.html")
	public String showCartPage() {
		return "cart";
	}

}

/**
 * 
 */
package org.feng.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.feng.bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ½ª·å
 *
 */
@Controller
@RequestMapping(value="order", produces="text/html;charset=utf-8")
public class OrderController {
	
	@RequestMapping("userOrders.html")
	public String showAllOrders(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			return "userOrders";
		} else {
			return "login";
		}
	}

}

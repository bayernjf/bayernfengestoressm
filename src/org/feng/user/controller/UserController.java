/**
 * 
 */
package org.feng.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.feng.bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ½ª·å
 *
 */
@Controller
@RequestMapping(value="user", produces="text/html;charset=utf-8")
public class UserController {
	
	@RequestMapping("login.html")
	public String showLoginPage() {
		return "login";
	}
	
	@RequestMapping("register.html")
	public String showRegisterPage() {
		return "register";
	}
	
	@RequestMapping("index.html")
	public String showIndexPage() {
		return "index";
	}

	@RequestMapping("userHome.html")
	public String showUserHomePage(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			return "userHome";
		} else {
			return "login";
		}
		
	}

	@RequestMapping("forgetPassword.html")
	public String forgetPasswordPage() {
		return "forgetPassword";
	}
	
	
}

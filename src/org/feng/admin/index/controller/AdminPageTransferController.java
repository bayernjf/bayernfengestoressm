/**
 * 
 */
package org.feng.admin.index.controller;

import javax.servlet.http.HttpServletRequest;

import org.feng.admin.bean.AdminUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ½ª·å
 *
 */
@Controller
@RequestMapping(value="admin", produces="text/html;charset=utf-8")
public class AdminPageTransferController {
	
	@RequestMapping("index.html")
	public String index(HttpServletRequest request) {
		
		// ÅÐ¶ÏÓÐÃ»ÓÐµÇÂ¼
		AdminUser user = (AdminUser) request.getSession().getAttribute("adminUser");
		if (user != null) {
			return "admin/index";
		} else {
			return "redirect:/admin/login.html";
		}
		
		
	}

	@RequestMapping("fengmessage.html")
	public String fengmessage(HttpServletRequest request) {
		String message = (String) request.getSession().getAttribute("message");
		String nextpage = (String) request.getSession().getAttribute("nextpage");
		request.setAttribute("message", message);
		request.setAttribute("nextpage", nextpage);
		return "admin/fengmessage";
	}
	
}

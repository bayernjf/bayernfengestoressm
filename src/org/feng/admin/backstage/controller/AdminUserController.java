/**
 * 
 */
package org.feng.admin.backstage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.feng.admin.backstage.service.AdminRoleService;
import org.feng.admin.bean.AdminRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 姜峰
 *
 */
@Controller
@RequestMapping(value="admin", produces="text/html;charset=utf-8")
public class AdminUserController {
	
	@Autowired
	@Qualifier("adminRoleService")
	private AdminRoleService rs;
	
	@RequestMapping("userAdd.html")
	public String addUser(HttpServletRequest request) {
		
		// 从数据库拿角色表里面的所有数据
		List<AdminRole> roles = rs.getAllRoles();
		
		request.setAttribute("roles", roles);
		
		return "admin/userAdd";
	}

	@RequestMapping("roleManage.html")
	public String roleManage() {
		
		return "admin/roleManage";
	}
	
	@RequestMapping("authorizationManage.html")
	public String authorizationManage(HttpServletRequest request) {
		
		// 从数据库拿角色表里面的所有数据
		List<AdminRole> roles = rs.getAllRoles();
		request.setAttribute("roles", roles);
//		request.getSession().setAttribute("roles", roles);
		
		return "admin/authorizationManage";
	}
	
	@RequestMapping("login.html")
	public String login() {
		return "admin/login";
	}
	
	@RequestMapping("logout.html")
	public String logout(HttpServletRequest request) {
		
		request.getSession().setAttribute("adminUser", null);
		
		return "admin/login";
	}

	@RequestMapping("forgetPassword.html")
	public String forgetPassword() {
		return "admin/forgetPassword";
	}

}

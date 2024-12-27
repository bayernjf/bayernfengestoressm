/**
 * 
 */
package org.feng.admin.backstage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.feng.admin.backstage.service.AdminAuthorizationService;
import org.feng.admin.backstage.service.AdminRoleService;
import org.feng.admin.backstage.service.AdminUserService;
import org.feng.admin.bean.AdminAuthorization;
import org.feng.admin.bean.AdminRole;
import org.feng.admin.bean.AdminRoleAuthorization;
import org.feng.admin.bean.AdminUser;
import org.feng.util.BayernFengUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

/**
 * @author 姜峰
 *
 */
@Controller
@RequestMapping(value="admin/data", produces="text/html;charset=utf-8")
public class AdminUserDataController {
	
	@Autowired
	@Qualifier("adminUserService")
	private AdminUserService us;
	
	@Autowired
	@Qualifier("adminRoleService")
	private AdminRoleService rs;
	
	@Autowired
	@Qualifier("adminAuthorizationService")
	private AdminAuthorizationService as;
	
	@RequestMapping("login.do")
	public ModelAndView login(@RequestParam(value="username", required=true) String username,
			@RequestParam(value="password", required=true) String password,
			@RequestParam(value="isRememberUsername", required=false) String isRememberUsername,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView();
		
		AdminUser user = new AdminUser();
		user.setUsername(username);
		user.setPassword(password);
		
		AdminUser result = us.login(user);
		
		if (result != null) {
			
			// 根据role_id限制权限
			List<AdminRoleAuthorization> aras = rs.getAuthorizationsByRole_Id(result.getRole_id());
			List<Integer> ids = new ArrayList<>();
			for (AdminRoleAuthorization ara : aras) {
				ids.add(ara.getAuthorization_id());
			}
			List<AdminAuthorization> adminAuthorizations = as.getAdminAuthorizationsByIds(ids);
			request.getSession().setAttribute("adminAuthorizations", adminAuthorizations);
			
			//System.out.println("adminAuthorizations -> " + adminAuthorizations);
			adminAuthorizations.forEach(a -> System.out.println("========= " + a));
			
			// request里
//			mv.addObject("adminUser", result);
			
			request.getSession().setAttribute("adminUser", result);
			
			String valueWhenCheckedReMe = isRememberUsername;
			// 如果勾选记住我，则把登陆用户信息存在cookie中
			if ("feng".equals(valueWhenCheckedReMe)) {
				Map<String, String> messageMap = new HashMap<>();
				messageMap.put("adminusername", request.getParameter("username"));
				messageMap.put("adminpassword", request.getParameter("password"));
				messageMap.put("adminvalueOfCheck", valueWhenCheckedReMe);
				BayernFengUtils.saveIntoCookie(messageMap, 3600, "/", response);
			} else {
				Map<String, String> messageMap = new HashMap<>();
				messageMap.put("adminusername", "");
				messageMap.put("adminpassword", "");
				messageMap.put("adminvalueOfCheck", "");
				BayernFengUtils.saveIntoCookie(messageMap, 0, "/", response);
			}
			mv.setViewName("admin/index");
		} else {
			request.getSession().setAttribute("message", "登录失败，请输入有效用户名或密码");
			request.getSession().setAttribute("nextpage", "admin/login.html");
			mv.setViewName("redirect:/admin/fengmessage.html");
		}
		
		
		
		System.out.println("===================result -> " + result);
		
		
		
		return mv;
	}

	@RequestMapping("addUser.do")
	public ModelAndView addUser(@RequestParam(value="username", required=true) String username,
			@RequestParam(value="password", required=true) String password,
			@RequestParam(value="phone", required=true) String phone,
			@RequestParam(value="role_id", required=true) String role_id,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView();
		
		AdminUser user = new AdminUser();
		user.setUsername(username);
		user.setPassword(password);
		user.setPhone(phone);
		if (role_id == "-1") {
			try {
				throw new Exception();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			user.setRole_id(Integer.parseInt(role_id));
		}
		user.setStat(1);
		user.setPhoto("/photosOfUsers/tx.jpg");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String createtime = "1900-02-27";
		Date b = new Date();
		try {
			b = sdf.parse(createtime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		user.setCreatetime(b);
		user.setCreatetime(new Date());
		
		Integer result = 0;
		
		try {
			result = us.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result > 0) {
			// 添加成功后
			mv.setViewName("redirect:/admin/userAdd.html");
		} else {
			request.getSession().setAttribute("message", "添加失败，用户名已存在");
			request.getSession().setAttribute("nextpage", "admin/userAdd.html");
			mv.setViewName("redirect:/admin/fengmessage.html");
		}
		
		return mv;
	}
	
	
	@RequestMapping("findUser.do")
	public ModelAndView findUser(@RequestParam(value="username", required=true) String username,
			HttpServletRequest request, HttpServletResponse response) {
		
		AdminUser whenModify = (AdminUser) request.getSession().getAttribute("whenModify");
		String un = null;
		if (whenModify != null) {
			un = whenModify.getUsername();
		}
		if (un != null) {
			username = un;
		}
		request.getSession().setAttribute("whenModify", null);
		
		
		ModelAndView mv = new ModelAndView();
		
		AdminUser result = null;
		
		try {
			result = us.findUserByUsername(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result != null) {
			
			// 设置user的role
			AdminRole role = rs.getRoleById(result.getRole_id());
			result.setRole(role);
			
			// 查询所有角色
			List<AdminRole> roles = rs.getAllRoles();
			mv.addObject("roles", roles);
			
			//mv.addObject("foundUser", result);
			request.getSession().setAttribute("foundUser", result);
			mv.setViewName("admin/roleManage");
		} else {
			// 清楚上一次查询的结果
			request.getSession().setAttribute("foundUser", null);
			
			request.getSession().setAttribute("message", "查询失败");
			request.getSession().setAttribute("nextpage", "admin/roleManage.html");
			mv.setViewName("redirect:/admin/fengmessage.html");
		}
		
		return mv;
	}
	
	@RequestMapping("roleManageModifyUser.do")
	@ResponseBody
	public String roleManageModifyUser(@RequestParam(value="id", required=true) Integer id,
			@RequestParam(value="stat", required=true) Integer stat,
			@RequestParam(value="role_id", required=true) Integer role_id,
			HttpServletRequest request, HttpServletResponse response) {
		
		JSONObject jobj = new JSONObject();
		
		AdminUser user = new AdminUser();
		user.setId(id);
		user.setStat(stat);
		user.setRole_id(role_id);
		Integer result = null;
		
		try {
			result = us.updateUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "修改成功");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "修改失败");
		}
		
		return jobj.toJSONString();
	}

	@RequestMapping("updatePassword.do")
	public String updatePassword(@RequestParam(value="username", required=true) String username,
			@RequestParam(value="password", required=true) String password,
			@RequestParam(value="repassword", required=true) String repassword,
			HttpServletRequest request, HttpServletResponse response) {
		
		AdminUser user = new AdminUser();
		user.setUsername(username);
		user.setPassword(repassword);
		Integer result = null;
		
		try {
			result = us.updatePassword(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/login.html";
		
	}
	
}

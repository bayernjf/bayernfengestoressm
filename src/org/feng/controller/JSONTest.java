/**
 * 
 */
package org.feng.controller;

import org.feng.bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 姜峰
 *
 */
@Controller
public class JSONTest {
	
	@RequestMapping("userjson")
	@ResponseBody
	public User userJson() {
		User user = new User();
		user.setUsername("姜峰");
		user.setPassword("feng");
		return user;
	}
	
	@RequestMapping("showUser")
	public String upload() {
		return "showUser";
	}
	
	
	// 待解决
	@RequestMapping("userjson2")
	@ResponseBody
	public User userJson2(@RequestBody User user) {
		
		return user;
	}

	// 动态的配置页面访问路径
//	@RequestMapping("/{path}")
//	public String show(@PathVariable("page") String page) {
//		return page;
//	}
	
	// 此时需要转发，
	@RequestMapping("/feng")
	public String fengfengfeng() {
		// 不在进入spring mvc的流程
		return "forward:/WEB-INF/content/error.jsp";
	}
	
	// 此时需要转发，
	@RequestMapping("/jiang")
	public String jiangjiangjiang() {
		// 不在进入spring mvc的流程
//		return "redirect:/WEB-INF/content/error.jsp";
		return "redirect:http://www.baidu.com";
	}
	
}

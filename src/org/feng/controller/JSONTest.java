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
 * @author ����
 *
 */
@Controller
public class JSONTest {
	
	@RequestMapping("userjson")
	@ResponseBody
	public User userJson() {
		User user = new User();
		user.setUsername("����");
		user.setPassword("feng");
		return user;
	}
	
	@RequestMapping("showUser")
	public String upload() {
		return "showUser";
	}
	
	
	// �����
	@RequestMapping("userjson2")
	@ResponseBody
	public User userJson2(@RequestBody User user) {
		
		return user;
	}

	// ��̬������ҳ�����·��
//	@RequestMapping("/{path}")
//	public String show(@PathVariable("page") String page) {
//		return page;
//	}
	
	// ��ʱ��Ҫת����
	@RequestMapping("/feng")
	public String fengfengfeng() {
		// ���ڽ���spring mvc������
		return "forward:/WEB-INF/content/error.jsp";
	}
	
	// ��ʱ��Ҫת����
	@RequestMapping("/jiang")
	public String jiangjiangjiang() {
		// ���ڽ���spring mvc������
//		return "redirect:/WEB-INF/content/error.jsp";
		return "redirect:http://www.baidu.com";
	}
	
}

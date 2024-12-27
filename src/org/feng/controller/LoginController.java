/**
 * 
 */
package org.feng.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.feng.bean.User;
import org.feng.bean.query.QueryUser;
import org.feng.user.service.UserService;
import org.feng.util.MyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author ����
 *
 */
@Controller
public class LoginController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	// �������ˡ�������������Ϊ������һ��@RequestMapping(name="login")
//	@RequestMapping(name="login")
//	public ModelAndView login(HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView();
//		
//		User user = new User();
////		user.setUsername("jiangfeng");
//		user.setUsername("bayern");
//		user.setPassword("123");
//
//		System.out.println("userService -> " + userService);
//		
//		User result = userService.login(user);
//		
//		mv.addObject("user", user);
//		mv.addObject("message", "jiangfeng");
//		mv.setViewName("error");
//		return mv;
//	}
	
	@RequestMapping("test")
	public ModelAndView test(@RequestParam(value="fengid", required=true) Integer id) {
		ModelAndView mv = new ModelAndView();
		
		User user = new User();
//		user.setUsername("jiangfeng");
		user.setUsername("bayern");
		user.setPassword("123");
		
		System.out.println("userService -> " + userService);
		
		User result = userService.login(user);
		
		mv.addObject("user", user);
		mv.addObject("message", id);
		mv.setViewName("welcome");
		return mv;
	}
	
	@RequestMapping("addUser")
	public String showAddUserPage() {
		return "addUser";
	}
	
	@RequestMapping("addUserController")
	public ModelAndView addUser(User user) {
		
		// ����get������Ҫ�Ƚ��룬�ٱ���
//		String username = user.getUsername();
//		username = new String(username.getBytes("ios-8859?"), "utf-8");
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("user : " + user);
		
		Integer result = userService.register(user);
		
		mv.addObject("message", result);
		mv.setViewName("welcome");
		return mv;
	}

	
	// ����ѡ�еĶ�����ݡ�
	@RequestMapping("test1")
	public ModelAndView test1(Integer[] ids) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("welcome");
		return mv;
	}
	
	// ***********************************************************************
	// List��Set����
	// ����ѡ�еĶ�����ݡ�
	@RequestMapping("test2")
	public ModelAndView test2(ArrayList<Integer> idList) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("welcome");
		return mv;
	}
	
	@RequestMapping("test3")
	public ModelAndView test3() {
		
		List<User> users = new ArrayList<>();
		for (int i = 0; i < 5; i++) {
			User user = new User();
			user.setUsername("feng");
			user.setPassword("feng");
			users.add(user);
		}
		QueryUser qu = new QueryUser();
		qu.setUserList(users);
		ModelAndView mv = new ModelAndView();
		mv.addObject("qu", qu);
		mv.setViewName("users");
		return mv;
	}
	
	@RequestMapping("test4")
	public ModelAndView test4() {
		
//		List<User> users = new ArrayList<>();
//		for (int i = 0; i < 5; i++) {
//			User user = new User();
//			user.setUsername("feng");
//			user.setPassword("feng");
//			users.add(user);
//		}
//		QueryUser qu = new QueryUser();
//		qu.setUserList(users);
		ModelAndView mv = new ModelAndView();
//		mv.addObject("qu", qu);
		mv.setViewName("welcome");
		return mv;
	}
	
	// �쳣������Ĳ���
	@RequestMapping("test5")
	public ModelAndView test5() {
		

		ModelAndView mv = new ModelAndView();

		System.out.println("-----------------------");
		// ����һ���쳣�׳�
		try {
			throw new MyException("�������쳣");
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("=======================");
		mv.setViewName("welcome");
		return mv;
	}

	
}

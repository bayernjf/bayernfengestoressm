/**
 * 
 */
package org.feng.user.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.feng.bean.User;
import org.feng.user.service.UserService;
import org.feng.util.BayernFengUtils;
import org.feng.util.MySendMailThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

/**
 * @author ����
 *
 */
@Controller
@RequestMapping(value="/user/data", produces="text/html;charset=utf-8")
public class UserDataController {
	
	private User user = new User();
	private String locationBeforeLogin = "";
	
	@Autowired
	@Qualifier("userService")
	private UserService us;
	
	@RequestMapping("login.do")
	@ResponseBody
	public String doLogin(@RequestParam(value="username", required=true) String username, 
			@RequestParam(value="password", required=true) String password,
			@RequestParam(value="isRememberUsername", required=true) String isRememberUsername,
			@RequestParam(value="locationBeforeLogin", required=true) String locationBeforeLogin,
			HttpServletRequest request, HttpServletResponse response) {
		this.locationBeforeLogin = locationBeforeLogin;
		JSONObject jobj = new JSONObject();
		User user = new User();
		User result = null;
		String loginType = BayernFengUtils.getTypeOfLogin(username);
		// ������ͨ�û�����½
		if (loginType == null) {
			user.setUsername(username);
			user.setPassword(password);
			result = us.login(user);
		} else if (loginType.equals("phone")) {
			user.setPhone(username);
			user.setPassword(password);
			result = us.loginByPhone(user);
		} else if (loginType.equals("email")) {
			user.setEmail(username);
			user.setPassword(password);
			result = us.loginByEmail(user);
		}
		
		try {
			if (result != null) {
				Integer stat = result.getStat();
				if (stat == 1) {
					this.user = result;
					jobj.put("error_code", "0");
					jobj.put("error_msg", "login OK!");
					
					String valueWhenCheckedReMe = isRememberUsername;
					// �����ѡ��ס�ң���ѵ�½�û���Ϣ����cookie��
					if ("feng".equals(valueWhenCheckedReMe)) {
						Map<String, String> messageMap = new HashMap<>();
						messageMap.put("username", request.getParameter("username"));
						messageMap.put("password", request.getParameter("password"));
						messageMap.put("valueOfCheck", valueWhenCheckedReMe);
						BayernFengUtils.saveIntoCookie(messageMap, 3600, "/", response);
					} else {
						Map<String, String> messageMap = new HashMap<>();
						messageMap.put("username", "");
						messageMap.put("password", "");
						messageMap.put("valueOfCheck", "");
						BayernFengUtils.saveIntoCookie(messageMap, 0, "/", response);
					}
					
					// �޸ĵ�¼ʱ��
					result.setLogintime(new Date());
					Integer r = us.updateLogintime(result);
					
				} else {
					jobj.put("error_code", "2");
					jobj.put("error_msg", "�û�δ�������30������������������ļ����ʼ������ʧЧ�������Ҫ����ע��");
				}
			} else {
				jobj.put("error_code", "-1");
				jobj.put("error_msg", "Login failed!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jobj.put("error_code", "400");
			jobj.put("error_msg", "jiangfeng -> "+e.getMessage());
		}
		return jobj.toJSONString();
	}
	
	@RequestMapping("loginSuccess.do")
	@ResponseBody
	public ModelAndView loginSuccess(HttpServletRequest request) {
		
		request.getSession().setAttribute("user", this.user);
		
//		return "forward:"+this.locationBeforeLogin;
//		return "redirect:"+this.locationBeforeLogin;
		
		ModelAndView mv = new ModelAndView();
		
		// http://localhost:8080/bayernfengestoressm/category/category.html
		String str = this.locationBeforeLogin;
		str.lastIndexOf("/");
		str.lastIndexOf(".");
		String vn = str.substring(str.lastIndexOf("/"), str.lastIndexOf("."));
		System.out.println("=======================================vn -> " + vn);
		if (vn.equals("/register") || vn.equals("/login")) {
			vn = "/index";
		}
		mv.setViewName(vn);
		return mv;
	}
	
/*	@RequestMapping("logout.do")
	public ModelAndView doLogout(HttpServletRequest request) {
		
		request.getSession().setAttribute("user", null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
*/	@RequestMapping("logout.do")
	public String doLogout(HttpServletRequest request) {
		
		request.getSession().setAttribute("user", null);
		return "redirect:/index.html";
	}
	
	/*@RequestMapping("remeberUser.do")
	public void doRememberUser(HttpServletRequest request, HttpServletResponse response) {
		
		String valueWhenCheckedReMe = request.getParameter("isRememberUsername");
		// �����ѡ��ס�ң���ѵ�½�û���Ϣ����cookie��
		if ("feng".equals(valueWhenCheckedReMe)) {
			Map<String, String> messageMap = new HashMap<>();
			messageMap.put("username", request.getParameter("username"));
			messageMap.put("password", request.getParameter("password"));
			messageMap.put("valueOfCheck", valueWhenCheckedReMe);
			BayernFengUtils.saveIntoCookie(messageMap, 3600, "/", response);
		} else {
			Map<String, String> messageMap = new HashMap<>();
			messageMap.put("username", "");
			messageMap.put("password", "");
			messageMap.put("valueOfCheck", "");
			BayernFengUtils.saveIntoCookie(messageMap, 0, "/", response);
		}
	}*/
	
	// �һ����룺��������
	@RequestMapping("forgetPassword.do")
	public void forgetPassword(HttpServletRequest request, HttpServletResponse response) {
		
		String valueWhenCheckedReMe = request.getParameter("isRememberUsername");
		// �����ѡ��ס�ң���ѵ�½�û���Ϣ����cookie��
		if ("feng".equals(valueWhenCheckedReMe)) {
			Map<String, String> messageMap = new HashMap<>();
			messageMap.put("username", request.getParameter("username"));
			messageMap.put("password", request.getParameter("password"));
			messageMap.put("valueOfCheck", valueWhenCheckedReMe);
			BayernFengUtils.saveIntoCookie(messageMap, 3600, "/", response);
		} else {
			Map<String, String> messageMap = new HashMap<>();
			messageMap.put("username", "");
			messageMap.put("password", "");
			messageMap.put("valueOfCheck", "");
			BayernFengUtils.saveIntoCookie(messageMap, 0, "/", response);
		}
	}

	@RequestMapping("loginByPhone.do")
	@ResponseBody
	public String loginByPhone(@RequestParam(value="phone", required=true) String phone,
			@RequestParam(value="locationBeforeLogin", required=true) String locationBeforeLogin) {
		this.locationBeforeLogin = locationBeforeLogin;
		JSONObject jobj = new JSONObject();
		System.out.println("phone -> " + phone);
		
		User result = us.loginByPhone(phone);
		
		// ���û���ҵ���ֱ��ע�ᣬȻ����ת�������ġ��޸���Ϣ��
		if (result == null) {
			
			/*
			 * username�û���������һ����ĸ�����֣�����3~8
			 */
			String c = "ABCDEFGHIJKLMNOPQISTUVWXYZ" + "ABCDEFGHIJKLMNOPQISTUVWXYZ".toLowerCase();
			String n = "0123456789";
			Random ran = new Random();
			StringBuilder sb = new StringBuilder();
			sb.append(c.charAt(ran.nextInt(c.length())));
			sb.append(n.charAt(ran.nextInt(n.length())));
			StringBuilder sb2 = new StringBuilder(UUID.randomUUID().toString());
			sb2.setLength(6);
			String uuid = sb2.toString();
			String username = sb.toString() + uuid;
			
			// ִ��ע�Ṧ��
			User user = new User();
			user.setName("����" + uuid);
			user.setPhone(phone);
			user.setUsername(username);
			user.setUucode((UUID.randomUUID().toString().replace("-", "")));
			user.setStat(1);
			user.setSex("male");
			user.setPhoto("/photosOfUsers/tx.jpg");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String birthday = "1900-02-27";
			Date b = new Date();
			try {
				b = sdf.parse(birthday);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			user.setBirthday(b);
			
			us.register(user);
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, result);
		} else {
			// �ѵõ����û���this.user�����ڵ�¼�ɹ���ִ��
			this.user = result;
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, result);
		}
		
		return jobj.toJSONString();
	}
	
	@RequestMapping("registerByPhone.do")
	@ResponseBody
	public String registerByPhone(@RequestParam(value="phone", required=true) String phone) {
		JSONObject jobj = new JSONObject();
		System.out.println("phone -> " + phone);
		
		/*
		 * username�û���������һ����ĸ�����֣�����3~8
		 */
		String c = "ABCDEFGHIJKLMNOPQISTUVWXYZ" + "ABCDEFGHIJKLMNOPQISTUVWXYZ".toLowerCase();
		String n = "0123456789";
		Random ran = new Random();
		StringBuilder sb = new StringBuilder();
		sb.append(c.charAt(ran.nextInt(c.length())));
		sb.append(n.charAt(ran.nextInt(n.length())));
		StringBuilder sb2 = new StringBuilder(UUID.randomUUID().toString());
		sb2.setLength(6);
		String uuid = sb2.toString();
		String username = sb.toString() + uuid;
		
		// ִ��ע�Ṧ��
		User user = new User();
		user.setName("����" + uuid);
		user.setPhone(phone);
		user.setUsername(username);
		user.setUucode((UUID.randomUUID().toString().replace("-", "")));
		user.setStat(1);
		user.setSex("male");
		user.setPhoto("/photosOfUsers/tx.jpg");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birthday = "1900-02-27";
		Date b = new Date();
		try {
			b = sdf.parse(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user.setBirthday(b);
		
		us.register(user);
		BayernFengUtils.jsonPutCode(jobj, "1");
		BayernFengUtils.jsonPutMsg(jobj, "ע��ɹ�");
		
		return jobj.toJSONString();
	}
	
	@RequestMapping("findPhone.do")
	@ResponseBody
	public String findPhone(@RequestParam(value="phone", required=true) String phone) {
		JSONObject jobj = new JSONObject();
		System.out.println("phone -> " + phone);
		
		
		User result = us.loginByPhone(phone);
		if (result != null) {
			BayernFengUtils.jsonPutCode(jobj, "1");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
		}
		
		
		return jobj.toJSONString();
	}
	
	@RequestMapping("findUsername.do")
	@ResponseBody
	public String findUsername(@RequestParam(value="username", required=true) String username) {
		JSONObject jobj = new JSONObject();
		System.out.println("username -> " + username);
		
		
		User result = us.findUserByUsername(username);
		System.out.println("result -> " + result);
		if (result != null) {
			BayernFengUtils.jsonPutCode(jobj, "1");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
		}
		
		
		return jobj.toJSONString();
	}

	@RequestMapping("findEmail.do")
	@ResponseBody
	public String findEmail(@RequestParam(value="email", required=true) String email) {
		JSONObject jobj = new JSONObject();
		System.out.println("email -> " + email);
		
		User result = us.findUserByEmail(email);
		System.out.println("result -> " + result);
		if (result != null) {
			BayernFengUtils.jsonPutCode(jobj, "1");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
		}
		
		return jobj.toJSONString();
	}
	
	@RequestMapping("changePassword.do")
	@ResponseBody
	public String changePassword(@RequestParam(value="phone", required=true) String phone,
			@RequestParam(value="newPassword", required=true) String newPassword) {
		JSONObject jobj = new JSONObject();
		System.out.println("phone -> " + phone);
		User user = new User();
		user.setPhone(phone);
		user.setPassword(newPassword);
		Integer result = us.changePasswordByPhone(user);
		if (result != null) {
			BayernFengUtils.jsonPutCode(jobj, "1");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
		}
		return jobj.toJSONString();
	}

	@RequestMapping("register.do")
	@ResponseBody
	public String doRegister(@RequestParam(value="username", required=true) String username,
			@RequestParam(value="password", required=true) String password) {
		JSONObject jobj = new JSONObject();
		User user = new User();
		/*
		 * username�û���������һ����ĸ�����֣�����3~8
		 */
		String c = "ABCDEFGHIJKLMNOPQISTUVWXYZ" + "ABCDEFGHIJKLMNOPQISTUVWXYZ".toLowerCase();
		String n = "0123456789";
		Random ran = new Random();
		StringBuilder sb = new StringBuilder();
		sb.append(c.charAt(ran.nextInt(c.length())));
		sb.append(n.charAt(ran.nextInt(n.length())));
		StringBuilder sb2 = new StringBuilder(UUID.randomUUID().toString());
		sb2.setLength(6);
		String uuid = sb2.toString();
		user.setName("����" + uuid);
		user.setUsername(username);
		user.setPassword(password);
		user.setStat(1);
		user.setUucode((UUID.randomUUID().toString().replace("-", "")));
		user.setSex("male");
		user.setPhoto("/photosOfUsers/tx.jpg");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birthday = "1900-02-27";
		Date b = new Date();
		try {
			b = sdf.parse(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user.setBirthday(b);
		Integer result = us.register(user);
		if (result != null) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "ע��ɹ�����ת����¼ҳ��");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "ע��ʧ��");
		}
		return jobj.toJSONString();
	}
	
	@RequestMapping("updateUser.do")
	@ResponseBody
	public String updateUser(HttpServletRequest request,
			@RequestParam(value="id") String id,
			@RequestParam(value="username") String username,
			@RequestParam(value="password") String password,
			@RequestParam(value="birthday") String birthday,
			@RequestParam(value="sex") String sex,
			@RequestParam(value="photo") String photo,
			@RequestParam(value="name") String name,
			@RequestParam(value="stat") Integer stat,
			@RequestParam(value="email") String email,
			@RequestParam(value="phone") String phone) {
		JSONObject jobj = new JSONObject();
		User user = new User();
		user.setId(Integer.parseInt(id));
		user.setUsername(username);
		user.setPassword(password);
		user.setSex(sex);
		user.setPhoto(photo);
		user.setName(name);
		user.setStat(stat);
		user.setEmail(email);
		user.setPhone(phone);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date b = new Date();
		try {
			b = sdf.parse(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user.setBirthday(b);
		
		us.updateUser(user);
		
		BayernFengUtils.jsonPutCode(jobj, "1");
		BayernFengUtils.jsonPutMsg(jobj, "�޸ĳɹ�");
		
		
		// ��session�д�һ���޸ĺ��User������޸ĳɹ������޸ĺ�ĸ���ԭ��session�е�user
		request.getSession().setAttribute("tempModifiedUser", user);
		
		return jobj.toJSONString();
	}
	
	
	@RequestMapping("modifyUserInSession.do")
	public String modifyUserInSession(HttpServletRequest request) {
		
		// ����˷�������˵���޸ĳɹ�
		User tempModifiedUser = (User) request.getSession().getAttribute("tempModifiedUser");
		// ԭ��session���user
		User user = (User) request.getSession().getAttribute("user");
		
		user.setId(tempModifiedUser.getId());
		user.setUsername(tempModifiedUser.getUsername());
		user.setPassword(tempModifiedUser.getPassword());
		user.setSex(tempModifiedUser.getSex());
		user.setPhoto(tempModifiedUser.getPhoto());
		user.setBirthday(tempModifiedUser.getBirthday());
		user.setName(tempModifiedUser.getName());
		user.setEmail(tempModifiedUser.getEmail());
		user.setPhone(tempModifiedUser.getPhone());
		// ����session���user
		request.getSession().setAttribute("user", user);
		
		// ���³ɹ���������ת��ǰ�û�����ҳ��
		return "userHome";
	}
	
	@RequestMapping("fengupload.do")
	public String modifyPhotoOfUser(MultipartFile modifyPhoto, HttpServletRequest request) {
		
		// 1.jpg
		//System.out.println("===========OriginalFilename : " + modifyPhoto.getOriginalFilename());
		String originalFilename = modifyPhoto.getOriginalFilename();
		// ��һ��uuid���ļ���
		StringBuilder sb = new StringBuilder(UUID.randomUUID().toString().replace("-", ""));
		sb.setLength(10);
		String newFilename = "";
		if (originalFilename != "") {
			newFilename = sb.toString() + originalFilename.substring(originalFilename.lastIndexOf("."));
		
			System.out.println("===========newFilename : " + newFilename);
			
			String path = "C:\\Users\\24670\\Pictures\\photosOfUsers" + File.separator + newFilename;
			File file = new File(path);
			System.out.println("=========== path : " + path);
			try {
				modifyPhoto.transferTo(file);
				
				// �޸�session���user
				User user = (User) request.getSession().getAttribute("user");
				String photo = "/photosOfUsers/"+ newFilename;
				user.setPhoto(photo);
				// ����
				request.getSession().setAttribute("user", user);
				// ���µ����ݿ�
				us.updateUser(user);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else {
			// ��ѡ���ļ���
			System.out.println("��ѡ���ļ���");
		}
		
		return "userHome";
	}
	
	@RequestMapping("modifyPassword.do")
	@ResponseBody
	public String modifyPassword(HttpServletRequest request,
			@RequestParam(value="id") String id,
			@RequestParam(value="username") String username,
			@RequestParam(value="password") String password,
			@RequestParam(value="birthday") String birthday,
			@RequestParam(value="sex") String sex,
			@RequestParam(value="photo") String photo,
			@RequestParam(value="stat") Integer stat,
			@RequestParam(value="name") String name,
			@RequestParam(value="email") String email,
			@RequestParam(value="phone") String phone) {
		JSONObject jobj = new JSONObject();
		User user = new User();
		user.setId(Integer.parseInt(id));
		user.setUsername(username);
		user.setPassword(password);
		user.setSex(sex);
		user.setPhoto(photo);
		user.setStat(stat);
		user.setName(name);
		user.setEmail(email);
		user.setPhone(phone);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date b = new Date();
		try {
			b = sdf.parse(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user.setBirthday(b);
		
		us.updateUser(user);
		
		BayernFengUtils.jsonPutCode(jobj, "1");
		BayernFengUtils.jsonPutMsg(jobj, "�޸ĳɹ�");
		
		// �޸��������Ҫ�˳�
		request.getSession().setAttribute("user", null);
		
		return jobj.toJSONString();
	}
	
	// ����ע��
	@RequestMapping(value="/registerByEmail.do",produces="text/html;charset=utf-8")
	@ResponseBody
	public String registerByEmail(@RequestParam(value="email", required=true)String email) {
		
		JSONObject jobj = new JSONObject();
		
		User user = new User();
		/*
		 * username�û���������һ����ĸ�����֣�����3~8
		 */
		String c = "ABCDEFGHIJKLMNOPQISTUVWXYZ" + "ABCDEFGHIJKLMNOPQISTUVWXYZ".toLowerCase();
		String n = "0123456789";
		Random ran = new Random();
		StringBuilder sb = new StringBuilder();
		sb.append(c.charAt(ran.nextInt(c.length())));
		sb.append(n.charAt(ran.nextInt(n.length())));
		StringBuilder sb2 = new StringBuilder(UUID.randomUUID().toString());
		sb2.setLength(6);
		String uuid = sb2.toString();
		String username = sb.toString() + uuid;
		user.setUsername(username);
		user.setPassword(uuid);
		user.setName("����" + uuid);
		user.setEmail(email);
		user.setUucode((UUID.randomUUID().toString().replace("-", "")));
		user.setStat(0);
		user.setSex("male");
		user.setPhoto("/photosOfUsers/tx.jpg");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birthday = "1900-02-27";
		Date b = new Date();
		try {
			b = sdf.parse(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user.setBirthday(b);
		Integer result = us.register(user);
		if ( result > 0 ) {
			//�����ʼ������û�
			new MySendMailThread(user).start();
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "ע��ɹ��������յ�һ�⼤���ʼ�������30�����ڼ���");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "ע��ʧ��");
		}
		return jobj.toJSONString();
	}
	
	// ����ע����û�����
	@RequestMapping(value="activeUser.do")
	public String updateStat(@RequestParam(value="uuCode")String uuCode){
		try {
			User user = new User();
			user.setStat(1);
			user.setUucode(uuCode);
			Integer result = us.updateStat(user);
			if ( result > 0 ) {
				System.out.println("�û��Ѽ���");
			} else {
				System.out.println("�û�����ʧ��");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "login";
	}
}

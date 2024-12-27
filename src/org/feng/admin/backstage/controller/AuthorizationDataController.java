/**
 * 
 */
package org.feng.admin.backstage.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.feng.admin.backstage.service.AdminRoleService;
import org.feng.admin.bean.AdminRoleAuthorization;
import org.feng.admin.bean.AdminUser;
import org.feng.util.BayernFengUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * @author 姜峰
 *
 */
@Controller
@RequestMapping(value="admin/data", produces="text/html;charset=utf-8")
public class AuthorizationDataController {

	@Autowired
	@Qualifier("adminRoleService")
	private AdminRoleService rs;
	
	@RequestMapping("findAuthorizationsByRole_Id.do")
	@ResponseBody
	public String findAuthorizationsByRole_Id(@RequestParam(value="role_id", required=true) Integer role_id,
			HttpServletRequest request, HttpServletResponse response) {
		
		JSONObject jobj = new JSONObject();
		
		
		List<AdminRoleAuthorization> result = null;
		
		try {
			result = rs.getAuthorizationsByRole_Id(role_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result != null && result.size() > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "拿到给角色的权限");
			jobj.put("authorizations", result);
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "获取失败");
		}
		
		return jobj.toJSONString();
	}

	@RequestMapping("updateAuthorizationsForRole_Id.do")
	@ResponseBody
	public String updateAuthorizationsForRole_Id(@RequestParam(value="role_id", required=true) Integer role_id,
			@RequestParam(value="ids", required=true) String ids,
			HttpServletRequest request, HttpServletResponse response) {
		
		JSONObject jobj = new JSONObject();
		
		// {"2":"2","3":"3","4":"4","6":"6","7":"7","8":"8","10":"10","11":"11","12":"12","13":"13","14":"14"}
		//System.out.println(role_id+" ids=========================" + ids);
//		String[] idsArr = BayernFengUtils.getFromSplitedStringExcept(ids, "\"", "{", "}", ",", ":");
		String[] idsArr = BayernFengUtils.makeArrayWithGivenJSONStringForIds(ids);
		System.out.println("============================"+Arrays.toString(idsArr));
		
		List<AdminRoleAuthorization> listOfAdminRoleAuthorization = new ArrayList<>();
		for (String authid : idsArr) {
			AdminRoleAuthorization ara = new AdminRoleAuthorization();
			ara.setRole_id(role_id);
			ara.setAuthorization_id(Integer.parseInt(authid));
			listOfAdminRoleAuthorization.add(ara);
		}
		
		Integer result = null;
		
		try {
			result = rs.updateAuthorizationsForRole_Id(listOfAdminRoleAuthorization);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result != null && result > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "修改角色权限成功");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "修改角色权限失败");
		}
		
		return jobj.toJSONString();
	}
	
}

/**
 * 
 */
package org.feng.controller;

import org.feng.util.BayernFengUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * @author ½ª·å
 *
 */
@Controller
@RequestMapping(value="util", produces="text/html;charset=utf-8")
public class UtilController {
	
	@RequestMapping("getCode.do")
	@ResponseBody
	public String getVerificationCode() {
		JSONObject jobj = new JSONObject();
		
		String phone = "18895760831";
		String code = BayernFengUtils.getVerificationCode(phone);
		
		BayernFengUtils.jsonPutCode(jobj, "1");
		BayernFengUtils.jsonPutMsg(jobj, code);
		
		return jobj.toJSONString();
	}

}

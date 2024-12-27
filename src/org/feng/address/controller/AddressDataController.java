/**
 * 
 */
package org.feng.address.controller;

import java.util.List;

import org.feng.address.service.AddressService;
import org.feng.bean.Province;
import org.feng.util.BayernFengUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

/**
 * @author 姜峰
 *
 */
@Controller
@RequestMapping(value="address", produces="text/html;charset=utf-8")
public class AddressDataController {

	@Autowired
	@Qualifier("addressService")
	private AddressService as;
	
	@RequestMapping("getAllAddresses.do")
	@ResponseBody
	public String getAllAddresses() {
		JSONObject jobj = new JSONObject();
		
		List<Province> addresses =  as.getAllAddresses();
		
		if (addresses.size() > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, addresses);
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "未找到地址数据");
		}
		
		return JSONObject.toJSONString(jobj, true);
	}
	
}

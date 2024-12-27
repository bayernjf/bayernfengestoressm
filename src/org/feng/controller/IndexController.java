/**
 * 
 */
package org.feng.controller;

import java.util.List;

import org.feng.bean.Good;
import org.feng.product.service.GoodService;
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
@RequestMapping(produces="text/html;charset=utf-8")
public class IndexController {
	
	@Autowired
	@Qualifier("goodService")
	private GoodService gs;
	
	// 此链接，从数据库拿到是数据，返回一个JSON的格式
	@RequestMapping("index/getTopTenPopularGoods.do")
	@ResponseBody
	public String getTopTenPopularGoodsForIndexPage() {
		JSONObject jobj = new JSONObject();
		
		List<Good> tenGoods = gs.getTopTenGoods();
		
		//jobj.put("tenGoods", tenGoods);
		if (tenGoods.size() > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, tenGoods);
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "查询失败");
		}
		
		return jobj.toJSONString();
	}
	
	// 此链接，从数据库拿到是数据，返回一个JSON的格式
	@RequestMapping("index/getTopTenNewGoods.do")
	@ResponseBody
	public String getTopTenNewGoodsForIndexPage() {
		JSONObject jobj = new JSONObject();
		
		List<Good> tenNewGoods = gs.getTopTenNewGoods();
		
		//jobj.put("tenGoods", tenGoods);
		if (tenNewGoods.size() > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, tenNewGoods);
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "查询失败");
		}
		
		return jobj.toJSONString();
	}

	@RequestMapping("index.html")
	public String showIndexPage() {
		return "index";
	}
	
}

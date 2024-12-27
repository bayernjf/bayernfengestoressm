/**
 * 
 */
package org.feng.product.controller;

import java.util.List;

import org.feng.bean.Category;
import org.feng.bean.Good;
import org.feng.product.service.CategoryService;
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
@RequestMapping(value="category", produces="text/html;charset=utf-8")
public class CategoryDataController {
	
	@Autowired
	@Qualifier("categoryService")
	private CategoryService cs;
	
	@RequestMapping("default.do")
	@ResponseBody
	public String showGoodsByCategoryByDefault() {
		JSONObject jobj = new JSONObject();
		List<Good> goods = cs.getGoodsByDefault();
		if (goods.size() > 0) {
			BayernFengUtils.jsonPutCode(jobj, 1);
			BayernFengUtils.jsonPutMsg(jobj, goods);
		} else {
			BayernFengUtils.jsonPutCode(jobj, -1);
			BayernFengUtils.jsonPutMsg(jobj, "未找到信息");
		}
		return jobj.toJSONString();
	}

	// 列出所有分类
	@RequestMapping("showAllcategories.do")
	@ResponseBody
	public String showAllcategories() {
		JSONObject jobj = new JSONObject();
		List<Category> categories = cs.getCategoriesWithParentCategory();
		if (categories.size() > 0) {
			BayernFengUtils.jsonPutCode(jobj, 1);
			BayernFengUtils.jsonPutMsg(jobj, categories);
		} else {
			BayernFengUtils.jsonPutCode(jobj, -1);
			BayernFengUtils.jsonPutMsg(jobj, "未找到信息");
		}
		/*
		 *  {
		 *  	"childrenCate":[{"id":2,"parentid":1,"type":"无公害蔬菜"},{"id":3,"parentid":1,"type":"特菜类"},{"id":4,"parentid":1,"type":"有机蔬菜"}],
		 *  	"id":1,
		 *  	"type":"蔬菜"
		 *  }
		 */
		return jobj.toJSONString();
	}
	
}

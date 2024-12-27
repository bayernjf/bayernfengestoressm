/**
 * 
 */
package org.feng.admin.product.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 姜峰
 *
 */
@Controller
@RequestMapping(value="admin", produces="text/html;charset=utf-8")
public class AdminProductController {
	
	@RequestMapping("productPublish.html")
	public String productPublish() {
		
		// 获得所有分类，显示到商品发布页面
		
		
		return "admin/productPublish";
	}

	@RequestMapping("productManage.html")
	public String productManage(HttpServletRequest request) {
		
//		request.getSession().setAttribute("goods", null);
//		request.getSession().setAttribute("mapOfPageInfo", null);
//		request.getSession().setAttribute("keyWords", null);
		
		return "admin/productManage";
	}

	@RequestMapping("productOffshelf.html")
	public String productOffshelf(HttpServletRequest request) {
		
//		request.getSession().setAttribute("goods", null);
//		request.getSession().setAttribute("mapOfPageInfo", null);
//		request.getSession().setAttribute("keyWords", null);
		
		return "admin/productOffshelf";
	}

}

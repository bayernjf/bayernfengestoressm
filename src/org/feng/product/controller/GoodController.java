
/**
 * 
 */
package org.feng.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ����
 *
 */
@Controller
@RequestMapping(value="good", produces="text/html;charset=utf-8")
public class GoodController {
	
	// ·����ֵ
	@RequestMapping("goodDetail.html/{goodId}")
	public String showGoodDetailPage(@PathVariable("goodId") String id) {
//		System.out.println("id : " + id);
		return "goodDetail";
	}
	
	// ·����ֵ
	@RequestMapping("showGoodsByCategory_Id.html/{category_id}/{pageNo}")
	public String showGoodsByCategory_IdPage(@PathVariable("category_id") String id,
			@PathVariable("pageNo") String pageNo) {
		System.out.println("11111111111111category_id : " + id);
		System.out.println("11111111111111pageNo : " + pageNo);
		return "category";
	}

	// ·����ֵ
	@RequestMapping("goodsByFuzzySearch.html/{keyWords}/{pageNo}")
	public String goodsByFuzzySearch(@PathVariable("keyWords") String keyWords,
			@PathVariable("pageNo") String pageNo) {
//		System.out.println("id : " + id);
		return "goodsByFuzzySearch";
	}

}

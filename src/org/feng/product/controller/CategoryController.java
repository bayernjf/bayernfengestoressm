/**
 * 
 */
package org.feng.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ½ª·å
 *
 */
@Controller
@RequestMapping(value="category", produces="text/html;charset=utf-8")
public class CategoryController {
	
	@RequestMapping("category.html")
	public String showCategoryPage() {
		return "category";
	}

}

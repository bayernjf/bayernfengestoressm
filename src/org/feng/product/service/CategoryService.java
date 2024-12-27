/**
 * 
 */
package org.feng.product.service;

import java.util.List;

import org.feng.bean.Category;
import org.feng.bean.Good;

/**
 * @author ½ª·å
 *
 */
public interface CategoryService {

	/**
	 * @return
	 */
	List<Good> getGoodsByDefault();
	
	List<Category> getCategoriesWithParentCategory();

	/**
	 * @param parseInt
	 * @return
	 */
	Category getCategoryById(Integer id);

	/**
	 * @param intId
	 * @return
	 */
	List<Category> getCategoriesByParentid(Integer parentid);

}

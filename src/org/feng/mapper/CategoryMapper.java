/**
 * 
 */
package org.feng.mapper;

import java.util.List;

import org.feng.bean.Category;
import org.feng.bean.Good;

/**
 * @author ½ª·å
 *
 */
public interface CategoryMapper {

	/**
	 * @return
	 */
	List<Good> getByDefault();
	
	List<Category> getCategoriesWithParentCategory();

	/**
	 * @param id
	 * @return
	 */
	Category getById(Integer id);

	/**
	 * @param parentid
	 * @return
	 */
	List<Category> getCategoriesByParentid(Integer parentid);
	
}

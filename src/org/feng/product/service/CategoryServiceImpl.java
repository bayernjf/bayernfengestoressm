/**
 * 
 */
package org.feng.product.service;

import java.util.List;

import org.feng.bean.Category;
import org.feng.bean.Good;
import org.feng.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ½ª·å
 *
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryMapper mapper;

	/* (non-Javadoc)
	 * @see org.feng.product.service.CategoryService#getGoodsByDefault()
	 */
	@Override
	public List<Good> getGoodsByDefault() {
		return this.mapper.getByDefault();
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.CategoryService#getCategoriesWithParentCategory()
	 */
	@Override
	public List<Category> getCategoriesWithParentCategory() {
		return this.mapper.getCategoriesWithParentCategory();
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.CategoryService#getCategoryById(java.lang.Integer)
	 */
	@Override
	public Category getCategoryById(Integer id) {
		return this.mapper.getById(id);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.CategoryService#getCategoriesByParentid(java.lang.Integer)
	 */
	@Override
	public List<Category> getCategoriesByParentid(Integer parentid) {
		return this.mapper.getCategoriesByParentid(parentid);
	}
	
}

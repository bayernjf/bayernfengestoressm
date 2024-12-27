/**
 * 
 */
package org.feng.bean;

import java.util.List;

import com.alibaba.fastjson.JSON;

/**
 * @author 姜峰
 *
 */
public class Category {

	private Integer id;
	private String type;
	// 不能设置外键。但是该属性是该表里的一个id。
	private Integer parentid;
	
	private Category parentCategory;
	
	// 子category的集合
	private List<Category> childrenCate;

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(Integer id, String type, Integer parentid, Category parentCategory, List<Category> childrenCate) {
		super();
		this.id = id;
		this.type = type;
		this.parentid = parentid;
		this.parentCategory = parentCategory;
		this.childrenCate = childrenCate;
	}

	public List<Category> getChildrenCate() {
		return childrenCate;
	}

	public void setChildrenCate(List<Category> childrenCate) {
		this.childrenCate = childrenCate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public Category getParentCategory() {
		return parentCategory;
	}

	public void setParentCategory(Category parentCategory) {
		this.parentCategory = parentCategory;
	}

	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}

}

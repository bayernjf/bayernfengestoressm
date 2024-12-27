/**
 * 
 */
package org.feng.util;

/**
 * @author 姜峰<br>
 * 相关getter和setter方法操作的实现类的实例Field<br>
 * Integer pageNo		-> 页数<br>
 * Integer pageSize		-> 每页显示的记录数<br>
 * Integer count		-> 总记录数<br>
 * Integer totalPages	-> 总页数<br>
 * 
 */
public interface PageModel {

//	Integer pageNo = 0;
//	Integer pageSize = 0;
//	Integer count = 0;
//	Integer totalPages = 0;

	public Integer getPageNo();

	public void setPageNo(Integer pageNo);

	public Integer getPageSize();

	public void setPageSize(Integer pageSize);

	public Integer getTotalPages();

	public void setTotalPages(Integer totalPages);

	public Integer getCount();

	public void setCount(Integer count);
	
}

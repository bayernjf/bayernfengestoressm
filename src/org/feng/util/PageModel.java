/**
 * 
 */
package org.feng.util;

/**
 * @author ����<br>
 * ���getter��setter����������ʵ�����ʵ��Field<br>
 * Integer pageNo		-> ҳ��<br>
 * Integer pageSize		-> ÿҳ��ʾ�ļ�¼��<br>
 * Integer count		-> �ܼ�¼��<br>
 * Integer totalPages	-> ��ҳ��<br>
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

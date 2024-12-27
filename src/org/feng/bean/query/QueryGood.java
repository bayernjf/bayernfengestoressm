/**
 * 
 */
package org.feng.bean.query;

import java.util.List;

/**
 * @author ½ª·å
 *
 */
public class QueryGood {
	
	private List<Integer> category_ids;
	private String keyWords;
	private Integer firstValueOfLimit;
	private Integer secondValueOfLimit;
	private List<Integer> ids;
	
	public Integer getFirstValueOfLimit() {
		return firstValueOfLimit;
	}

	public void setFirstValueOfLimit(Integer firstValueOfLimit) {
		this.firstValueOfLimit = firstValueOfLimit;
	}

	public Integer getSecondValueOfLimit() {
		return secondValueOfLimit;
	}

	public void setSecondValueOfLimit(Integer secondValueOfLimit) {
		this.secondValueOfLimit = secondValueOfLimit;
	}

	public List<Integer> getCategory_ids() {
		return category_ids;
	}

	public void setCategory_ids(List<Integer> category_ids) {
		this.category_ids = category_ids;
	}

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

}

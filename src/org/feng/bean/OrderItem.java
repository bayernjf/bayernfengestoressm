/**
 * 
 */
package org.feng.bean;

import com.alibaba.fastjson.JSON;

/**
 * @author ½ª·å
 *
 */
public class OrderItem {
	
	private String order_id;
	private Integer good_id;
	private Integer buynum;
	
	private Good good;
	
	public OrderItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	public OrderItem(String order_id, Integer good_id, Integer buynum) {
		super();
		this.order_id = order_id;
		this.good_id = good_id;
		this.buynum = buynum;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public Integer getGood_id() {
		return good_id;
	}

	public void setGood_id(Integer good_id) {
		this.good_id = good_id;
	}

	public Integer getBuynum() {
		return buynum;
	}

	public void setBuynum(Integer buynum) {
		this.buynum = buynum;
	}

	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}

}

/**
 * 
 */
package org.feng.bean;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSON;

/**
 * @author ½ª·å
 *
 */
public class Order {

	private String id;
	private Integer user_id;
	private Double totalprice;
	private String address;
	private Integer stat;
	private String statName;
	private Date createtime;
	private String receivename;
	private String phone;
	private Integer address_id;
	
	private Address addressObj;
	
	private List<OrderItem> orderItems;
	
	private List<Good> listOfGood;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public String getStatName() {
		return statName;
	}



	public void setStatName(String statName) {
		this.statName = statName;
	}



	public List<Good> getListOfGood() {
		return listOfGood;
	}



	public void setListOfGood(List<Good> listOfGood) {
		this.listOfGood = listOfGood;
	}



	public String getId() {
		return id;
	}



	public List<OrderItem> getOrderItems() {
		return orderItems;
	}



	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}



	public void setId(String id) {
		this.id = id;
	}



	public Integer getUser_id() {
		return user_id;
	}



	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}



	public Double getTotalprice() {
		return totalprice;
	}



	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public Integer getStat() {
		return stat;
	}



	public void setStat(Integer stat) {
		this.stat = stat;
	}



	public Date getCreatetime() {
		return createtime;
	}



	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}



	public String getReceivename() {
		return receivename;
	}



	public void setReceivename(String receivename) {
		this.receivename = receivename;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public Integer getAddress_id() {
		return address_id;
	}



	public void setAddress_id(Integer address_id) {
		this.address_id = address_id;
	}



	public Address getAddressObj() {
		return addressObj;
	}



	public void setAddressObj(Address addressObj) {
		this.addressObj = addressObj;
	}



	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}

}

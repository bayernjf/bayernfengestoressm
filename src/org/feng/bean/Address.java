/**
 * 
 */
package org.feng.bean;

import com.alibaba.fastjson.JSON;

/**
 * @author ½ª·å
 *
 */
public class Address {

	private Integer id;
	private Integer province_codeid;
	private String detaAddr;
	private Integer user_id;
	
	private User user;

	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Address(Integer id, Integer province_codeid, String detaAddr, Integer user_id, User user) {
		super();
		this.id = id;
		this.province_codeid = province_codeid;
		this.detaAddr = detaAddr;
		this.user_id = user_id;
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProvince_codeid() {
		return province_codeid;
	}

	public void setProvince_codeid(Integer province_codeid) {
		this.province_codeid = province_codeid;
	}

	public String getDetaAddr() {
		return detaAddr;
	}

	public void setDetaAddr(String detaAddr) {
		this.detaAddr = detaAddr;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
	
}

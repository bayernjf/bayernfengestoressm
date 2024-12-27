/**
 * 
 */
package org.feng.bean;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSON;

/**
 * @author 姜峰
 *
 */
public class User {

	private Integer id;
	private String username;
	private String password;
	private String name;
	private String email;
	private String phone;
	private Date birthday;
	private String sex;
	private String address;
	private String photo;
	private Integer stat;
	// 每次注册的时候，给一个uuid
	private String uucode;
	private Date registertime;
	private Date logintime;
	
	private List<Address> addressList;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(Integer id, String username, String password, String name, String email, String phone, Date birthday,
			String sex, String address, String photo, Integer stat, List<Address> addressList, String uucode) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.sex = sex;
		this.address = address;
		this.photo = photo;
		this.stat = stat;
		this.addressList = addressList;
		this.uucode = uucode;
	}

	public Date getRegistertime() {
		return registertime;
	}

	public void setRegistertime(Date registertime) {
		this.registertime = registertime;
	}

	public Date getLogintime() {
		return logintime;
	}

	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}

	public String getUucode() {
		return uucode;
	}

	public void setUucode(String uucode) {
		this.uucode = uucode;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Integer getStat() {
		return stat;
	}

	public void setStat(Integer stat) {
		this.stat = stat;
	}

	public List<Address> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}

	@Override
	public String toString() {
		// 返回一个json格式的字符串
		return JSON.toJSONString(this);
	}
	
}

/**
 * 
 */
package org.feng.admin.bean;

import java.util.Date;

/**
 * @author ½ª·å
 *
 */
public class AdminUser {
	
	private Integer id;
	private String username;
	private String password;
	private Date createtime;
	// 1 ÆôÓÃ 0 ½ûÓÃ
	private Integer stat;
	private String photo;
	private String phone;
	private Integer role_id;
	
	private AdminRole role;

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

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getStat() {
		return stat;
	}

	public void setStat(Integer stat) {
		this.stat = stat;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}

	public AdminRole getRole() {
		return role;
	}

	public void setRole(AdminRole role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "AdminUser [id=" + id + ", username=" + username + ", password=" + password + ", createtime="
				+ createtime + ", stat=" + stat + ", photo=" + photo + ", phone=" + phone + ", role_id=" + role_id
				+ ", role=" + role + "]";
	}

	
	
}

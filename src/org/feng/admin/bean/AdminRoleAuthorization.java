/**
 * 
 */
package org.feng.admin.bean;

/**
 * @author ½ª·å
 *
 */
public class AdminRoleAuthorization {
	
	private Integer role_id;
	private Integer authorization_id;
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public Integer getAuthorization_id() {
		return authorization_id;
	}
	public void setAuthorization_id(Integer authorization_id) {
		this.authorization_id = authorization_id;
	}
	@Override
	public String toString() {
		return "AdminRoleAuthorization [role_id=" + role_id + ", authorization_id=" + authorization_id + "]";
	}
	
}

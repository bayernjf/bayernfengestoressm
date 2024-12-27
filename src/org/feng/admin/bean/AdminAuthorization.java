/**
 * 
 */
package org.feng.admin.bean;

/**
 * @author ½ª·å
 *
 */
public class AdminAuthorization {
	
	private Integer id;
	private String menu;
	private String url;
	private Integer parentid;
	
	private AdminAuthorization authorization;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public AdminAuthorization getAuthorization() {
		return authorization;
	}

	public void setAuthorization(AdminAuthorization authorization) {
		this.authorization = authorization;
	}

	@Override
	public String toString() {
		return "AdminAuthorization [id=" + id + ", menu=" + menu + ", url=" + url + ", parentid=" + parentid
				+ ", authorization=" + authorization + "]";
	}
	
	
	
}

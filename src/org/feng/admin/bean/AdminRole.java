/**
 * 
 */
package org.feng.admin.bean;

/**
 * @author ½ª·å
 *
 */
public class AdminRole {

	private Integer id;
	private String name;
	private Integer stat;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getStat() {
		return stat;
	}
	public void setStat(Integer stat) {
		this.stat = stat;
	}
	@Override
	public String toString() {
		return "AdminRole [id=" + id + ", name=" + name + ", stat=" + stat + "]";
	}
	
}

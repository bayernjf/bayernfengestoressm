/**
 * 
 */
package org.feng.bean;

import java.util.List;

import com.alibaba.fastjson.JSON;

/**
 * @author ½ª·å
 *
 */
public class Province {
	
	private Integer codeid;
	private Integer parentid;
	private String cityName;
	
	private List<Province> childrenProvinces;
	
	public Province() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Province(Integer codeid, Integer parentid, String cityName, List<Province> childrenProvinces) {
		super();
		this.codeid = codeid;
		this.parentid = parentid;
		this.cityName = cityName;
		this.childrenProvinces = childrenProvinces;
	}

	public List<Province> getChildrenProvinces() {
		return childrenProvinces;
	}

	public void setChildrenProvinces(List<Province> childrenProvinces) {
		this.childrenProvinces = childrenProvinces;
	}

	public Integer getCodeid() {
		return codeid;
	}

	public void setCodeid(Integer codeid) {
		this.codeid = codeid;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}

}

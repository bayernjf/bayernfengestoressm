/**
 * 
 */
package org.feng.bean;

import java.util.Date;

import com.alibaba.fastjson.JSON;

/**
 * @author ½ª·å
 *
 */
public class Good {
	
	private Integer id;
	private String name;
	private Double marketprice;
	private Double estoreprice;
	private Integer category_id;
	private Integer num;
	private String titleimage;
	private String description;
	private Integer hot;
	private Date production_date;
	private Date expiry_date;
	
	private Integer stat;
	
	private Category category;
	
	private Integer buynum;
	private Double priceWithBuynum;
	
	public Good() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Double getPriceWithBuynum() {
		return priceWithBuynum;
	}

	public void setPriceWithBuynum(Double priceWithBuynum) {
		this.priceWithBuynum = priceWithBuynum;
	}

	public Good(Integer id, String name, Double marketprice, Double estoreprice, Integer category_id, Integer num,
			String titleimage, String description, Integer hot, Date production_date, Date expiry_date,
			Category category) {
		super();
		this.id = id;
		this.name = name;
		this.marketprice = marketprice;
		this.estoreprice = estoreprice;
		this.category_id = category_id;
		this.num = num;
		this.titleimage = titleimage;
		this.description = description;
		this.hot = hot;
		this.production_date = production_date;
		this.expiry_date = expiry_date;
		this.category = category;
	}

	public Integer getBuynum() {
		return buynum;
	}

	public void setBuynum(Integer buynum) {
		this.buynum = buynum;
	}

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

	public Double getMarketprice() {
		return marketprice;
	}

	public void setMarketprice(Double marketprice) {
		this.marketprice = marketprice;
	}

	public Double getEstoreprice() {
		return estoreprice;
	}

	public void setEstoreprice(Double estoreprice) {
		this.estoreprice = estoreprice;
	}

	public Integer getCategory_id() {
		return category_id;
	}

	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getTitleimage() {
		return titleimage;
	}

	public void setTitleimage(String titleimage) {
		this.titleimage = titleimage;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getHot() {
		return hot;
	}

	public void setHot(Integer hot) {
		this.hot = hot;
	}

	public Date getProduction_date() {
		return production_date;
	}

	public void setProduction_date(Date production_date) {
		this.production_date = production_date;
	}

	public Date getExpiry_date() {
		return expiry_date;
	}

	public void setExpiry_date(Date expiry_date) {
		this.expiry_date = expiry_date;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Integer getStat() {
		return stat;
	}

	public void setStat(Integer stat) {
		this.stat = stat;
	}

	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}

}

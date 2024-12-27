/**
 * 
 */
package org.feng.admin.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.feng.bean.Good;
import org.feng.bean.User;
import org.feng.product.service.CategoryService;
import org.feng.product.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 姜峰
 *
 */
@Controller
@RequestMapping(value="admin/data", produces="text/html;charset=utf-8")
public class AdminProductDataController {
	
	@Autowired
	@Qualifier("goodService")
	private GoodService gs;
	
	@Autowired
	@Qualifier("categoryService")
	private CategoryService cs;
	
	@RequestMapping("productPublishing.do")
	public ModelAndView productPublish(@RequestParam("name") String name,
			@RequestParam("marketprice") String marketprice,
			@RequestParam("estoreprice") String estoreprice,
			@RequestParam("category_idFu") String category_idFu,
			@RequestParam("category_idZi") String category_idZi,
			@RequestParam("num") String num,
			@RequestParam("titleimage") MultipartFile titleimage,
			@RequestParam("description") String description,
			@RequestParam("production_date") String production_date,
			@RequestParam("expiry_date") String expiry_date,
			@RequestParam("stat") String stat,
			HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		Good good = new Good();
		Integer result = null;
		try {
			good.setStat(Integer.parseInt(stat));
			good.setName(name);
			good.setMarketprice(Double.parseDouble(marketprice));
			good.setEstoreprice(Double.parseDouble(estoreprice));
			// 需要处理一下
			good.setCategory_id(Integer.parseInt(category_idZi));
			good.setNum(Integer.parseInt(num));
	//		good.setTitleimage(titleimage);
			String originalFilename = titleimage.getOriginalFilename();
			// 给一个uuid的文件名
			StringBuilder sb = new StringBuilder(UUID.randomUUID().toString().replace("-", ""));
			sb.setLength(10);
			String newFilename = "";
			if (originalFilename != "") {
				newFilename = sb.toString() + originalFilename.substring(originalFilename.lastIndexOf("."));
				String path = "C:\\Users\\24670\\Pictures\\upload\\image" + File.separator + newFilename;
				File file = new File(path);
				try {
					titleimage.transferTo(file);
					good.setTitleimage(newFilename);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} else {
				// 请选择文件名
				System.out.println("请选择文件名");
				throw new Exception();
			}
			good.setDescription(description);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date p_date = new Date();
			Date e_date = new Date();
			try {
				p_date = sdf.parse(production_date);
				e_date = sdf.parse(expiry_date);
			} catch (ParseException e) {
				e.printStackTrace();
				throw new Exception();
			}
			good.setProduction_date(p_date);
			good.setExpiry_date(e_date);
			try {
				result = gs.addGood(good);
				if (result != null && result > 0) {
					mv.setViewName("admin/productPublish");
				} else {
					request.getSession().setAttribute("message", "添加失败");
					request.getSession().setAttribute("nextpage", "admin/productPublish.html");
					mv.setViewName("redirect:/admin/fengmessage.html");
					throw new Exception();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception();
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("message", "字段无效，请输入有效信息");
			request.getSession().setAttribute("nextpage", "admin/productPublish.html");
			mv.setViewName("redirect:/admin/fengmessage.html");
		}
		
		System.out.println("=========good -> " + result);
		
//		return "admin/productPublish";
		return mv;
	}

	
	private Integer id;
	@RequestMapping("productModify.html/{id}")
	public String productModify(@PathVariable("id") Integer id,
			HttpServletRequest request) {
		
		this.id = id;
		
		Good good = gs.getGoodById(id);
		
		// 设置category
		good.setCategory(cs.getCategoryById(good.getCategory_id()));
		
		request.getSession().setAttribute("goodToBeModified", good);
		
		return "admin/productModify";
	}
	
	@RequestMapping("productModify.do")
	public ModelAndView productModify(@RequestParam("name") String name,
			@RequestParam("marketprice") String marketprice,
			@RequestParam("estoreprice") String estoreprice,
			@RequestParam("category_idFu") String category_idFu,
			@RequestParam("category_idZi") String category_idZi,
			@RequestParam("num") String num,
			@RequestParam("titleimage") MultipartFile titleimage,
			@RequestParam("description") String description,
			@RequestParam("production_date") String production_date,
			@RequestParam("expiry_date") String expiry_date,
			@RequestParam("stat") String stat,
			HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		Good good = new Good();
		Integer result = null;
		try {
			
			good.setStat(Integer.parseInt(stat));
			
			good.setId(this.id);
			
			
			good.setName(name);
			good.setMarketprice(Double.parseDouble(marketprice));
			good.setEstoreprice(Double.parseDouble(estoreprice));
			// 需要处理一下
			good.setCategory_id(Integer.parseInt(category_idZi));
			good.setNum(Integer.parseInt(num));
	//		good.setTitleimage(titleimage);
			String originalFilename = titleimage.getOriginalFilename();
			// 给一个uuid的文件名
			StringBuilder sb = new StringBuilder(UUID.randomUUID().toString().replace("-", ""));
			sb.setLength(10);
			String newFilename = "";
			if (originalFilename != "") {
				newFilename = sb.toString() + originalFilename.substring(originalFilename.lastIndexOf("."));
				String path = "C:\\Users\\24670\\Pictures\\upload\\image" + File.separator + newFilename;
				File file = new File(path);
				try {
					titleimage.transferTo(file);
					good.setTitleimage(newFilename);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} else {
				// 请选择文件名
				System.out.println("请选择文件名");
				throw new Exception();
			}
			good.setDescription(description);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date p_date = new Date();
			Date e_date = new Date();
			try {
				p_date = sdf.parse(production_date);
				e_date = sdf.parse(expiry_date);
			} catch (ParseException e) {
				e.printStackTrace();
				throw new Exception();
			}
			good.setProduction_date(p_date);
			good.setExpiry_date(e_date);
			try {
//				result = gs.addGood(good);
				result = gs.updateGood(good);
				if (result != null && result > 0) {
					mv.setViewName("admin/productManage");
				} else {
					request.getSession().setAttribute("message", "添加失败");
					request.getSession().setAttribute("nextpage", "admin/data/productModify.html/"+this.id);
					mv.setViewName("redirect:/admin/fengmessage.html");
					try {
						throw new Exception();
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception();
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("message", "字段无效，请输入有效信息");
			request.getSession().setAttribute("nextpage", "admin/data/productModify.html/"+this.id);
			mv.setViewName("redirect:/admin/fengmessage.html");
		}
		
		System.out.println("=========good -> " + result);
		
//		return "admin/productPublish";
		return mv;
	}
	
}

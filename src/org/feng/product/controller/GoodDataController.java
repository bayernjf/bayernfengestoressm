
/**
 * 
 */
package org.feng.product.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.feng.admin.bean.AdminRoleAuthorization;
import org.feng.bean.Category;
import org.feng.bean.Good;
import org.feng.bean.query.QueryGood;
import org.feng.product.service.CategoryService;
import org.feng.product.service.GoodService;
import org.feng.util.BayernFengUtils;
import org.feng.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

/**
 * @author 姜峰
 *
 */
@Controller
@RequestMapping(value="good/data", produces="text/html;charset=utf-8")
public class GoodDataController {

	@Autowired
	@Qualifier("goodService")
	private GoodService gs;
	
	@Autowired
	@Qualifier("categoryService")
	private CategoryService cs;
	
	@RequestMapping("getGoodById.do/{goodId}")
	@ResponseBody
	public String getGoodById(@PathVariable("goodId") String id) {
		JSONObject jobj = new JSONObject();
//		System.out.println("============================id " + id);
		Good good = gs.getGoodById(Integer.parseInt(id));
		if (good != null) {
			BayernFengUtils.jsonPutCode(jobj, 1);
			BayernFengUtils.jsonPutMsg(jobj, good);
		} else {
			BayernFengUtils.jsonPutCode(jobj, -1);
			BayernFengUtils.jsonPutMsg(jobj, "未能找到商品");
		}
		return jobj.toString();
	}
	
	@RequestMapping("getGoodByIdWithSearch.do")
	public ModelAndView getGoodByIdWithSearch(@RequestParam(value="id", required=true) Integer id,
			HttpServletRequest request, HttpServletResponse response) {
		
		Good whenModify = (Good) request.getSession().getAttribute("whenModify");
		Integer i = null;
		if (whenModify != null) {
			i = whenModify.getId();
		}
		if (i != null) {
			id = i;
		}
		request.getSession().setAttribute("whenModify", null);
		
		
		ModelAndView mv = new ModelAndView();
		
		Good result = null;
		
		try {
			result = gs.getGoodById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result != null) {
			request.getSession().setAttribute("foundGood", result);
			mv.setViewName("admin/productManage");
		} else {
			// 清除上一次查询的结果
			request.getSession().setAttribute("foundGood", null);
			
			request.getSession().setAttribute("message", "查询失败");
			request.getSession().setAttribute("nextpage", "admin/productManage.html");
			mv.setViewName("redirect:/admin/fengmessage.html");
		}
		
		return mv;
	}
	
	@RequestMapping("getGoodsByCategory_Id.do/{category_id}/{pageNo}")
	@ResponseBody
	public String getGoodsByCategory_Id(@PathVariable("category_id") String category_id,
			@PathVariable("pageNo") String pageNo,
			@RequestParam(value="pageSize", required=true) String pageSize) {
		JSONObject jobj = new JSONObject();
		System.out.println("============================category_id " + category_id);
		System.out.println("============================pageNo " + pageNo);
		
		List<Good> goods = new ArrayList<>();
		Map<String, Object> mapOfPageInfo = new HashMap<>();
		Integer showNums = 5;
		Integer[] valsForLimit = BayernFengUtils.twoValuesForMySQLLimit(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
		/*
		 * 点击产品分类的时候：
		 *  根据传来的category_id判断
		 *  1、获得所有
		 *  2、根据id获得
		 *  3、更具parentid获得
		 */
		if (category_id.equals("0")) {
//			goods = gs.getAllGoods();
			// 分页查询
			goods = gs.getAllGoodsByPage(valsForLimit);
			// 分页查询所需的前端表现
			PageModel pm = BayernFengUtils.getPageModelInstance();
			pm.setCount(BayernFengUtils.getBeanCountOfTableOf(Good.class));
			mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
		} else {
			Integer intId = Integer.parseInt(category_id);
			// 判断该category_id是否是父分类
			Category c = cs.getCategoryById(intId);
			System.out.println("========================Category : " + c);
			Integer parentid = c.getParentid();
			if (parentid == 0) {
				// 获得该category的所有子category
				List<Category> categories = cs.getCategoriesByParentid(intId);
				List<Integer> ids = new ArrayList<>();
				for (Category category : categories) {
					ids.add(category.getId());
				}
//				System.out.println("================ids : " + ids);
//				goods = gs.getGoodsByCategory_IdsOfParentid(ids);
//				System.out.println("==================goods : " + goods);
				// 分页查询
				goods = gs.getGoodsByCategory_IdsOfParentidByPage(ids, valsForLimit);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				//pm.setCount(BayernFengUtils.getBeanCountOfTableOfByParam(Good.class, "category_ids", ids));
				pm.setCount(gs.getGoodsByCategory_IdsOfParentid(ids).size());
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				
				
				//goods = gs.getGoodsByParentCategoryId(intId);
			} else {
//				goods = gs.getGoodsByCategory_Id(intId);
				// 分页查询
				goods = gs.getGoodsByCategory_IdByPage(intId, valsForLimit);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(BayernFengUtils.getBeanCountOfTableOfByParam(Good.class, "category_id", intId));
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
			}
		}
		
		if (goods.size() > 0) {
			BayernFengUtils.jsonPutCode(jobj, 1);
			BayernFengUtils.jsonPutMsg(jobj, goods);
			jobj.put("mapOfPageInfo", mapOfPageInfo);
		} else {
			BayernFengUtils.jsonPutCode(jobj, -1);
			BayernFengUtils.jsonPutMsg(jobj, "未找到信息");
		}
		return jobj.toString();
	}

	@RequestMapping("getGoodsByCategory_Id2.do/{category_id}/{pageNo}")
	@ResponseBody
	public String getGoodsByCategory_Id2(@PathVariable("category_id") String category_id,
			@PathVariable("pageNo") String pageNo,
			@RequestParam(value="pageSize", required=false) String pageSize,
			HttpServletRequest request) {
		
		pageSize = "5";
		
		JSONObject jobj = new JSONObject();
		
		List<Good> goods = new ArrayList<>();
		Map<String, Object> mapOfPageInfo = new HashMap<>();
		Integer showNums = 5;
		Integer[] valsForLimit = BayernFengUtils.twoValuesForMySQLLimit(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
		/*
		 * 点击产品分类的时候：
		 *  根据传来的category_id判断
		 *  1、获得所有
		 *  2、根据id获得
		 *  3、更具parentid获得
		 */
		if (category_id.equals("0")) {
//			goods = gs.getAllGoods();
			// 分页查询
			goods = gs.getAllGoodsByPage(valsForLimit);
			// 分页查询所需的前端表现
			PageModel pm = BayernFengUtils.getPageModelInstance();
			pm.setCount(BayernFengUtils.getBeanCountOfTableOf(Good.class));
			mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
		} else {
			Integer intId = Integer.parseInt(category_id);
			// 判断该category_id是否是父分类
			Category c = cs.getCategoryById(intId);
			System.out.println("========================Category : " + c);
			Integer parentid = c.getParentid();
			if (parentid == 0) {
				// 获得该category的所有子category
				List<Category> categories = cs.getCategoriesByParentid(intId);
				List<Integer> ids = new ArrayList<>();
				for (Category category : categories) {
					ids.add(category.getId());
				}
//				System.out.println("================ids : " + ids);
//				goods = gs.getGoodsByCategory_IdsOfParentid(ids);
//				System.out.println("==================goods : " + goods);
				// 分页查询
				goods = gs.getGoodsByCategory_IdsOfParentidByPage(ids, valsForLimit);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				//pm.setCount(BayernFengUtils.getBeanCountOfTableOfByParam(Good.class, "category_ids", ids));
				pm.setCount(gs.getGoodsByCategory_IdsOfParentid(ids).size());
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				
				
				//goods = gs.getGoodsByParentCategoryId(intId);
			} else {
//				goods = gs.getGoodsByCategory_Id(intId);
				// 分页查询
				goods = gs.getGoodsByCategory_IdByPage(intId, valsForLimit);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(BayernFengUtils.getBeanCountOfTableOfByParam(Good.class, "category_id", intId));
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
			}
		}
		
		if (goods.size() > 0) {
			
			// 给每一个good设置category
			for (Good good : goods) {
				good.setCategory(cs.getCategoryById(good.getCategory_id()));
			}
			
			request.getSession().setAttribute("goods", goods);
			request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
			request.getSession().setAttribute("category_id", category_id);
			request.getSession().setAttribute("keyWords", null);
			request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/getGoodsByCategory_Id3.do/"+category_id);
			BayernFengUtils.jsonPutCode(jobj, "1");
		} else {
			PageModel pm = BayernFengUtils.getPageModelInstance();
			pm.setCount(0);
			mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
			request.getSession().setAttribute("goods", null);
			request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
			request.getSession().setAttribute("category_id", null);
			request.getSession().setAttribute("keyWords", null);
			BayernFengUtils.jsonPutCode(jobj, "-1");
		}
		
		return jobj.toJSONString();
	}
	@RequestMapping("getGoodsByCategory_Id3.do/{category_id}/{pageNo}")
	public String getGoodsByCategory_Id3(@PathVariable("category_id") String category_id,
			@PathVariable("pageNo") String pageNo,
			@RequestParam(value="pageSize", required=false) String pageSize,
			HttpServletRequest request) {
		
		pageSize = "5";
		
		JSONObject jobj = new JSONObject();
		
		List<Good> goods = new ArrayList<>();
		Map<String, Object> mapOfPageInfo = new HashMap<>();
		Integer showNums = 5;
		Integer[] valsForLimit = BayernFengUtils.twoValuesForMySQLLimit(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
		/*
		 * 点击产品分类的时候：
		 *  根据传来的category_id判断
		 *  1、获得所有
		 *  2、根据id获得
		 *  3、更具parentid获得
		 */
		if (category_id.equals("0")) {
//			goods = gs.getAllGoods();
			// 分页查询
			goods = gs.getAllGoodsByPage(valsForLimit);
			// 分页查询所需的前端表现
			PageModel pm = BayernFengUtils.getPageModelInstance();
			pm.setCount(BayernFengUtils.getBeanCountOfTableOf(Good.class));
			mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
		} else {
			Integer intId = Integer.parseInt(category_id);
			// 判断该category_id是否是父分类
			Category c = cs.getCategoryById(intId);
			System.out.println("========================Category : " + c);
			Integer parentid = c.getParentid();
			if (parentid == 0) {
				// 获得该category的所有子category
				List<Category> categories = cs.getCategoriesByParentid(intId);
				List<Integer> ids = new ArrayList<>();
				for (Category category : categories) {
					ids.add(category.getId());
				}
//				System.out.println("================ids : " + ids);
//				goods = gs.getGoodsByCategory_IdsOfParentid(ids);
//				System.out.println("==================goods : " + goods);
				// 分页查询
				goods = gs.getGoodsByCategory_IdsOfParentidByPage(ids, valsForLimit);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				//pm.setCount(BayernFengUtils.getBeanCountOfTableOfByParam(Good.class, "category_ids", ids));
				pm.setCount(gs.getGoodsByCategory_IdsOfParentid(ids).size());
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				
				
				//goods = gs.getGoodsByParentCategoryId(intId);
			} else {
//				goods = gs.getGoodsByCategory_Id(intId);
				// 分页查询
				goods = gs.getGoodsByCategory_IdByPage(intId, valsForLimit);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(BayernFengUtils.getBeanCountOfTableOfByParam(Good.class, "category_id", intId));
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
			}
		}
		
		if (goods.size() > 0) {
			
			// 给每一个good设置category
			for (Good good : goods) {
				good.setCategory(cs.getCategoryById(good.getCategory_id()));
			}
			
			request.getSession().setAttribute("goods", goods);
			request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
			request.getSession().setAttribute("category_id", category_id);
			request.getSession().setAttribute("keyWords", null);
			request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/getGoodsByCategory_Id3.do/"+category_id);
			BayernFengUtils.jsonPutCode(jobj, "1");
		} else {
			PageModel pm = BayernFengUtils.getPageModelInstance();
			pm.setCount(0);
			mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
			request.getSession().setAttribute("goods", null);
			request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
			request.getSession().setAttribute("category_id", null);
			request.getSession().setAttribute("keyWords", null);
			BayernFengUtils.jsonPutCode(jobj, "-1");
		}
		
		return "redirect:/admin/productManage.html";
	}

	// 选择上架/下架，获取数据
	@RequestMapping("searchGoodsByStatAndPage.do/{stat}/{pageNo}")
	@ResponseBody
	public String searchGoodsByStatAndPage(@PathVariable("stat") String stat,
			@PathVariable("pageNo") String pageNo,
			@RequestParam(value="pageSize", required=false) String pageSize,
			HttpServletRequest request) {
		
		pageSize = "5";
		
		JSONObject jobj = new JSONObject();
		
		List<Good> goods = new ArrayList<>();
		Map<String, Object> mapOfPageInfo = new HashMap<>();
		Integer showNums = 5;
		Integer[] valsForLimit = BayernFengUtils.twoValuesForMySQLLimit(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
		
		goods = gs.getGoodsByStatAndPage(stat, valsForLimit);
		// 分页查询所需的前端表现
		PageModel pm = BayernFengUtils.getPageModelInstance();
		pm.setCount(gs.getGoodsByStat(stat).size());
		mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
		
		if (goods.size() > 0) {
			
			// 给每一个good设置category
			for (Good good : goods) {
				good.setCategory(cs.getCategoryById(good.getCategory_id()));
			}
			
			request.getSession().setAttribute("goods", goods);
			request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
			request.getSession().setAttribute("stat", stat);
			request.getSession().setAttribute("category_id", null);
			request.getSession().setAttribute("keyWords", null);
			request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/searchGoodsByStatAndPage2.do/"+stat);
			BayernFengUtils.jsonPutCode(jobj, "1");
		} else {
			request.getSession().setAttribute("goods", null);
			request.getSession().setAttribute("mapOfPageInfo", null);
			request.getSession().setAttribute("category_id", null);
			BayernFengUtils.jsonPutCode(jobj, "-1");
		}
		
		return jobj.toJSONString();
	}
	@RequestMapping("searchGoodsByStatAndPage2.do/{stat}/{pageNo}")
	public String searchGoodsByStatAndPage2(@PathVariable("stat") String stat,
			@PathVariable("pageNo") String pageNo,
			@RequestParam(value="pageSize", required=false) String pageSize,
			HttpServletRequest request) {
		
		pageSize = "5";
		
		List<Good> goods = new ArrayList<>();
		Map<String, Object> mapOfPageInfo = new HashMap<>();
		Integer showNums = 5;
		Integer[] valsForLimit = BayernFengUtils.twoValuesForMySQLLimit(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
		
		goods = gs.getGoodsByStatAndPage(stat, valsForLimit);
		// 分页查询所需的前端表现
		PageModel pm = BayernFengUtils.getPageModelInstance();
		pm.setCount(gs.getGoodsByStat(stat).size());
		mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
		
		if (goods.size() > 0) {
			
			// 给每一个good设置category
			for (Good good : goods) {
				good.setCategory(cs.getCategoryById(good.getCategory_id()));
			}
			
			request.getSession().setAttribute("goods", goods);
			request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
			request.getSession().setAttribute("stat", stat);
			request.getSession().setAttribute("category_id", null);
			request.getSession().setAttribute("keyWords", null);
			request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/searchGoodsByStatAndPage2.do/"+stat);
		} else {
			request.getSession().setAttribute("goods", null);
			request.getSession().setAttribute("mapOfPageInfo", null);
			request.getSession().setAttribute("category_id", null);
		}
		
		return "redirect:/admin/productManage.html";
	}
	
	
	@RequestMapping("getGoodsByCategory_Id2OnlyOffshelf.do/{category_id}/{pageNo}")
	@ResponseBody
	public String getGoodsByCategory_Id2OnlyOffshelf(@PathVariable("category_id") String category_id,
			@PathVariable("pageNo") String pageNo,
			@RequestParam(value="pageSize", required=false) String pageSize,
			HttpServletRequest request) {
		
		pageSize = "5";
		
		JSONObject jobj = new JSONObject();
		
		List<Good> goods = new ArrayList<>();
		Map<String, Object> mapOfPageInfo = new HashMap<>();
		Integer showNums = 5;
		Integer[] valsForLimit = BayernFengUtils.twoValuesForMySQLLimit(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
		/*
		 * 点击产品分类的时候：
		 *  根据传来的category_id判断
		 *  1、获得所有
		 *  2、根据id获得
		 *  3、更具parentid获得
		 */
		if (category_id.equals("0")) {
//			goods = gs.getAllGoods();
			// 分页查询
			goods = gs.getAllGoodsByPage(valsForLimit);
			// 分页查询所需的前端表现
			PageModel pm = BayernFengUtils.getPageModelInstance();
			pm.setCount(BayernFengUtils.getBeanCountOfTableOf(Good.class));
			mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
		} else {
			Integer intId = Integer.parseInt(category_id);
			// 判断该category_id是否是父分类
			Category c = cs.getCategoryById(intId);
			System.out.println("========================Category : " + c);
			Integer parentid = c.getParentid();
			if (parentid == 0) {
				// 获得该category的所有子category
				List<Category> categories = cs.getCategoriesByParentid(intId);
				List<Integer> ids = new ArrayList<>();
				for (Category category : categories) {
					ids.add(category.getId());
				}
//				System.out.println("================ids : " + ids);
//				goods = gs.getGoodsByCategory_IdsOfParentid(ids);
//				System.out.println("==================goods : " + goods);
				// 分页查询
				goods = gs.getGoodsByCategory_IdsOfParentidByPageOnlyOffshelf(ids, valsForLimit);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				//pm.setCount(BayernFengUtils.getBeanCountOfTableOfByParam(Good.class, "category_ids", ids));
				pm.setCount(gs.getGoodsByCategory_IdsOfParentidOnlyOffshelf(ids).size());
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				
				
				//goods = gs.getGoodsByParentCategoryId(intId);
			} else {
//				goods = gs.getGoodsByCategory_Id(intId);
				// 分页查询
				goods = gs.getGoodsByCategory_IdByPageOnlyOffshelf(intId, valsForLimit);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
//				pm.setCount(BayernFengUtils.getBeanCountOfTableOfByParam(Good.class, "category_id", intId));
				pm.setCount(gs.getGoodsByCategory_IdOnlyOffshelf(intId).size());
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
			}
		}
		
		if (goods.size() > 0) {
			
			// 给每一个good设置category
			for (Good good : goods) {
				good.setCategory(cs.getCategoryById(good.getCategory_id()));
			}
			
			request.getSession().setAttribute("goodsWhichOffshelf", goods);
			request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
			request.getSession().setAttribute("category_id", category_id);
			request.getSession().setAttribute("keyWords", null);
			request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/getGoodsByCategory_Id3OnlyOffshelf.do/"+category_id);
			BayernFengUtils.jsonPutCode(jobj, "1");
		} else {
			PageModel pm = BayernFengUtils.getPageModelInstance();
//			pm.setCount(BayernFengUtils.getBeanCountOfTableOfByParam(Good.class, "category_id", intId));
			pm.setCount(0);
			mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
			request.getSession().setAttribute("goodsWhichOffshelf", null);
			request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
			request.getSession().setAttribute("category_id", null);
			request.getSession().setAttribute("keyWords", null);
			BayernFengUtils.jsonPutCode(jobj, "-1");
		}
		
		return jobj.toJSONString();
	}
	
	
	@RequestMapping("showGoodsByFuzzySearch.do/{keyWords}/{pageNo}")
	@ResponseBody
	public String showGoodsByFuzzySearch(@PathVariable("keyWords") String keyWords,
			@PathVariable("pageNo") String pageNo,
			@RequestParam(value="pageSize", required=true) String pageSize) {
		JSONObject jobj = new JSONObject();
		
		List<Good> goods = new ArrayList<>();
		Map<String, Object> mapOfPageInfo = new HashMap<>();
		Integer showNums = 5;
		Integer[] valsForLimit = BayernFengUtils.twoValuesForMySQLLimit(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
		if (!keyWords.equals("-1")) {
			QueryGood qg = new QueryGood();
			qg.setKeyWords(keyWords);
			qg.setFirstValueOfLimit(valsForLimit[0]);
			qg.setSecondValueOfLimit(valsForLimit[1]);
//			goods = gs.getGoodsByFuzzySearch(qg);
			goods = gs.getGoodsByFuzzySearchAndPage(qg);
			// 分页查询所需的前端表现
			PageModel pm = BayernFengUtils.getPageModelInstance();
			pm.setCount(gs.getGoodsByFuzzySearch(qg).size());
//			pm.setCount(BayernFengUtils.getBeanCountOfTableOfByFuzzySearch(Good.class, keyWords));
			mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
		} else {
			//goods = gs.getAllGoods();
			goods = gs.getAllGoodsByPage(valsForLimit);
			// 分页查询所需的前端表现
			PageModel pm = BayernFengUtils.getPageModelInstance();
			pm.setCount(BayernFengUtils.getBeanCountOfTableOf(Good.class));
			mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
		}
		
		if (goods.size() > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, goods);
			jobj.put("keyWords", keyWords);
			jobj.put("mapOfPageInfo", mapOfPageInfo);
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "获取数据失败");
		}
		
		return jobj.toJSONString();
	}

	@RequestMapping("showGoodsByFuzzySearchAndPage2.do/{keyWords}/{pageNo}")
	public String showGoodsByFuzzySearch2(@PathVariable("keyWords") String keyWords,
			@PathVariable("pageNo") String pageNo,
			@RequestParam(value="pageSize", required=false) String pageSize,
			HttpServletRequest request) {
		
		pageSize = "5";
		
		// 清楚上一次session中的查找结果
		request.getSession().setAttribute("goods", null);
		
		List<Good> goods = new ArrayList<>();
		Map<String, Object> mapOfPageInfo = new HashMap<>();
		Integer showNums = 5;
		Integer[] valsForLimit = BayernFengUtils.twoValuesForMySQLLimit(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
		
		
		// 判断传过来的keyWords是否是数字，是，则通过id查找
		// 通过id
		if (BayernFengUtils.isPositiveInteger(keyWords)) {
			Good g = gs.getGoodById(Integer.parseInt(keyWords));
			goods.add(g);
			if (g != null) {
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(1);
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				request.getSession().setAttribute("goods", goods);
				request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
				request.getSession().setAttribute("keyWords", keyWords);
				request.getSession().setAttribute("category_id", null);
				request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/showGoodsByFuzzySearchAndPage2.do/"+keyWords);
			} else {
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(0);
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				request.getSession().setAttribute("goods", null);
				request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
				request.getSession().setAttribute("keyWords", keyWords);
				request.getSession().setAttribute("category_id", null);
				request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/showGoodsByFuzzySearchAndPage2.do/"+keyWords);
				
			}
			
			
		// 模糊查询
		} else {
			if (!keyWords.equals("-1")) {
				QueryGood qg = new QueryGood();
				qg.setKeyWords(keyWords);
				qg.setFirstValueOfLimit(valsForLimit[0]);
				qg.setSecondValueOfLimit(valsForLimit[1]);
//				goods = gs.getGoodsByFuzzySearch(qg);
				goods = gs.getGoodsByFuzzySearchAndPage(qg);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(gs.getGoodsByFuzzySearch(qg).size());
//				pm.setCount(BayernFengUtils.getBeanCountOfTableOfByFuzzySearch(Good.class, keyWords));
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
			
				if (goods.size() > 0) {
					// 给每一个good设置category
					for (Good good : goods) {
						good.setCategory(cs.getCategoryById(good.getCategory_id()));
					}
					request.getSession().setAttribute("goods", goods);
					request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
					request.getSession().setAttribute("keyWords", keyWords);
					request.getSession().setAttribute("category_id", null);
					request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/showGoodsByFuzzySearchAndPage2.do/"+keyWords);
				} else {
					// 分页查询所需的前端表现
					pm.setCount(0);
					mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
					request.getSession().setAttribute("goods", null);
					request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
					request.getSession().setAttribute("keyWords", keyWords);
					request.getSession().setAttribute("category_id", null);
					request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/showGoodsByFuzzySearchAndPage2.do/"+keyWords);
					
				}
			
			} else {
				//goods = gs.getAllGoods();
				goods = gs.getAllGoodsByPage(valsForLimit);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(BayernFengUtils.getBeanCountOfTableOf(Good.class));
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				
				
				
				request.getSession().setAttribute("goods", null);
				request.getSession().setAttribute("mapOfPageInfo", null);
				request.getSession().setAttribute("keyWords", null);
			}
		}
		
		
		
		
		System.out.println("mapOfPageInfo ================ " + mapOfPageInfo);
		
		return "redirect:/admin/productManage.html";
		
	}

	@RequestMapping("showGoodsByFuzzySearchAndPageOnlyOffshelf.do/{keyWords}/{pageNo}")
	public String showGoodsByFuzzySearchOnlyOffshelf(@PathVariable("keyWords") String keyWords,
			@PathVariable("pageNo") String pageNo,
			@RequestParam(value="pageSize", required=false) String pageSize,
			HttpServletRequest request) {
		
		pageSize = "5";
		
		// 清楚上一次session中的查找结果
		request.getSession().setAttribute("goodsWhichOffshelf", null);
		
		List<Good> goods = new ArrayList<>();
		Map<String, Object> mapOfPageInfo = new HashMap<>();
		Integer showNums = 5;
		Integer[] valsForLimit = BayernFengUtils.twoValuesForMySQLLimit(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
		
		
		// 判断传过来的keyWords是否是数字，是，则通过id查找
		// 通过id
		if (BayernFengUtils.isPositiveInteger(keyWords)) {
			Good g = gs.getGoodByIdOnlyOffshelf(Integer.parseInt(keyWords));
			goods.add(g);
			if (g != null) {
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(1);
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				request.getSession().setAttribute("goodsWhichOffshelf", goods);
				request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
				request.getSession().setAttribute("keyWords", keyWords);
				request.getSession().setAttribute("category_id", null);
				request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/showGoodsByFuzzySearchAndPageOnlyOffshelf.do/"+keyWords);
			} else {
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(0);
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				request.getSession().setAttribute("goodsWhichOffshelf", null);
				request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
				request.getSession().setAttribute("keyWords", keyWords);
				request.getSession().setAttribute("category_id", null);
				request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/showGoodsByFuzzySearchAndPageOnlyOffshelf.do/"+keyWords);
			}
			
			
		// 模糊查询
		} else {
			if (!keyWords.equals("-1")) {
				QueryGood qg = new QueryGood();
				qg.setKeyWords(keyWords);
				qg.setFirstValueOfLimit(valsForLimit[0]);
				qg.setSecondValueOfLimit(valsForLimit[1]);
//				goods = gs.getGoodsByFuzzySearch(qg);
				goods = gs.getGoodsByFuzzySearchAndPageOnlyOffshelf(qg);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(gs.getGoodsByFuzzySearchOnlyOffshelf(qg).size());
//				pm.setCount(BayernFengUtils.getBeanCountOfTableOfByFuzzySearch(Good.class, keyWords));
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				
				if (goods.size() > 0) {
					// 给每一个good设置category
					for (Good good : goods) {
						good.setCategory(cs.getCategoryById(good.getCategory_id()));
					}
					request.getSession().setAttribute("goodsWhichOffshelf", goods);
					request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
					request.getSession().setAttribute("keyWords", keyWords);
					request.getSession().setAttribute("category_id", null);
					request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/showGoodsByFuzzySearchAndPageOnlyOffshelf.do/"+keyWords);
				} else {
					// 分页查询所需的前端表现
					pm.setCount(0);
					mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
					request.getSession().setAttribute("goodsWhichOffshelf", null);
					request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
					request.getSession().setAttribute("keyWords", keyWords);
					request.getSession().setAttribute("category_id", null);
					request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/good/data/showGoodsByFuzzySearchAndPageOnlyOffshelf.do/"+keyWords);
				}
				
			} else {
				//goods = gs.getAllGoods();
				goods = gs.getAllGoodsByPage(valsForLimit);
				// 分页查询所需的前端表现
				PageModel pm = BayernFengUtils.getPageModelInstance();
				pm.setCount(BayernFengUtils.getBeanCountOfTableOf(Good.class));
				mapOfPageInfo = BayernFengUtils.setPageModel(pm, Good.class, Integer.parseInt(pageNo), Integer.parseInt(pageSize), showNums);
				
				
				
				request.getSession().setAttribute("goodsWhichOffshelf", null);
				request.getSession().setAttribute("mapOfPageInfo", null);
				request.getSession().setAttribute("keyWords", null);
			}
			
		}
		
		
		
		
		System.out.println("mapOfPageInfo ================ " + mapOfPageInfo);
		
		return "redirect:/admin/productOffshelf.html";
		
	}
	
	
	@RequestMapping("deleteGoodById.do")
	@ResponseBody
	public String deleteGoodById(@RequestParam(value="id", required=true) String id) {
		JSONObject jobj = new JSONObject();
		
		Integer result = null;
		
		result = gs.deleteGoodById(id);
		
		if (result != null && result > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "删除成功");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "删除失败");
		}
		
		return jobj.toJSONString();
	}
	
	@RequestMapping("deleteGoodByIdS.do")
	@ResponseBody
	public String deleteGoodByIdS(@RequestParam(value="ids", required=true) String ids) {
		
		JSONObject jobj = new JSONObject();
		
		String[] idsArr = BayernFengUtils.makeArrayWithGivenJSONStringForIds(ids);
		List<Integer> listOfId = new ArrayList<>();
		for (String id : idsArr) {
			listOfId.add(Integer.parseInt(id));
		}
		
		Integer result = null;
		
		try {
			result = gs.deleteGoodByIdS(listOfId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result != null && result > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "删除成功");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "删除失败");
		}
		
		return jobj.toJSONString();
	}
	
	@RequestMapping("turnONStatOfGoodsByIdS.do")
	@ResponseBody
	public String turnONStatOfGoodsByIdS(@RequestParam(value="ids", required=true) String ids) {
		
		JSONObject jobj = new JSONObject();
		
		String[] idsArr = BayernFengUtils.makeArrayWithGivenJSONStringForIds(ids);
		List<Integer> listOfId = new ArrayList<>();
		for (String id : idsArr) {
			listOfId.add(Integer.parseInt(id));
		}
		
		Integer result = null;
		
		try {
			result = gs.turnONStatOfGoodsByIdS(listOfId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result != null && result > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "修改成功");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "修改失败");
		}
		
		return jobj.toJSONString();
	}

	@RequestMapping("turnOFFStatOfGoodsByIdS.do")
	@ResponseBody
	public String turnOFFStatOfGoodsByIdS(@RequestParam(value="ids", required=true) String ids) {
		
		JSONObject jobj = new JSONObject();
		
		String[] idsArr = BayernFengUtils.makeArrayWithGivenJSONStringForIds(ids);
		List<Integer> listOfId = new ArrayList<>();
		for (String id : idsArr) {
			listOfId.add(Integer.parseInt(id));
		}
		
		Integer result = null;
		
		try {
			result = gs.turnOFFStatOfGoodsByIdS(listOfId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result != null && result > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "修改成功");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "修改失败");
		}
		
		return jobj.toJSONString();
	}
	
	@RequestMapping("modifyStatOfGood.do")
	@ResponseBody
	public String modifyStatOfGood(@RequestParam(value="id", required=true) Integer id,
			@RequestParam(value="stat", required=true) Integer stat) {
		JSONObject jobj = new JSONObject();
		
		Good good = new Good();
		good.setId(id);
		good.setStat(stat);
		Integer result = null;
		result = gs.modiyfyStatOfGood(good);
		if (result != null && result > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "修改成功");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "修改失败");
		}
		
		return jobj.toJSONString();
	}
	
}

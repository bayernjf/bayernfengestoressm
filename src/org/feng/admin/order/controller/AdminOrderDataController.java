/**
 * 
 */
package org.feng.admin.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.feng.bean.Good;
import org.feng.bean.Order;
import org.feng.bean.OrderItem;
import org.feng.order.service.OrderItemService;
import org.feng.order.service.OrderService;
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

import com.alibaba.fastjson.JSONObject;

/**
 * @author 姜峰
 *
 */
@Controller
@RequestMapping(value="admin/data", produces="text/html;charset=utf-8")
public class AdminOrderDataController {
	
	@Autowired
	@Qualifier("orderService")
	private OrderService os;

	@Autowired
	@Qualifier("orderItemService")
	private OrderItemService ois;

	@Autowired
	@Qualifier("goodService")
	private GoodService gs;
	
	@RequestMapping("getOrdersByStat.do")
	//@ResponseBody
	public String getOrdersByStat(@RequestParam(value="stat") Integer stat,
			HttpServletRequest request) {
		
		//JSONObject jobj = new JSONObject();
		
		System.out.println("===================stat : " + stat);
		
		//BayernFengUtils.jsonPutCode(jobj, "1");
		
		//return jobj.toJSONString();
		
		
		
		List<Order> orders = new ArrayList<>();
		
		orders = os.getOrdersByStat(stat);
		
		if (orders.size() > 0) {
			
			// 每一个订单中，还有商品的信息
			for (Order order : orders) {
				List<OrderItem> orderItems = ois.getOrderItemsByOrder_Id(order.getId());
				//order.setOrderItems(orderItems);
				// 遍历orderItems，根据其good_id拿到相应的商品，并设置buynum和priceWithBuynum
				List<Good> listOfGood = new ArrayList<>();
				for (OrderItem orderItem : orderItems) {
					Good good = gs.getGoodById(orderItem.getGood_id());
					Integer buynum =  orderItem.getBuynum();
					Double estoreprice = good.getEstoreprice();
					Double priceWithBuynum = buynum * estoreprice;
					good.setBuynum(buynum);
					good.setPriceWithBuynum(priceWithBuynum);
					listOfGood.add(good);
				}
				order.setListOfGood(listOfGood);
			}
			
			request.getSession().setAttribute("orders", orders);
		} else {
			request.getSession().setAttribute("orders", null);
		}
		
		
		String page = "";
		switch (stat) {
		case 1:
			page = "orderToBePaid";
			break;
		case 2:
			page = "orderBeenPaid";
			break;
		case 3:
			page = "orderShipped";
			break;
		case 4:
			page = "orderAccomplished";
			break;
		case 5:
			page = "orderCancelled";
			break;

		default:
			break;
		}
		
		return page;
	}

	// 按状态的分页查询
	@RequestMapping("getOrdersByStatAndPage.do/{stat}/{pageNo}")
	//@ResponseBody
	public String getOrdersByStatAndPage(@PathVariable("stat") Integer stat,
			@PathVariable("pageNo") Integer pageNo,
			@RequestParam(value="pageSize", required=false) Integer pageSize,
			HttpServletRequest request) {
		
		pageSize = 2;
		
		//JSONObject jobj = new JSONObject();
		
		System.out.println("===================stat : " + stat);
		
		//BayernFengUtils.jsonPutCode(jobj, "1");
		
		//return jobj.toJSONString();
		
		
		
		List<Order> orders = new ArrayList<>();
		Map<String, Object> mapOfPageInfo = new HashMap<>();
		Integer showNums = 5;
		Integer[] valsForLimit = BayernFengUtils.twoValuesForMySQLLimit(pageNo, pageSize);
		
		//orders = os.getOrdersByStat(stat);
		// 分页查询所需的前端表现
		PageModel pm = BayernFengUtils.getPageModelInstance();
		pm.setCount(os.getOrdersByStat(stat).size());
		mapOfPageInfo = BayernFengUtils.setPageModel(pm, Order.class, pageNo, pageSize, showNums);
		orders = os.getOrdersByStatAndPage(stat, valsForLimit);
		
		if (orders.size() > 0) {
			
			// 每一个订单中，还有商品的信息
			for (Order order : orders) {
				List<OrderItem> orderItems = ois.getOrderItemsByOrder_Id(order.getId());
				//order.setOrderItems(orderItems);
				// 遍历orderItems，根据其good_id拿到相应的商品，并设置buynum和priceWithBuynum
				List<Good> listOfGood = new ArrayList<>();
				for (OrderItem orderItem : orderItems) {
					Good good = gs.getGoodById(orderItem.getGood_id());
					Integer buynum =  orderItem.getBuynum();
					Double estoreprice = good.getEstoreprice();
					Double priceWithBuynum = buynum * estoreprice;
					good.setBuynum(buynum);
					good.setPriceWithBuynum(priceWithBuynum);
					listOfGood.add(good);
				}
				order.setListOfGood(listOfGood);
			}
			
			request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/admin/data/getOrdersByStatAndPage.do/"+stat);
			request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
			request.getSession().setAttribute("stat", stat);
			request.getSession().setAttribute("orders", orders);
		} else {
			pm.setCount(0);
			mapOfPageInfo = BayernFengUtils.setPageModel(pm, Order.class, pageNo, pageSize, showNums);
			request.getSession().setAttribute("urlForPaginationWithoutPageNo", request.getContextPath()+"/admin/data/getOrdersByStatAndPage.do/"+stat);
			request.getSession().setAttribute("mapOfPageInfo", mapOfPageInfo);
			request.getSession().setAttribute("stat", stat);
			request.getSession().setAttribute("orders", null);
		}
		
		
		String page = "";
		switch (stat) {
		case 1:
			page = "redirect:/admin/orderToBePaid.html";
			break;
		case 2:
			page = "redirect:/admin/orderBeenPaid.html";
			break;
		case 3:
			page = "redirect:/admin/orderShipped.html";
			break;
		case 4:
			page = "redirect:/admin/orderAccomplished.html";
			break;
		case 5:
			page = "redirect:/admin/orderCancelled.html";
			break;
			
		default:
			break;
		}
/*		switch (stat) {
		case 1:
			page = "redirect:/admin/orderToBePaid.html";
			break;
		case 2:
			page = "orderBeenPaid";
			break;
		case 3:
			page = "orderShipped";
			break;
		case 4:
			page = "orderAccomplished";
			break;
		case 5:
			page = "orderCancelled";
			break;
			
		default:
			break;
		}
*/		
		return page;
	}
	
	@RequestMapping("modifyStatOfOrder.do")
	@ResponseBody
	public String modifyStatOfOrder(@RequestParam(value="orderId", required=true) String orderId,
			@RequestParam(value="stat", required=true) Integer stat) {
		
		JSONObject jobj = new JSONObject();
		
		Order order = new Order();
		order.setId(orderId);
		order.setStat(stat);
		order.setStatName(BayernFengUtils.getStatNameByStat(stat));
		
		Integer result = os.updateStat(order);
		
		if (result > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
			BayernFengUtils.jsonPutMsg(jobj, "状态修改成功");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
			BayernFengUtils.jsonPutMsg(jobj, "状态修改失败");
		}
		
		return jobj.toJSONString();
		
	}
	
}

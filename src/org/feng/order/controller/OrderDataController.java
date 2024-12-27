/**
 * 
 */
package org.feng.order.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.feng.bean.Good;
import org.feng.bean.Order;
import org.feng.bean.OrderItem;
import org.feng.bean.User;
import org.feng.order.service.OrderItemService;
import org.feng.order.service.OrderService;
import org.feng.product.service.GoodService;
import org.feng.util.AlipayUtil;
import org.feng.util.BayernFengUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.internal.util.StringUtils;

/**
 * @author 姜峰
 *
 */
@Controller
@RequestMapping(value="order/data", produces="text/html;charset=utf-8")
public class OrderDataController {

	private String orderId;
	private String money;
	private String name;
	private String goods;
	
	@Autowired
	@Qualifier("orderService")
	private OrderService os;

	@Autowired
	@Qualifier("orderItemService")
	private OrderItemService ois;

	@Autowired
	@Qualifier("goodService")
	private GoodService gs;
	
	@RequestMapping("order.html")
	public String showOrderPage() {
		return "order";
	}
	
	@RequestMapping("orderWillBePaid.do")
	@ResponseBody
	public String orderWillBePaid(@RequestParam(value="orderId", required=true) String orderId,
			@RequestParam(value="money", required=true) String money,
			@RequestParam(value="name", required=true) String name,
			@RequestParam(value="userId", required=true) String userId,
			@RequestParam(value="goods", required=true) String goods,
			@RequestParam(value="address", required=true) String address) {
		JSONObject jobj = new JSONObject();
		
		this.money = money;
		this.name = name;
		this.orderId = orderId;
		
		/*
		 * 
orderId  1606310182059
money 10.00
name 德国拜仁战车
userId 2
goods {"1":{"category_id":2,"description":"红萝卜","estoreprice":10,"expiry_date":1562769653000,"id":1,"marketprice":108,"name":"红萝卜","num":99,"production_date":1605451237000,"titleimage":"9.jpg","buyNum":"1"}}
address 安徽 蚌埠 龙子湖区 治淮路怀伟东大院三单元 姜峰 18297318405
		 */
		System.out.println("orderId =================> " + orderId);
		System.out.println("money =================> " + money);
		System.out.println("name =================> " + name);
		System.out.println("userId =================> " + userId);
		System.out.println("goods =================> " + goods);
		System.out.println("address =================> " + address);
		
		this.goods = goods;
		
		// 把订单保存到数据库
		Integer result = null;
		Order order = new Order();
		
		String[] fengadds = address.split(" ");
		String receivename = fengadds[fengadds.length - 2];
		String phone = fengadds[fengadds.length - 1];
		
		order.setId(orderId);
		order.setPhone(phone);
		order.setReceivename(receivename);
		order.setUser_id(Integer.parseInt(userId));
		order.setTotalprice(Double.parseDouble(money));
		// 待支付，已支付，已发货，已完成，已取消
		//   1      2     3     4     5
		order.setStat(1);
		order.setStatName(BayernFengUtils.getStatNameByStat(1));
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		order.setCreatetime(new Date());
		order.setAddress(address);
		System.out.println("order : " + order);
		result = os.addOrder(order);
		
		// 订单里的物品和订单的对应，存在数据库
		List<Object> goodIds = BayernFengUtils.getValuesOfJSONObjectByKey(goods, "id");
		List<Object> goodBuyNums = BayernFengUtils.getValuesOfJSONObjectByKey(goods, "buyNum");
		// 包装OrderItem对象
		List<OrderItem> orderItems = new ArrayList<>();
		for (int i = 0; i < goodIds.size(); i++) {
			OrderItem oi = new OrderItem();
			oi.setOrder_id(orderId);
			oi.setGood_id(Integer.parseInt(goodIds.get(i).toString()));
			oi.setBuynum(Integer.parseInt(goodBuyNums.get(i).toString()));
			orderItems.add(oi);
		}
		// 存入数据库
		Integer r = ois.addListOfOrderItem(orderItems);
		
		if (result != null && result > 0) {
			
		}
		
		BayernFengUtils.jsonPutCode(jobj, "1");
		BayernFengUtils.jsonPutMsg(jobj, "订单已保存，请付款");
		
		return jobj.toJSONString();
	}
	
	@RequestMapping("orderToBePaid.do")
	public String alipay(String orderId, String money, String name,
			HttpSession session, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		
		money = this.money;
		name = this.name;
		orderId = this.orderId;
		
		// 支付宝操作的时候 当面付 必须要订单的编号，订单多少钱，商品名称
		String info = "德国拜仁战车"; // 可有可无	
		String result = null;
		try {//money = "123"; name = "feng"; orderId = "125";
			result = AlipayUtil.pay(response, money, info, name, orderId);			
			request.setAttribute("result", result);
			request.getSession().setAttribute("orderId", orderId);
			//System.out.println("===================result ： " + result);		
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return "orderToBePaid";
		/*ModelAndView mv = new ModelAndView();
		mv.setViewName("orderToBePaid");
		return mv;*/
	}
	
	
	@RequestMapping("/ordertail")
	public String ordertail(String orderId,HttpSession session,Model model
			,HttpServletRequest request) throws UnsupportedEncodingException {
		
		orderId = this.orderId;
		
		//判断用户是否登录
		User user = (User) session.getAttribute("user");
		user = new User();
		user.setId(2);
		
		//如果得到支付宝编号不为空的话，就更新数据，进入if更新当前订单状态为2即支付状态
		
		String trade_no=request.getParameter("trade_no");
		if(StringUtils.isEmpty(trade_no)) {
			//获取支付宝交易号
			trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//获取订单编号
			String  out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//封装订单对象
			Order ordersx=new Order();
			ordersx.setStat(2);
			ordersx.setStatName(BayernFengUtils.getStatNameByStat(2));
			ordersx.setId(out_trade_no);
			
			/*ordersx.setTradeNo(trade_no);
			ordersx.setUser_id(user.getId());
			//更新订单状态和支付宝交易号
			os.commitOrder(ordersx);
			//同时把获取到的订单的id传给当前参数中接收的oid，因为支付提交过来的不叫oid
			//如果不设置，这个oid就为null了
			oid=out_trade_no;*/
		}
		
		//封装订单对象
		Order order=new Order();
		order.setId(orderId);
		order.setUser_id(user.getId());
		
		
		/*//根据订单的id和用户的id查询订单明细
		List<OrderItem> orderItemsList=os.findOrderItemList(order);
		Order order2=os.findOrdersByOidAndUid(order);
		model.addAttribute("orderItemsList", orderItemsList);
		model.addAttribute("orders", order2);*/
		
		return "orderdetail";
	}

	
	@RequestMapping("updateStatOfOrder.do")
	@ResponseBody
	public String updateStatOfOrder(@RequestParam(value="orderId", required=true) String orderId,
			@RequestParam(value="stat", required=true) String stat) {
		JSONObject jobj = new JSONObject();
		
		Order order = new Order();
		order.setId(orderId);
		order.setStat(Integer.parseInt(stat));
		order.setStatName(BayernFengUtils.getStatNameByStat(Integer.parseInt(stat)));
		Integer result = os.updateStat(order);
		
		// 更新物品的库存
		// 订单里的物品和订单的对应，存在数据库
		List<Object> goodIds = BayernFengUtils.getValuesOfJSONObjectByKey(goods, "id");
		List<Object> goodBuyNums = BayernFengUtils.getValuesOfJSONObjectByKey(goods, "buyNum");
		// 使用mybatis批量更新
		// 
		for (int i = 0; i < goodIds.size(); i++) {
			Good g = new Good();
			g.setId(Integer.parseInt(goodIds.get(i).toString()));
			//g.setBuynum(Integer.parseInt(goodBuyNums.get(i).toString()));
			Good old = gs.getGoodById(Integer.parseInt(goodIds.get(i).toString()));
			g.setNum(old.getNum() - Integer.parseInt(goodBuyNums.get(i).toString()));
			//gs.updateGood(g);
			old.setNum(old.getNum() - Integer.parseInt(goodBuyNums.get(i).toString()));
			gs.updateGood(old);
			
		}
		
		if (result > 0) {
			BayernFengUtils.jsonPutCode(jobj, "1");
		} else {
			BayernFengUtils.jsonPutCode(jobj, "-1");
		}
		
		return jobj.toJSONString();
	}
	
	
	@RequestMapping("getOrdersOfUserByStat.do")
	//@ResponseBody
	public String getOrdersOfUserByStat(@RequestParam(value="user_id") Integer user_id,
			@RequestParam(value="stat") Integer stat,
			HttpServletRequest request) {
		
		//JSONObject jobj = new JSONObject();
		
		System.out.println("===================user_id : " + user_id + " stat : " + stat);
		
		//BayernFengUtils.jsonPutCode(jobj, "1");
		
		//return jobj.toJSONString();
		
		
		
		List<Order> orders = new ArrayList<>();
		
		orders = os.getOrdersByUser_IdAndStat(user_id, stat);
		
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
		
		
		
		
		return "userOrders";
	}
	
}

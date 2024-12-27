/**
 * 
 */
package org.feng.admin.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ½ª·å
 *
 */
@Controller
@RequestMapping(value="admin", produces="text/html;charset=utf-8")
public class AdminOrderController {
	
	@RequestMapping("orderToBePaid.html")
	public String orderToBePaid() {
		return "admin/orderToBePaid";
	}

	@RequestMapping("orderBeenPaid.html")
	public String orderBeenPaid() {
		return "admin/orderBeenPaid";
	}
	
	@RequestMapping("orderShipped.html")
	public String orderShipped() {
		return "admin/orderShipped";
	}

	@RequestMapping("orderAccomplished.html")
	public String orderAccomplished() {
		return "admin/orderAccomplished";
	}

	@RequestMapping("orderCancelled.html")
	public String orderCancelled() {
		return "admin/orderCancelled";
	}

}

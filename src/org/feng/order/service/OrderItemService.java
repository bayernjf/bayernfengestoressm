/**
 * 
 */
package org.feng.order.service;

import java.util.List;

import org.feng.bean.OrderItem;

/**
 * @author ½ª·å
 *
 */
public interface OrderItemService {

	/**
	 * @param orderItems
	 * @return
	 */
	Integer addListOfOrderItem(List<OrderItem> orderItems);

	/**
	 * @param id
	 * @return
	 */
	List<OrderItem> getOrderItemsByOrder_Id(String order_id);

}

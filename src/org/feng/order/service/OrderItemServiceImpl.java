/**
 * 
 */
package org.feng.order.service;

import java.util.List;

import org.feng.bean.OrderItem;
import org.feng.mapper.OrderItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ½ª·å
 *
 */
@Service("orderItemService")
public class OrderItemServiceImpl implements OrderItemService {
	
	@Autowired
	private OrderItemMapper mapper;

	/* (non-Javadoc)
	 * @see org.feng.order.service.OrderItemService#addListOfOrderItem(java.util.List)
	 */
	@Override
	public Integer addListOfOrderItem(List<OrderItem> orderItems) {
		return this.mapper.addListOfOrderItem(orderItems);
	}

	/* (non-Javadoc)
	 * @see org.feng.order.service.OrderItemService#getOrderItemsByOrder_Id(java.lang.String)
	 */
	@Override
	public List<OrderItem> getOrderItemsByOrder_Id(String order_id) {
		return this.mapper.getOrderItemsByOrder_Id(order_id);
	}

}

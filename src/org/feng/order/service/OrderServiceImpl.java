/**
 * 
 */
package org.feng.order.service;

import java.util.List;

import org.feng.bean.Order;
import org.feng.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ½ª·å
 *
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;

	/* (non-Javadoc)
	 * @see org.feng.order.service.OrderService#addOrder(org.feng.bean.Order)
	 */
	@Override
	public Integer addOrder(Order order) {
		return this.mapper.add(order);
	}

	/* (non-Javadoc)
	 * @see org.feng.order.service.OrderService#updateStat(org.feng.bean.Order)
	 */
	@Override
	public Integer updateStat(Order order) {
		return this.mapper.updateStat(order);
	}

	/* (non-Javadoc)
	 * @see org.feng.order.service.OrderService#getOrdersByUser_IdAndStat(java.lang.Integer, java.lang.Integer)
	 */
	@Override
	public List<Order> getOrdersByUser_IdAndStat(Integer user_id, Integer stat) {
		return this.mapper.getOrdersByUser_IdAndStat(user_id, stat);
	}

	/* (non-Javadoc)
	 * @see org.feng.order.service.OrderService#getOrdersByStat(java.lang.Integer)
	 */
	@Override
	public List<Order> getOrdersByStat(Integer stat) {
		return this.mapper.getOrdersByStat(stat);
	}

	/* (non-Javadoc)
	 * @see org.feng.order.service.OrderService#getOrdersByStatAndPage(java.lang.Integer, java.lang.Integer[])
	 */
	@Override
	public List<Order> getOrdersByStatAndPage(Integer stat, Integer[] valsForLimit) {
		return this.mapper.getOrdersByStatAndPage(stat, valsForLimit[0], valsForLimit[1]);
	}
	
}

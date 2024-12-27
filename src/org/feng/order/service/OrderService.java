/**
 * 
 */
package org.feng.order.service;

import java.util.List;

import org.feng.bean.Order;

/**
 * @author ½ª·å
 *
 */
public interface OrderService {

	/**
	 * @param order
	 * @return
	 */
	Integer addOrder(Order order);

	/**
	 * @param order
	 * @return
	 */
	Integer updateStat(Order order);

	/**
	 * @param user_id
	 * @param stat
	 * @return
	 */
	List<Order> getOrdersByUser_IdAndStat(Integer user_id, Integer stat);

	/**
	 * @param stat
	 * @return
	 */
	List<Order> getOrdersByStat(Integer stat);

	/**
	 * @param stat
	 * @param valsForLimit
	 * @return
	 */
	List<Order> getOrdersByStatAndPage(Integer stat, Integer[] valsForLimit);

}

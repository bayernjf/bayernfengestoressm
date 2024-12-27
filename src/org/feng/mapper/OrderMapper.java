/**
 * 
 */
package org.feng.mapper;

import java.util.List;

import org.feng.bean.Order;

/**
 * @author ½ª·å
 *
 */
public interface OrderMapper {

	/**
	 * @param order
	 * @return
	 */
	Integer add(Order order);

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
	 * @param integer
	 * @param integer2
	 * @return
	 */
	List<Order> getOrdersByStatAndPage(Integer stat, Integer firstValueOfLimit, Integer secondValueOfLimit);

}

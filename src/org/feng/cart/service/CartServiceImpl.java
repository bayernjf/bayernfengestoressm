/**
 * 
 */
package org.feng.cart.service;

import org.feng.mapper.OrderItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ½ª·å
 *
 */
@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private OrderItemMapper mapper;
	
}

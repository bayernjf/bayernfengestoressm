/**
 * 
 */
package org.feng.address.service;

import java.util.List;

import org.feng.bean.Province;
import org.feng.mapper.AddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ½ª·å
 *
 */
@Service("addressService")
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressMapper mapper;

	/* (non-Javadoc)
	 * @see org.feng.address.service.AddressService#getAllAddresses()
	 */
	@Override
	public List<Province> getAllAddresses() {
		return this.mapper.getAll();
	}
	
}

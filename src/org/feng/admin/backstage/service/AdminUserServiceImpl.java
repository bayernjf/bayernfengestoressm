/**
 * 
 */
package org.feng.admin.backstage.service;

import org.feng.admin.bean.AdminUser;
import org.feng.mapper.AdminUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ½ª·å
 *
 */
@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired
	private AdminUserMapper mapper;

	/* (non-Javadoc)
	 * @see org.feng.admin.backstage.service.AdminUserService#getByNameAndPass(org.feng.admin.bean.AdminUser)
	 */
	@Override
	public AdminUser login(AdminUser user) {
		return this.mapper.getByNameAndPass(user);
	}

	/* (non-Javadoc)
	 * @see org.feng.admin.backstage.service.AdminUserService#addUser(org.feng.admin.bean.AdminUser)
	 */
	@Override
	public Integer addUser(AdminUser user) {
		return this.mapper.add(user);
	}

	/* (non-Javadoc)
	 * @see org.feng.admin.backstage.service.AdminUserService#findUserByUsername(java.lang.String)
	 */
	@Override
	public AdminUser findUserByUsername(String username) {
		return this.mapper.getByUsername(username);
	}

	/* (non-Javadoc)
	 * @see org.feng.admin.backstage.service.AdminUserService#updateUser(org.feng.admin.bean.AdminUser)
	 */
	@Override
	public Integer updateUser(AdminUser user) {
		return this.mapper.updateUser(user);
	}

	/* (non-Javadoc)
	 * @see org.feng.admin.backstage.service.AdminUserService#updatePassword(org.feng.admin.bean.AdminUser)
	 */
	@Override
	public Integer updatePassword(AdminUser user) {
		return this.mapper.updatePassword(user);
	}
	
}

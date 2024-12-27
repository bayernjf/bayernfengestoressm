/**
 * 
 */
package org.feng.admin.backstage.service;

import org.feng.admin.bean.AdminUser;

/**
 * @author ½ª·å
 *
 */
public interface AdminUserService {
	
	AdminUser login(AdminUser user);

	/**
	 * @param user
	 * @return
	 */
	Integer addUser(AdminUser user);

	/**
	 * @param username
	 * @return
	 */
	AdminUser findUserByUsername(String username);

	/**
	 * @param user
	 * @return
	 */
	Integer updateUser(AdminUser user);

	/**
	 * @param user
	 * @return
	 */
	Integer updatePassword(AdminUser user);

}

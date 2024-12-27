/**
 * 
 */
package org.feng.mapper;

import org.feng.admin.bean.AdminUser;

/**
 * @author ½ª·å
 *
 */
public interface AdminUserMapper {
	
	AdminUser getByNameAndPass(AdminUser user);

	/**
	 * @param user
	 * @return
	 */
	Integer add(AdminUser user);

	/**
	 * @param username
	 * @return
	 */
	AdminUser getByUsername(String username);

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

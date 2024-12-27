/**
 * 
 */
package org.feng.user.service;

import org.feng.bean.User;

/**
 * @author ½ª·å
 *
 */
public interface UserService {

	/**
	 * @param user
	 */
	User login(User user);

	/**
	 * @param phone
	 * @return
	 */
	User loginByPhone(String phone);

	/**
	 * @param user
	 */
	Integer register(User user);

	/**
	 * @param user
	 * @return
	 */
	User loginByPhone(User user);

	/**
	 * @param user
	 * @return
	 */
	User loginByEmail(User user);

	/**
	 * @param phone
	 * @return
	 */
	Integer changePasswordByPhone(User user);

	/**
	 * @param username
	 * @return
	 */
	User findUserByUsername(String username);

	/**
	 * @param email
	 * @return
	 */
	User findUserByEmail(String email);

	/**
	 * @param user
	 */
	Integer updateUser(User user);

	/**
	 * @param user
	 * @return
	 */
	Integer updateStat(User user);

	/**
	 * @param result
	 * @return
	 */
	Integer updateLogintime(User result);

}

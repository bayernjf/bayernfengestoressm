/**
 * 
 */
package org.feng.mapper;

import org.apache.ibatis.annotations.Param;
import org.feng.bean.User;

/**
 * @author ½ª·å
 *
 */
public interface UserMapper {

	User getByNameAndPass(@Param("username") String username, @Param("password") String password);
	
	/**
	 * @param user
	 * @return
	 */
	User getByNameAndPass(User user);

	/**
	 * @param user
	 * @return
	 */
	Integer add(User user);

	/**
	 * @param phone
	 */
	User loginByPhone(String phone);

	/**
	 * @param user
	 * @return
	 */
	User getByPhoneAndPassword(User user);

	/**
	 * @param user
	 * @return
	 */
	User getByEmailAndPassword(User user);

	/**
	 * @param user
	 * @return
	 */
	Integer updateUserByPhone(User user);

	/**
	 * @param username
	 * @return
	 */
	User getUserByUsername(String username);

	/**
	 * @param email
	 * @return
	 */
	User getUserByEmail(String email);

	/**
	 * @param user
	 * @return
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

/**
 * 
 */
package org.feng.user.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.feng.bean.User;
import org.feng.mapper.UserMapper;
import org.feng.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ½ª·å
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	
	/* (non-Javadoc)
	 * @see org.feng.service.UserService#login(org.feng.bean.User)
	 */
	@Override
	public User login(User user) {
		return this.mapper.getByNameAndPass(user);
	}


	/* (non-Javadoc)
	 * @see org.feng.user.service.UserService#loginByPhone(java.lang.String)
	 */
	@Override
	public User loginByPhone(String phone) {
		return this.mapper.loginByPhone(phone);
	}


	/* (non-Javadoc)
	 * @see org.feng.user.service.UserService#register(org.feng.bean.User)
	 */
	@Override
	public Integer register(User user) {
		user.setRegistertime(new Date());
		return this.mapper.add(user);
	}


	/* (non-Javadoc)
	 * @see org.feng.user.service.UserService#loginByPhone(org.feng.bean.User)
	 */
	@Override
	public User loginByPhone(User user) {
		return this.mapper.getByPhoneAndPassword(user);
	}


	/* (non-Javadoc)
	 * @see org.feng.user.service.UserService#loginByEmail(org.feng.bean.User)
	 */
	@Override
	public User loginByEmail(User user) {
		return this.mapper.getByEmailAndPassword(user);
	}


	/* (non-Javadoc)
	 * @see org.feng.user.service.UserService#changePasswordByPhone(java.lang.String)
	 */
	@Override
	public Integer changePasswordByPhone(User user) {
		return this.mapper.updateUserByPhone(user);
	}


	/* (non-Javadoc)
	 * @see org.feng.user.service.UserService#findUserByUsername(java.lang.String)
	 */
	@Override
	public User findUserByUsername(String username) {
		return this.mapper.getUserByUsername(username);
	}


	/* (non-Javadoc)
	 * @see org.feng.user.service.UserService#findUserByEmail(java.lang.String)
	 */
	@Override
	public User findUserByEmail(String email) {
		return this.mapper.getUserByEmail(email);
	}


	/* (non-Javadoc)
	 * @see org.feng.user.service.UserService#updateUser(org.feng.bean.User)
	 */
	@Override
	public Integer updateUser(User user) {
		return this.mapper.updateUser(user);
	}


	/* (non-Javadoc)
	 * @see org.feng.user.service.UserService#updateStat(org.feng.bean.User)
	 */
	@Override
	public Integer updateStat(User user) {
		return this.mapper.updateStat(user);
	}


	/* (non-Javadoc)
	 * @see org.feng.user.service.UserService#updateLogintime(org.feng.bean.User)
	 */
	@Override
	public Integer updateLogintime(User result) {
		return this.mapper.updateLogintime(result);
	}

}

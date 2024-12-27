/**
 * 
 */
package org.feng.admin.backstage.service;

import java.util.List;

import org.feng.admin.bean.AdminRole;
import org.feng.admin.bean.AdminRoleAuthorization;
import org.feng.mapper.AdminRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ½ª·å
 *
 */
@Service("adminRoleService")
public class AdminRoleServiceImpl implements AdminRoleService {

	@Autowired
	private AdminRoleMapper mapper;

	/* (non-Javadoc)
	 * @see org.feng.admin.backstage.service.AdminRoleService#getAllRoles()
	 */
	@Override
	public List<AdminRole> getAllRoles() {
		return this.mapper.getAll();
	}

	/* (non-Javadoc)
	 * @see org.feng.admin.backstage.service.AdminRoleService#getRoleById(java.lang.Integer)
	 */
	@Override
	public AdminRole getRoleById(Integer id) {
		return this.mapper.getById(id);
	}

	/* (non-Javadoc)
	 * @see org.feng.admin.backstage.service.AdminRoleService#getAuthorizationsByRole_Id(java.lang.Integer)
	 */
	@Override
	public List<AdminRoleAuthorization> getAuthorizationsByRole_Id(Integer role_id) {
		return this.mapper.getAuthorizationsByRole_Id(role_id);
	}

	/* (non-Javadoc)
	 * @see org.feng.admin.backstage.service.AdminRoleService#updateAuthorizationsForRole_Id(java.util.List)
	 */
	@Override
	public Integer updateAuthorizationsForRole_Id(List<AdminRoleAuthorization> listOfAdminRoleAuthorization) {
		Integer result = this.deleteAuthorizationsByRole_Id(listOfAdminRoleAuthorization.get(0).getRole_id());
		if (result == null) {
			return null;
		} else {
			return this.mapper.updateAuthorizationsForRole_Id(listOfAdminRoleAuthorization);
		}
	}
	
	public Integer deleteAuthorizationsByRole_Id(Integer role_id) {
		return this.mapper.deleteAuthorizationsByRole_Id(role_id);
	}
	
}

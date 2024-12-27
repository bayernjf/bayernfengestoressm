/**
 * 
 */
package org.feng.admin.backstage.service;

import java.util.List;

import org.feng.admin.bean.AdminRole;
import org.feng.admin.bean.AdminRoleAuthorization;

/**
 * @author ½ª·å
 *
 */
public interface AdminRoleService {

	/**
	 * @return
	 */
	List<AdminRole> getAllRoles();

	/**
	 * @param role_id
	 * @return
	 */
	AdminRole getRoleById(Integer id);

	/**
	 * @param role_id
	 * @return
	 */
	List<AdminRoleAuthorization> getAuthorizationsByRole_Id(Integer role_id);

	/**
	 * @param listOfAdminRoleAuthorization
	 * @return
	 */
	Integer updateAuthorizationsForRole_Id(List<AdminRoleAuthorization> listOfAdminRoleAuthorization);
	

}

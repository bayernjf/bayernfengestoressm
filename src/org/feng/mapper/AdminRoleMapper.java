/**
 * 
 */
package org.feng.mapper;

import java.util.List;

import org.feng.admin.bean.AdminRole;
import org.feng.admin.bean.AdminRoleAuthorization;

/**
 * @author ½ª·å
 *
 */
public interface AdminRoleMapper {

	/**
	 * @return
	 */
	List<AdminRole> getAll();

	/**
	 * @param id
	 * @return
	 */
	AdminRole getById(Integer id);

	/**
	 * @param role_id
	 * @return
	 */
	List<AdminRoleAuthorization> getAuthorizationsByRole_Id(Integer role_id);

	/**
	 * @param role_id
	 * @return
	 */
	Integer deleteAuthorizationsByRole_Id(Integer role_id);

	/**
	 * @param listOfAdminRoleAuthorization
	 * @return
	 */
	Integer updateAuthorizationsForRole_Id(List<AdminRoleAuthorization> listOfAdminRoleAuthorization);

}

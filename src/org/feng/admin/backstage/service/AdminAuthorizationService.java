/**
 * 
 */
package org.feng.admin.backstage.service;

import java.util.List;

import org.feng.admin.bean.AdminAuthorization;

/**
 * @author ����
 *
 */
public interface AdminAuthorizationService {

	/**
	 * @param ids
	 */
	List<AdminAuthorization> getAdminAuthorizationsByIds(List<Integer> ids);

}

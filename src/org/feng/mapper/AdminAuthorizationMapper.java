/**
 * 
 */
package org.feng.mapper;

import java.util.List;

import org.feng.admin.bean.AdminAuthorization;
import org.feng.bean.query.QueryAdminAuthorization;

/**
 * @author ½ª·å
 *
 */
public interface AdminAuthorizationMapper {

	/**
	 * @param ids
	 * @return
	 */
	List<AdminAuthorization> getAdminAuthorizationsByIds(QueryAdminAuthorization qaa);

}

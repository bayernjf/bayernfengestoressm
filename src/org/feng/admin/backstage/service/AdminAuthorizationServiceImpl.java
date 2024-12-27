/**
 * 
 */
package org.feng.admin.backstage.service;

import java.util.List;

import org.feng.admin.bean.AdminAuthorization;
import org.feng.bean.query.QueryAdminAuthorization;
import org.feng.mapper.AdminAuthorizationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminAuthorizationService")
public class AdminAuthorizationServiceImpl implements AdminAuthorizationService {

	@Autowired
	private AdminAuthorizationMapper mapper;

	/* (non-Javadoc)
	 * @see org.feng.admin.backstage.service.AdminAuthorizationService#getAdminAuthorizationsByIds(java.util.List)
	 */
	@Override
	public List<AdminAuthorization> getAdminAuthorizationsByIds(List<Integer> ids) {
		QueryAdminAuthorization qaa = new QueryAdminAuthorization();
		qaa.setIds(ids);
		return this.mapper.getAdminAuthorizationsByIds(qaa);
	}
	
}

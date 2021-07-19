package com.kh.projectMovie01.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.Admin_AreaDao;

@Service
public class Admin_AreaServiceImpl implements Admin_AreaService {

	@Inject
	private Admin_AreaDao admin_AreaDao;
	
	@Override
	public void movieAreaAdd(String area_name) {
		admin_AreaDao.movieAreaAdd(area_name);
	}

}

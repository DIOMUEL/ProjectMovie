package com.kh.projectMovie01.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Admin_AreaDaoImpl implements Admin_AreaDao {

	private static final String NAMESPACE = "mappers.area-mapper.";
	
	@Inject
	private SqlSession sqlSession;	
	
	@Override
	public void movieAreaAdd(String area_name) {
		sqlSession.insert(NAMESPACE + "movieAreaAdd", area_name);
	}
}

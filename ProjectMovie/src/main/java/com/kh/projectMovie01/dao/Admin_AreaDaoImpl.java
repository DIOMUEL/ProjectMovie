package com.kh.projectMovie01.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.AreaVo;

@Repository
public class Admin_AreaDaoImpl implements Admin_AreaDao {

	private static final String NAMESPACE = "mappers.area-mapper.";
	
	@Inject
	private SqlSession sqlSession;	
	
	@Override
	public void movieAreaAdd(String area_name) {
		sqlSession.insert(NAMESPACE + "movieAreaAdd", area_name);
	}

	@Override
	public List<AreaVo> getAllAreaList() {
		List<AreaVo> list = sqlSession.selectList(NAMESPACE + "movieAreaAdd");
		return list;
	}
}

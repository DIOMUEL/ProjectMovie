package com.kh.projectMovie01.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.kh.projectMovie01.vo.PointVo;

@Repository
public class PointDaoImpl implements PointDao {
	private static final String NAMESPACE = "com.kh.projectMovie01.point.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<PointVo> pointList(String user_id) {
		List<PointVo> list = sqlSession.selectList(NAMESPACE+"pointList",user_id);
		
		return list;
	}
}

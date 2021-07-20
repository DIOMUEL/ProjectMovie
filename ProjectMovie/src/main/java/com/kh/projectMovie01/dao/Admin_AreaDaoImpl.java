package com.kh.projectMovie01.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.AreaTheaterVo;
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
		List<AreaVo> list = sqlSession.selectList(NAMESPACE + "getAllAreaList");
		return list;
	}

	@Override
	public List<AreaTheaterVo> getAllAreaTheaterList(int area_no) {
		List<AreaTheaterVo> list = sqlSession.selectList(NAMESPACE + "getAllAreaTheaterList", area_no);
		return list;
	}

	@Override
	public void areaTheaterAdd(int area_no, String area_theater_name) {
		Map<String, Object> map = new HashMap<>();
		map.put("area_no", area_no);
		map.put("area_theater_name", area_theater_name);
		sqlSession.insert(NAMESPACE + "areaTheaterAdd", map);	
		
	}
}

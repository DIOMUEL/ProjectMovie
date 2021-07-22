package com.kh.projectMovie01.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.AreaTheaterVo;
import com.kh.projectMovie01.vo.AreaVo;
import com.kh.projectMovie01.vo.TheaterSeatVo;

@Repository
public class Admin_AreaDaoImpl implements Admin_AreaDao {

	private static final String NAMESPACE = "mappers.area-mapper.";
	
	@Inject
	private SqlSession sqlSession;	
	//지역 - 리스트
	@Override
	public List<AreaVo> getAllAreaList() {
		List<AreaVo> list = sqlSession.selectList(NAMESPACE + "getAllAreaList");
		return list;
	}
	// 지역 - 추가
	@Override
	public void movieAreaAdd(String area_name) {
		sqlSession.insert(NAMESPACE + "movieAreaAdd", area_name);
	}
	// 지역 - 수정
	@Override
	public void movieAreaModify(int area_no, String area_name) {
		Map<String, Object> map = new HashMap<>();
		map.put("area_no", area_no);
		map.put("area_name", area_name);
		sqlSession.update(NAMESPACE + "movieAreaModify", map);	
	}
	// 지역 - 삭제
	@Override
	public void movieAreaDelete(int area_no) {
		sqlSession.delete(NAMESPACE + "movieAreaDelete", area_no);	
	}
	// 영화관 - 리스트
	@Override
	public List<AreaTheaterVo> getAllAreaTheaterList(int area_no) {
		List<AreaTheaterVo> list = sqlSession.selectList(NAMESPACE + "getAllAreaTheaterList", area_no);
		return list;
	}
	// 영화관 - 추가
	@Override
	public void areaTheaterAdd(int area_no, String area_theater_name) {
		Map<String, Object> map = new HashMap<>();
		map.put("area_no", area_no);
		map.put("area_theater_name", area_theater_name);
		sqlSession.insert(NAMESPACE + "areaTheaterAdd", map);		
	}
	// 영화관 - 수정
	@Override
	public void areaTheaterModify(int area_theater_no, String area_theater_name) {
		Map<String, Object> map = new HashMap<>();
		map.put("area_theater_no", area_theater_no);
		map.put("area_theater_name", area_theater_name);
		sqlSession.update(NAMESPACE + "areaTheaterModify", map);		
	}
	// 영화관 - 삭제
	@Override
	public void areaTheaterDelete(int area_theater_no) {
		sqlSession.delete(NAMESPACE + "areaTheaterDelete", area_theater_no);
	}
	
	// 영화관좌석 - 리스트
	@Override
	public List<TheaterSeatVo> getSeveralTheaterSeatList(int area_theater_no) {
		List<TheaterSeatVo> list = sqlSession.selectList(NAMESPACE + "getSeveralTheaterSeatList", area_theater_no);
		return list;
	}
	@Override
	public void seatSettingRegist(int area_theater_no, String theater_name, int theater_seatNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("area_theater_no", area_theater_no);
		map.put("theater_name", theater_name);
		map.put("theater_seatNum", theater_seatNum);
		sqlSession.insert(NAMESPACE + "seatSettingRegist", map);		
	}
	@Override
	public void seatSettingModify(int theater_no, int theater_seatNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("theater_no", theater_no);
		map.put("theater_seatNum", theater_seatNum);
		sqlSession.update(NAMESPACE + "seatSettingModify", map);
	}
	@Override
	public void seatSettingDelete(int theater_no) {
		sqlSession.delete(NAMESPACE + "seatSettingDelete", theater_no);
	}
}

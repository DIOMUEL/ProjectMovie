package com.kh.projectMovie01.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.Admin_AreaDao;
import com.kh.projectMovie01.vo.AreaTheaterVo;
import com.kh.projectMovie01.vo.AreaVo;
import com.kh.projectMovie01.vo.TheaterSeatVo;

@Service
public class Admin_AreaServiceImpl implements Admin_AreaService {

	@Inject
	private Admin_AreaDao admin_AreaDao;
	
	//지역 - 리스트
	@Override
	public List<AreaVo> getAllAreaList() {
		List<AreaVo> list = admin_AreaDao.getAllAreaList();
		return list;
	}
	//지역 - 추가
	@Override
	public void movieAreaAdd(String area_name) {
		admin_AreaDao.movieAreaAdd(area_name);
	}
	//지역 - 수정
	@Override
	public void movieAreaModify(int area_no, String area_name) {
		admin_AreaDao.movieAreaModify(area_no, area_name);
	}
	//지역 - 삭제
	@Override
	public void movieAreaDelete(int area_no) {
		admin_AreaDao.movieAreaDelete(area_no);	
	}
	//영화관 - 리스트
	@Override
	public List<AreaTheaterVo> getAllAreaTheaterList(int area_no) {
		List<AreaTheaterVo> list = admin_AreaDao.getAllAreaTheaterList(area_no);
		return list;
	}
	//영화관 - 추가
	@Override
	public void areaTheaterAdd(int area_no, String area_theater_name) {
		admin_AreaDao.areaTheaterAdd(area_no, area_theater_name);
	}
	//영화관 - 수정
	@Override
	public void areaTheaterModify(int area_theater_no, String area_theater_name) {
		admin_AreaDao.areaTheaterModify(area_theater_no, area_theater_name);
	}
	//영화관 - 삭제
	@Override
	public void areaTheaterDelete(int area_theater_no) {
		admin_AreaDao.areaTheaterDelete(area_theater_no);	
	}
	//영화관 좌석 - 리스트
	@Override
	public List<TheaterSeatVo> getSeveralTheaterSeatList(int area_theater_no) {
		List<TheaterSeatVo> list = admin_AreaDao.getSeveralTheaterSeatList(area_theater_no);
		return list;
	}
	//영화관 좌석 등록
	@Override
	public void seatSettingRegist(int area_theater_no, String theater_name, int theater_seatNum) {
		admin_AreaDao.seatSettingRegist(area_theater_no, theater_name, theater_seatNum);	
	}
	@Override
	public void seatSettingModify(int theater_no, int theater_seatNum) {
		admin_AreaDao.seatSettingModify(theater_no, theater_seatNum);
	}
	@Override
	public void seatSettingDelete(int theater_no) {
		admin_AreaDao.seatSettingDelete(theater_no);
	}

}

package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.AreaTheaterVo;
import com.kh.projectMovie01.vo.AreaVo;
import com.kh.projectMovie01.vo.TheaterSeatVo;

public interface Admin_AreaService {
	//지역명
	public List<AreaVo> getAllAreaList();
	public void movieAreaAdd(String area_name);
	public void movieAreaModify(int area_no, String area_name);
	public void movieAreaDelete(int area_no);
	//영화관 
	public List<AreaTheaterVo> getAllAreaTheaterList(int area_no);
	public List<AreaTheaterVo> getFirstAreaTheaterList();
	public void areaTheaterAdd(int area_no, String area_theater_name);
	public void areaTheaterModify(int area_theater_no, String area_theater_name);
	public void areaTheaterDelete(int area_theater_no);
	//영화관 좌석
	public List<TheaterSeatVo> getSeveralTheaterSeatList(int area_theater_no);
	public void seatSettingRegist(int area_theater_no, String theater_name, int theater_seatNum);
	public void seatSettingModify(int theater_no, int theater_seatNum);
	public void seatSettingDelete(int theater_no);
}

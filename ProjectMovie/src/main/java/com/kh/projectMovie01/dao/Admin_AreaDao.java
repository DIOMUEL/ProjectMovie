package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.AreaTheaterVo;
import com.kh.projectMovie01.vo.AreaVo;

public interface Admin_AreaDao {
	//지역
	public List<AreaVo> getAllAreaList();
	public void movieAreaAdd(String area_name);
	public void movieAreaModify(int area_no, String area_name);
	public void movieAreaDelete(int area_no);
	//영화관
	public List<AreaTheaterVo> getAllAreaTheaterList(int area_no);
	public void areaTheaterAdd(int area_no, String area_theater_name);
	public void areaTheaterModify(int area_theater_no, String area_theater_name);
	public void areaTheaterDelete(int area_theater_no);
}

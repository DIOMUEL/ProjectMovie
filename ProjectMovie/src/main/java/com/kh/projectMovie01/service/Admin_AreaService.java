package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.AreaTheaterVo;
import com.kh.projectMovie01.vo.AreaVo;

public interface Admin_AreaService {
	//����
	public List<AreaVo> getAllAreaList();
	public void movieAreaAdd(String area_name);
	//��ȭ��
	public List<AreaTheaterVo> getAllAreaTheaterList(int area_no);
	public void areaTheaterAdd(int area_no, String area_theater_name);
}

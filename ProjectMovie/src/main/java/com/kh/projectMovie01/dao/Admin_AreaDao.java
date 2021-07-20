package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.AreaVo;

public interface Admin_AreaDao {

	public List<AreaVo> getAllAreaList();
	public void movieAreaAdd(String area_name);
}

package com.kh.projectMovie01.dao;

import com.kh.projectMovie01.vo.AreaVo;

public interface Admin_AreaDao {

	public AreaVo getAllAreaList();
	public void movieAreaAdd(String area_name);
}

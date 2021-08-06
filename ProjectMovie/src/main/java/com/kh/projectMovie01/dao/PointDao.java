package com.kh.projectMovie01.dao;

import java.util.List;


import com.kh.projectMovie01.vo.PointVo;

public interface PointDao {
	
	
	public List<PointVo> pointList(String user_id);
}

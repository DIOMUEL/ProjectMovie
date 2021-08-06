package com.kh.projectMovie01.service;

import java.util.List;


import com.kh.projectMovie01.vo.PointVo;

public interface PointService {
	public List<PointVo> pointList(String user_id);
}

package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.PointDao;
import com.kh.projectMovie01.vo.PointVo;

@Service
public class PointServiceImpl implements PointService {
	@Inject
	private PointDao pointDao;
	
	@Override
	public List<PointVo> pointList(String user_id) {
		List<PointVo> list =pointDao.pointList(user_id);
		return list;
	}
}

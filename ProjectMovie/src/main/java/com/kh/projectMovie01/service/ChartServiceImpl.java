package com.kh.projectMovie01.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.ChartDao;
import com.kh.projectMovie01.vo.ChartPieVo;

@Service
public class ChartServiceImpl implements ChartService {

	@Inject
	private ChartDao chartDao;
	
	@Override
	public ChartPieVo chartPie20() {
		ChartPieVo chartPieVo=chartDao.chartPie20();
		return chartPieVo;
	}

	@Override
	public ChartPieVo chartPie30() {
		ChartPieVo chartPieVo=chartDao.chartPie30();
		return chartPieVo;
	}

	@Override
	public ChartPieVo chartPie40() {
		ChartPieVo chartPieVo=chartDao.chartPie40();
		return chartPieVo;
	}

	@Override
	public ChartPieVo chartPie50() {
		ChartPieVo chartPieVo=chartDao.chartPie50();
		return chartPieVo;
	}

	@Override
	public ChartPieVo chartPie60() {
		ChartPieVo chartPieVo=chartDao.chartPie60();
		return chartPieVo;
	}
}

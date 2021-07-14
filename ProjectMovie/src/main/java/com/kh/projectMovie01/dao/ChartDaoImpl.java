package com.kh.projectMovie01.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.ChartPieVo;

@Repository
public class ChartDaoImpl implements ChartDao {

	private static final String NAMESPACE ="com.kh.projectMovie01.chart.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public ChartPieVo chartPie20() {
		ChartPieVo chartPieVo	= sqlSession.selectOne(NAMESPACE + "chartPie20");
		return chartPieVo;
	}
	@Override
	public ChartPieVo chartPie30() {
		ChartPieVo chartPieVo	= sqlSession.selectOne(NAMESPACE + "chartPie30");
		return chartPieVo;
	}

	@Override
	public ChartPieVo chartPie40() {
		ChartPieVo chartPieVo	= sqlSession.selectOne(NAMESPACE + "chartPie40");
		return chartPieVo;
	}

	@Override
	public ChartPieVo chartPie50() {
		ChartPieVo chartPieVo	= sqlSession.selectOne(NAMESPACE + "chartPie50");
		return chartPieVo;
	}

	@Override
	public ChartPieVo chartPie60() {
		ChartPieVo chartPieVo	= sqlSession.selectOne(NAMESPACE + "chartPie60");
		return chartPieVo;
	}
}

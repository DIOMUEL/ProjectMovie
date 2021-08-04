package com.kh.projectMovie01.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.NoticeMessageVo;
import com.kh.projectMovie01.vo.ReportVo;

@Repository
public class ReportDaoImple implements ReportDao {

	private static final String NAMESPACE = "com.kh.projectMovie01.report."; 
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertReport(ReportVo reportVo) {
		sqlSession.insert(NAMESPACE + "insertReport", reportVo);
		
	}

	@Override
	public List<ReportVo> reportListNotRead(String rpt_receiver) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReportVo> reportListReceive(String rpt_receiver) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReportVo> reportListSend(String rpt_sender) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReportVo> reportListSelf(String rpt_sender, String rpt_receiver) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int notReadCount(String rpt_receiver) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReportVo reportRead(int rpt_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOpenDate(int rpt_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Timestamp getOpendate(int rpt_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteReport(int rpt_no, String user_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ReportVo> reportList() {
		List<ReportVo> list = sqlSession.selectList(NAMESPACE + "selectReportList");
		return list;
	}

	
	

	

}

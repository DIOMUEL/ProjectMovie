package com.kh.projectMovie01.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.ReportDao;
import com.kh.projectMovie01.vo.ReportVo;



@Service
public class ReportServiceImple implements ReportService {

	@Inject
	private ReportDao reportDao;

	@Override
	public void sendReport(ReportVo reportVo) {
		reportDao.insertReport(reportVo);
		
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
	public boolean deleteReport(int rpt_no, String user_id) {
		// TODO Auto-generated method stub
		return false;
	}
	


	

}

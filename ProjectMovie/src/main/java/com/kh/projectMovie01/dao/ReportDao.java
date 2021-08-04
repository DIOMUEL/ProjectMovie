 package com.kh.projectMovie01.dao;



import java.sql.Timestamp;
import java.util.List;

import com.kh.projectMovie01.vo.ReportVo;

public interface ReportDao {

	//신고하기
	public void insertReport(ReportVo reportVo);
	public List<ReportVo> reportListNotRead(String rpt_receiver);
	public List<ReportVo> reportListReceive(String rpt_receiver);
	public List<ReportVo> reportListSend(String rpt_sender);
	public List<ReportVo> reportListSelf(String rpt_sender, String rpt_receiver);
	public int notReadCount(String rpt_receiver);
	public ReportVo reportRead(int rpt_no);
	public void updateOpenDate(int rpt_no);
	public Timestamp getOpendate(int rpt_no);
	public boolean deleteReport(int rpt_no, String user_id);
	//신고 받기 
	public List<ReportVo> reportList();
}

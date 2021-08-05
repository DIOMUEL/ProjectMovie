package com.kh.projectMovie01.vo;

import java.sql.Timestamp;

public class ReportVo {
	private int rpt_no;
	private String rpt_content;
	private String rpt_sender;
	private String rpt_receiver;
	private Timestamp rpt_senddate;
	private Timestamp rpt_opendate;
	private int rpt_c_no;
	private int b_no;
	public ReportVo() {
		super();
		// TODO Auto-generated constructor stub
	}
//	public ReportVo(String rpt_content, String rpt_sender, String rpt_receiver) {
//		super();
//		this.rpt_content = rpt_content;
//		this.rpt_sender = rpt_sender;
//		this.rpt_receiver = rpt_receiver;
//	}
	
	public ReportVo(String rpt_content, String rpt_sender, String rpt_receiver, int rpt_c_no, int b_no) {
		super();
		this.rpt_content = rpt_content;
		this.rpt_sender = rpt_sender;
		this.rpt_receiver = rpt_receiver;
		this.rpt_c_no = rpt_c_no;
		this.b_no = b_no;
	}
	
	public int getRpt_c_no() {
		return rpt_c_no;
	}
	public void setRpt_c_no(int rpt_c_no) {
		this.rpt_c_no = rpt_c_no;
	}
	public int getRpt_no() {
		return rpt_no;
	}
	public void setRpt_no(int rpt_no) {
		this.rpt_no = rpt_no;
	}
	public String getRpt_content() {
		return rpt_content;
	}
	public void setRpt_content(String rpt_content) {
		this.rpt_content = rpt_content;
	}
	public String getRpt_sender() {
		return rpt_sender;
	}
	public void setRpt_sender(String rpt_sender) {
		this.rpt_sender = rpt_sender;
	}
	public String getRpt_receiver() {
		return rpt_receiver;
	}
	public void setRpt_receiver(String rpt_receiver) {
		this.rpt_receiver = rpt_receiver;
	}
	public Timestamp getRpt_senddate() {
		return rpt_senddate;
	}
	public void setRpt_senddate(Timestamp rpt_senddate) {
		this.rpt_senddate = rpt_senddate;
	}
	public Timestamp getRpt_opendate() {
		return rpt_opendate;
	}
	public void setRpt_opendate(Timestamp rpt_opendate) {
		this.rpt_opendate = rpt_opendate;
	}
	
	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	@Override
	public String toString() {
		return "ReportVo [rpt_no=" + rpt_no + ", rpt_content=" + rpt_content + ", rpt_sender=" + rpt_sender
				+ ", rpt_receiver=" + rpt_receiver + ", rpt_senddate=" + rpt_senddate + ", rpt_opendate=" + rpt_opendate
				+ ", rpt_c_no=" + rpt_c_no + ", b_no=" + b_no + "]";
	}

	

	
	
	
}

package com.kh.projectMovie01.vo;

import java.security.Timestamp;

public class ScheduleManagementVo {
	private int managerSchedule_no;
	private int managerSchedule_year;
	private int managerSchedule_month;
	private int managerSchedule_date;
	private String managerSchedule_title;
	private String managerSchedule_content;
	private String managerSchedule_complete;
	private Timestamp managerSchedule_sysdate;
	
	public ScheduleManagementVo() {
		super();
	}
	public ScheduleManagementVo(int managerSchedule_no, int managerSchedule_year, int managerSchedule_month,
			int managerSchedule_date, String managerSchedule_title, String managerSchedule_content,
			String managerSchedule_complete, Timestamp managerSchedule_sysdate) {
		super();
		this.managerSchedule_no = managerSchedule_no;
		this.managerSchedule_year = managerSchedule_year;
		this.managerSchedule_month = managerSchedule_month;
		this.managerSchedule_date = managerSchedule_date;
		this.managerSchedule_title = managerSchedule_title;
		this.managerSchedule_content = managerSchedule_content;
		this.managerSchedule_complete = managerSchedule_complete;
		this.managerSchedule_sysdate = managerSchedule_sysdate;
	}
	public int getManagerSchedule_no() {
		return managerSchedule_no;
	}
	public void setManagerSchedule_no(int managerSchedule_no) {
		this.managerSchedule_no = managerSchedule_no;
	}
	public int getManagerSchedule_year() {
		return managerSchedule_year;
	}
	public void setManagerSchedule_year(int managerSchedule_year) {
		this.managerSchedule_year = managerSchedule_year;
	}
	public int getManagerSchedule_month() {
		return managerSchedule_month;
	}
	public void setManagerSchedule_month(int managerSchedule_month) {
		this.managerSchedule_month = managerSchedule_month;
	}
	public int getManagerSchedule_date() {
		return managerSchedule_date;
	}
	public void setManagerSchedule_date(int managerSchedule_date) {
		this.managerSchedule_date = managerSchedule_date;
	}
	public String getManagerSchedule_title() {
		return managerSchedule_title;
	}
	public void setManagerSchedule_title(String managerSchedule_title) {
		this.managerSchedule_title = managerSchedule_title;
	}
	public String getManagerSchedule_content() {
		return managerSchedule_content;
	}
	public void setManagerSchedule_content(String managerSchedule_content) {
		this.managerSchedule_content = managerSchedule_content;
	}
	public String getmanagerSchedule_complete() {
		return managerSchedule_complete;
	}
	public void setmanagerSchedule_complete(String managerSchedule_complete) {
		this.managerSchedule_complete = managerSchedule_complete;
	}
	public Timestamp getManagerSchedule_sysdate() {
		return managerSchedule_sysdate;
	}
	public void setManagerSchedule_sysdate(Timestamp managerSchedule_sysdate) {
		this.managerSchedule_sysdate = managerSchedule_sysdate;
	}
	@Override
	public String toString() {
		return "ScheduleManagementVo [managerSchedule_no=" + managerSchedule_no + ", managerSchedule_year="
				+ managerSchedule_year + ", managerSchedule_month=" + managerSchedule_month + ", managerSchedule_date="
				+ managerSchedule_date + ", managerSchedule_title=" + managerSchedule_title
				+ ", managerSchedule_content=" + managerSchedule_content + ", managerSchedule_complete="
				+ managerSchedule_complete + ", managerSchedule_sysdate=" + managerSchedule_sysdate + "]";
	}
	
}
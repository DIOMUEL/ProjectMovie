package com.kh.projectMovie01.vo;

import java.security.Timestamp;

public class ScheduleManagementVo {
	private int managerschedule_no;
	private int managerschedule_year;
	private int managerschedule_month;
	private int managerschedule_date;
	private String managerschedule_title;
	private String managerschedule_content;
	private String managerschedule_complete;
	private Timestamp managerschedule_sysdate;
	public ScheduleManagementVo() {
		super();
	}
	public ScheduleManagementVo(int managerschedule_no, int managerschedule_year, int managerschedule_month,
			int managerschedule_date, String managerschedule_title, String managerschedule_content,
			String managerschedule_complete, Timestamp managerschedule_sysdate) {
		super();
		this.managerschedule_no = managerschedule_no;
		this.managerschedule_year = managerschedule_year;
		this.managerschedule_month = managerschedule_month;
		this.managerschedule_date = managerschedule_date;
		this.managerschedule_title = managerschedule_title;
		this.managerschedule_content = managerschedule_content;
		this.managerschedule_complete = managerschedule_complete;
		this.managerschedule_sysdate = managerschedule_sysdate;
	}
	public int getManagerschedule_no() {
		return managerschedule_no;
	}
	public void setManagerschedule_no(int managerschedule_no) {
		this.managerschedule_no = managerschedule_no;
	}
	public int getManagerschedule_year() {
		return managerschedule_year;
	}
	public void setManagerschedule_year(int managerschedule_year) {
		this.managerschedule_year = managerschedule_year;
	}
	public int getManagerschedule_month() {
		return managerschedule_month;
	}
	public void setManagerschedule_month(int managerschedule_month) {
		this.managerschedule_month = managerschedule_month;
	}
	public int getManagerschedule_date() {
		return managerschedule_date;
	}
	public void setManagerschedule_date(int managerschedule_date) {
		this.managerschedule_date = managerschedule_date;
	}
	public String getManagerschedule_title() {
		return managerschedule_title;
	}
	public void setManagerschedule_title(String managerschedule_title) {
		this.managerschedule_title = managerschedule_title;
	}
	public String getManagerschedule_content() {
		return managerschedule_content;
	}
	public void setManagerschedule_content(String managerschedule_content) {
		this.managerschedule_content = managerschedule_content;
	}
	public String getManagerschedule_complete() {
		return managerschedule_complete;
	}
	public void setManagerschedule_complete(String managerschedule_complete) {
		this.managerschedule_complete = managerschedule_complete;
	}
	public Timestamp getManagerschedule_sysdate() {
		return managerschedule_sysdate;
	}
	public void setManagerschedule_sysdate(Timestamp managerschedule_sysdate) {
		this.managerschedule_sysdate = managerschedule_sysdate;
	}
	@Override
	public String toString() {
		return "ScheduleManagementVo [managerschedule_no=" + managerschedule_no + ", managerschedule_year="
				+ managerschedule_year + ", managerschedule_month=" + managerschedule_month + ", managerschedule_date="
				+ managerschedule_date + ", managerschedule_title=" + managerschedule_title
				+ ", managerschedule_content=" + managerschedule_content + ", managerschedule_complete="
				+ managerschedule_complete + ", managerschedule_sysdate=" + managerschedule_sysdate + "]";
	}
}

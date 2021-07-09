package com.kh.projectMovie01.vo;

import java.security.Timestamp;

public class MemberVo {
	private String user_id;
	private String user_pw;
	private String user_name;
	private int user_rrn;
	private String user_email;
	private Timestamp user_reg_date;
	public MemberVo() {
		super();
	}
	public MemberVo(String user_id, String user_pw, String user_name, int user_rrn, String user_email,
			Timestamp user_reg_date) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_rrn = user_rrn;
		this.user_email = user_email;
		this.user_reg_date = user_reg_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUser_rrn() {
		return user_rrn;
	}
	public void setUser_rrn(int user_rrn) {
		this.user_rrn = user_rrn;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Timestamp getUser_reg_date() {
		return user_reg_date;
	}
	public void setUser_reg_date(Timestamp user_reg_date) {
		this.user_reg_date = user_reg_date;
	}
	@Override
	public String toString() {
		return "MemberVo [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_rrn="
				+ user_rrn + ", user_email=" + user_email + ", user_reg_date=" + user_reg_date + "]";
	}
	
	
}

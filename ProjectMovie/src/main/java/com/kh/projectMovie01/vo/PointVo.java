package com.kh.projectMovie01.vo;

import java.sql.Timestamp;

public class PointVo {
	private int point_no;
	private String user_id;
	private int point_code;
	private int point_score;
	private String point_content;
	private Timestamp point_date;
	public int getPoint_no() {
		return point_no;
	}
	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPoint_code() {
		return point_code;
	}
	public void setPoint_code(int point_code) {
		this.point_code = point_code;
	}
	public int getPoint_score() {
		return point_score;
	}
	public void setPoint_score(int point_score) {
		this.point_score = point_score;
	}
	public String getPoint_content() {
		return point_content;
	}
	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}
	public Timestamp getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
	public PointVo(int point_no, String user_id, int point_code, int point_score, String point_content,
			Timestamp point_date) {
		super();
		this.point_no = point_no;
		this.user_id = user_id;
		this.point_code = point_code;
		this.point_score = point_score;
		this.point_content = point_content;
		this.point_date = point_date;
	}
	public PointVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PointVo [point_no=" + point_no + ", user_id=" + user_id + ", point_code=" + point_code
				+ ", point_score=" + point_score + ", point_content=" + point_content + ", point_date=" + point_date
				+ "]";
	}
	
	
}

package com.kh.projectMovie01.vo;

public class AreaVo {
	private int area_no;
	private String area_name;
	public AreaVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AreaVo(int area_no, String area_name) {
		super();
		this.area_no = area_no;
		this.area_name = area_name;
	}
	public int getArea_no() {
		return area_no;
	}
	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	@Override
	public String toString() {
		return "AreaVo [area_no=" + area_no + ", area_name=" + area_name + "]";
	}
}

package com.kh.projectMovie01.vo;

public class AreaTheaterVo {
	private int area_no;
	private int area_theater_no;
	private String area_theater_name;
	
	public AreaTheaterVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AreaTheaterVo(int area_no, int area_theater_no, String area_theater_name) {
		super();
		this.area_no = area_no;
		this.area_theater_no = area_theater_no;
		this.area_theater_name = area_theater_name;
	}
	public int getArea_no() {
		return area_no;
	}
	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}
	public int getArea_theater_no() {
		return area_theater_no;
	}
	public void setArea_theater_no(int area_theater_no) {
		this.area_theater_no = area_theater_no;
	}
	public String getArea_theater_name() {
		return area_theater_name;
	}
	public void setArea_theater_name(String area_theater_name) {
		this.area_theater_name = area_theater_name;
	}
	@Override
	public String toString() {
		return "AreaTheaterVo [area_no=" + area_no + ", area_theater_no=" + area_theater_no + ", area_theater_name="
				+ area_theater_name + "]";
	}
}

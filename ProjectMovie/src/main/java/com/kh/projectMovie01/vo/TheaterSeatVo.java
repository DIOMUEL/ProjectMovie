package com.kh.projectMovie01.vo;

public class TheaterSeatVo {
	private int area_theater_no;
	private String theater_name;
	private int theater_seatnum;
	
	public TheaterSeatVo() {
		super();
	}
	public TheaterSeatVo(int area_theater_no, String theater_name, int theater_seatnum) {
		super();
		this.area_theater_no = area_theater_no;
		this.theater_name = theater_name;
		this.theater_seatnum = theater_seatnum;
	}
	public int getArea_theater_no() {
		return area_theater_no;
	}
	public void setArea_theater_no(int area_theater_no) {
		this.area_theater_no = area_theater_no;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public int getTheater_seatnum() {
		return theater_seatnum;
	}
	public void setTheater_seatnum(int theater_seatnum) {
		this.theater_seatnum = theater_seatnum;
	}
	@Override
	public String toString() {
		return "TheaterSeatVo [area_theater_no=" + area_theater_no + ", theater_name=" + theater_name
				+ ", theater_seatnum=" + theater_seatnum + "]";
	}
}

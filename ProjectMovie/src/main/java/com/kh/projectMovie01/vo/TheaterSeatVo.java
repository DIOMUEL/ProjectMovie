package com.kh.projectMovie01.vo;

public class TheaterSeatVo {
	private int area_theater_no;
	private int theater_no;
	private String theater_name;
	private int theater_seatNum;
	
	public TheaterSeatVo() {
		super();
	}

	public TheaterSeatVo(int area_theater_no, int theater_no, String theater_name, int theater_seatNum) {
		super();
		this.area_theater_no = area_theater_no;
		this.theater_no = theater_no;
		this.theater_name = theater_name;
		this.theater_seatNum = theater_seatNum;
	}

	public int getArea_theater_no() {
		return area_theater_no;
	}

	public void setArea_theater_no(int area_theater_no) {
		this.area_theater_no = area_theater_no;
	}

	public int getTheater_no() {
		return theater_no;
	}

	public void setTheater_no(int theater_no) {
		this.theater_no = theater_no;
	}

	public String getTheater_name() {
		return theater_name;
	}

	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}

	public int gettheater_seatNum() {
		return theater_seatNum;
	}

	public void settheater_seatNum(int theater_seatNum) {
		this.theater_seatNum = theater_seatNum;
	}

	@Override
	public String toString() {
		return "TheaterSeatVo [area_theater_no=" + area_theater_no + ", theater_no=" + theater_no + ", theater_name="
				+ theater_name + ", theater_seatNum=" + theater_seatNum + "]";
	}
	
}
package com.kh.projectMovie01.vo;

import java.sql.Timestamp;

public class BuyMovieVo {
	private int bm_no; 
	private String user_id;
	private String bm_moviename;
	private int bm_price;
	private Timestamp bm_datepurch;
	
	public BuyMovieVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getBm_no() {
		return bm_no;
	}

	public void setBm_no(int bm_no) {
		this.bm_no = bm_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBm_moviename() {
		return bm_moviename;
	}

	public void setBm_moviename(String bm_moviename) {
		this.bm_moviename = bm_moviename;
	}

	public int getBm_price() {
		return bm_price;
	}

	public void setBm_price(int bm_price) {
		this.bm_price = bm_price;
	}

	public Timestamp getBm_datepurch() {
		return bm_datepurch;
	}

	public void setBm_datepurch(Timestamp bm_datepurch) {
		this.bm_datepurch = bm_datepurch;
	}

	

	public BuyMovieVo(int bm_no, String user_id, String bm_moviename, int bm_price, Timestamp bm_datepurch) {
		super();
		this.bm_no = bm_no;
		this.user_id = user_id;
		this.bm_moviename = bm_moviename;
		this.bm_price = bm_price;
		this.bm_datepurch = bm_datepurch;
	}

	@Override
	public String toString() {
		return "BuyMovieVo [bm_no=" + bm_no + ", user_id=" + user_id + ", bm_moviename=" + bm_moviename + ", bm_price="
				+ bm_price + ", bm_datepurch=" + bm_datepurch + "]";
	}
	
}

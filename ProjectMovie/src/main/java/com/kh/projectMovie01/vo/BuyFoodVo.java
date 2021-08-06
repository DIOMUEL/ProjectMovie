package com.kh.projectMovie01.vo;

import java.sql.Timestamp;

public class BuyFoodVo {
	private int bf_no;
	private String user_id;
	private String bf_foodname;
	private int bf_price;
	private Timestamp bf_datepurch;
	public int getBf_no() {
		return bf_no;
	}
	public void setBf_no(int bf_no) {
		this.bf_no = bf_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBf_foodname() {
		return bf_foodname;
	}
	public void setBf_foodname(String bf_foodname) {
		this.bf_foodname = bf_foodname;
	}
	public int getBf_price() {
		return bf_price;
	}
	public void setBf_price(int bf_price) {
		this.bf_price = bf_price;
	}
	public Timestamp getBf_datepurch() {
		return bf_datepurch;
	}
	public void setBf_datepurch(Timestamp bf_datepurch) {
		this.bf_datepurch = bf_datepurch;
	}
	@Override
	public String toString() {
		return "BuyFoodVo [bf_no=" + bf_no + ", user_id=" + user_id + ", bf_foodname=" + bf_foodname + ", bf_price="
				+ bf_price + ", bf_datepurch=" + bf_datepurch + "]";
	}
	public BuyFoodVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BuyFoodVo(int bf_no, String user_id, String bf_foodname, int bf_price, Timestamp bf_datepurch) {
		super();
		this.bf_no = bf_no;
		this.user_id = user_id;
		this.bf_foodname = bf_foodname;
		this.bf_price = bf_price;
		this.bf_datepurch = bf_datepurch;
	}
	
	
	
}

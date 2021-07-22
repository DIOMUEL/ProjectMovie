package com.kh.projectMovie01.vo;

import java.security.Timestamp;

public class FoodVo {
	private int food_num;
	private int food_code;
	private String food_name;
	private int food_price;
	private int food_count;
	private String food_image;
	private Timestamp food_regist_date;
	
	public FoodVo() {
		super();
	}

	public FoodVo(int food_num, int food_code, String food_name, int food_price, int food_count, String food_image,
			Timestamp food_regist_date) {
		super();
		this.food_num = food_num;
		this.food_code = food_code;
		this.food_name = food_name;
		this.food_price = food_price;
		this.food_count = food_count;
		this.food_image = food_image;
		this.food_regist_date = food_regist_date;
	}

	public int getFood_num() {
		return food_num;
	}

	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}

	public int getFood_code() {
		return food_code;
	}

	public void setFood_code(int food_code) {
		this.food_code = food_code;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public int getFood_price() {
		return food_price;
	}

	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}

	public int getFood_count() {
		return food_count;
	}

	public void setFood_count(int food_count) {
		this.food_count = food_count;
	}

	public String getFood_image() {
		return food_image;
	}

	public void setFood_image(String food_image) {
		this.food_image = food_image;
	}

	public Timestamp getFood_regist_date() {
		return food_regist_date;
	}

	public void setFood_regist_date(Timestamp food_regist_date) {
		this.food_regist_date = food_regist_date;
	}

	@Override
	public String toString() {
		return "FoodVo [food_num=" + food_num + ", food_code=" + food_code + ", food_name=" + food_name
				+ ", food_price=" + food_price + ", food_count=" + food_count + ", food_image=" + food_image
				+ ", food_regist_date=" + food_regist_date + "]";
	}	
}

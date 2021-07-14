package com.kh.projectMovie01.vo;

import java.security.Timestamp;

public class ChartPieVo {
	private String label_name;
	private int label_rate;
	private String label_bg_color;
	private String label_hbg_color;
	private Timestamp label_date;
	
	public ChartPieVo() {
		super();
	}
	public ChartPieVo(String label_name, int label_rate, String label_bg_color, String label_hbg_color,
			Timestamp label_date) {
		super();
		this.label_name = label_name;
		this.label_rate = label_rate;
		this.label_bg_color = label_bg_color;
		this.label_hbg_color = label_hbg_color;
		this.label_date = label_date;
	}
	public String getLabel_name() {
		return label_name;
	}
	public void setLabel_name(String label_name) {
		this.label_name = label_name;
	}
	public int getLabel_rate() {
		return label_rate;
	}
	public void setLabel_rate(int label_rate) {
		this.label_rate = label_rate;
	}
	public String getLabel_bg_color() {
		return label_bg_color;
	}
	public void setLabel_bg_color(String label_bg_color) {
		this.label_bg_color = label_bg_color;
	}
	public String getLabel_hbg_color() {
		return label_hbg_color;
	}
	public void setLabel_hbg_color(String label_hbg_color) {
		this.label_hbg_color = label_hbg_color;
	}
	public Timestamp getLabel_date() {
		return label_date;
	}
	public void setLabel_date(Timestamp label_date) {
		this.label_date = label_date;
	}
	@Override
	public String toString() {
		return "ChartPieVo [label_name=" + label_name + ", label_rate=" + label_rate + ", label_bg_color="
				+ label_bg_color + ", label_hbg_color=" + label_hbg_color + ", label_date=" + label_date + "]";
	}
	
}

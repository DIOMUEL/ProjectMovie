package com.kh.projectMovie01.vo;

import java.sql.Date;
import java.util.Arrays;

public class MovieVo {
	private String movie_code;
	private String movie_name;
	private String movie_genre;
	private String movie_director;
	private String movie_actor;
	private Date movie_open_date;
	private int movie_total_time;
	private String movie_main_image;
	private Date movie_regist_date;
	private String movie_grade;
	private String movie_preview;
	private int movie_num;
	private String[] movie_sub_image;
	private String movie_content;
	public MovieVo() {
		super();
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_actor() {
		return movie_actor;
	}
	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}
	public Date getMovie_open_date() {
		return movie_open_date;
	}
	public void setMovie_open_date(Date movie_open_date) {
		this.movie_open_date = movie_open_date;
	}
	public int getMovie_total_time() {
		return movie_total_time;
	}
	public void setMovie_total_time(int movie_total_time) {
		this.movie_total_time = movie_total_time;
	}
	public String getMovie_main_image() {
		return movie_main_image;
	}
	public void setMovie_main_image(String movie_main_image) {
		this.movie_main_image = movie_main_image;
	}
	public Date getMovie_regist_date() {
		return movie_regist_date;
	}
	public void setMovie_regist_date(Date movie_regist_date) {
		this.movie_regist_date = movie_regist_date;
	}
	public String getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}
	public String getMovie_preview() {
		return movie_preview;
	}
	public void setMovie_preview(String movie_preview) {
		this.movie_preview = movie_preview;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	
	
	public String[] getMovie_sub_image() {
		return movie_sub_image;
	}

	public void setMovie_sub_image(String[] movie_sub_image) {
		this.movie_sub_image = movie_sub_image;
	}

	public String getMovie_content() {
		return movie_content;
	}

	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}
	@Override
	public String toString() {
		return "MovieVo [movie_code=" + movie_code + ", movie_name=" + movie_name + ", movie_genre=" + movie_genre
				+ ", movie_director=" + movie_director + ", movie_actor=" + movie_actor + ", movie_open_date="
				+ movie_open_date + ", movie_total_time=" + movie_total_time + ", movie_main_image=" + movie_main_image
				+ ", movie_regist_date=" + movie_regist_date + ", movie_grade=" + movie_grade + ", movie_preview="
				+ movie_preview + ", movie_num=" + movie_num + ", movie_sub_image=" + Arrays.toString(movie_sub_image)
				+ ", movie_content=" + movie_content + "]";
	}
	
}


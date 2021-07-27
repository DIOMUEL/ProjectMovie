package com.kh.projectMovie01.vo;

import java.security.Timestamp;

public class MovieScheduleVo {

	private int movieschedule_recoding;
	private int area_theater_no;
	private String movieSchedule_type;
	private String movie_name;
	private String movieSchedule_playTime;
	private int movieSchedule_totalPlayTime;
	private int movieSchedule_seat;
	private int movieSchedule_count;
	private Timestamp movieSchedule_registTime;
	
	public MovieScheduleVo() {
		super();
	}
	public MovieScheduleVo(int movieschedule_recoding, int area_theater_no, String movieSchedule_type,
			String movie_name, String movieSchedule_playTime, int movieSchedule_totalPlayTime, int movieSchedule_seat,
			int movieSchedule_count, Timestamp movieSchedule_registTime) {
		super();
		this.movieschedule_recoding = movieschedule_recoding;
		this.area_theater_no = area_theater_no;
		this.movieSchedule_type = movieSchedule_type;
		this.movie_name = movie_name;
		this.movieSchedule_playTime = movieSchedule_playTime;
		this.movieSchedule_totalPlayTime = movieSchedule_totalPlayTime;
		this.movieSchedule_seat = movieSchedule_seat;
		this.movieSchedule_count = movieSchedule_count;
		this.movieSchedule_registTime = movieSchedule_registTime;
	}
	public int getMovieschedule_recoding() {
		return movieschedule_recoding;
	}
	public void setMovieschedule_recoding(int movieschedule_recoding) {
		this.movieschedule_recoding = movieschedule_recoding;
	}
	public int getArea_theater_no() {
		return area_theater_no;
	}
	public void setArea_theater_no(int area_theater_no) {
		this.area_theater_no = area_theater_no;
	}
	public String getMovieSchedule_type() {
		return movieSchedule_type;
	}
	public void setMovieSchedule_type(String movieSchedule_type) {
		this.movieSchedule_type = movieSchedule_type;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovieSchedule_playTime() {
		return movieSchedule_playTime;
	}
	public void setMovieSchedule_playTime(String movieSchedule_playTime) {
		this.movieSchedule_playTime = movieSchedule_playTime;
	}
	public int getMovieSchedule_totalPlayTime() {
		return movieSchedule_totalPlayTime;
	}
	public void setMovieSchedule_totalPlayTime(int movieSchedule_totalPlayTime) {
		this.movieSchedule_totalPlayTime = movieSchedule_totalPlayTime;
	}
	public int getMovieSchedule_seat() {
		return movieSchedule_seat;
	}
	public void setMovieSchedule_seat(int movieSchedule_seat) {
		this.movieSchedule_seat = movieSchedule_seat;
	}
	public int getMovieSchedule_count() {
		return movieSchedule_count;
	}
	public void setMovieSchedule_count(int movieSchedule_count) {
		this.movieSchedule_count = movieSchedule_count;
	}
	public Timestamp getMovieSchedule_registTime() {
		return movieSchedule_registTime;
	}
	public void setMovieSchedule_registTime(Timestamp movieSchedule_registTime) {
		this.movieSchedule_registTime = movieSchedule_registTime;
	}
	@Override
	public String toString() {
		return "MovieScheduleVo [movieschedule_recoding=" + movieschedule_recoding + ", area_theater_no="
				+ area_theater_no + ", movieSchedule_type=" + movieSchedule_type + ", movie_name=" + movie_name
				+ ", movieSchedule_playTime=" + movieSchedule_playTime + ", movieSchedule_totalPlayTime="
				+ movieSchedule_totalPlayTime + ", movieSchedule_seat=" + movieSchedule_seat + ", movieSchedule_count="
				+ movieSchedule_count + ", movieSchedule_registTime=" + movieSchedule_registTime + "]";
	}
}

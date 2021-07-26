package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.Admin_PageingDto;
import com.kh.projectMovie01.vo.MovieImageVo;
import com.kh.projectMovie01.vo.MovieScheduleVo;
import com.kh.projectMovie01.vo.MovieVo;

public interface Admin_MovieService {

	public void administerMovieRegistRun(MovieVo MovieVo);
	public MovieVo selectByMovie(String movie_code);
	public List<MovieImageVo> selectByMovieSubImage(String movie_code);
	public void movieModify(MovieVo movieVo) throws Exception;
	public String selectMovieCode();
	public int getCountMovie(Admin_PageingDto admin_PageingDto);
	public List<MovieVo> listAll(Admin_PageingDto admin_PageingDto);
	public List<MovieVo> nameListAll();
	public void deleteMovie(String movie_code);
	public MovieVo getMovieInfo(String movie_name);
	
	//영화 스케줄 등록 관련
	public void insertMoviSchedule(MovieScheduleVo movieScheduleVo);
	public MovieScheduleVo selectMoviSchedule(int area_theater_no);
}

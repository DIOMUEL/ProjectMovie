package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.Admin_PageingDto;
import com.kh.projectMovie01.vo.MovieImageVo;
import com.kh.projectMovie01.vo.MovieVo;

public interface Admin_MovieDao {

	//영화포스터 관련
	public void administerMovieRegistRun(MovieVo MovieVo);
	public MovieVo selectByMovie(String movie_code);
	public String selectMovieCode();
	public void administerMovieSubImageRegistRun(String movie_code, String movie_sub_image);
	public List<MovieImageVo> selectByMovieSubImage(String movie_code);
	public void movieModify(MovieVo MovieVo);
	public void deleteMovieImage(String movie_code);
	public int getCountMovie(Admin_PageingDto admin_PageingDto);
	public List<MovieVo> listAll(Admin_PageingDto admin_PageingDto);
	public void deleteMovie(String movie_code);
}
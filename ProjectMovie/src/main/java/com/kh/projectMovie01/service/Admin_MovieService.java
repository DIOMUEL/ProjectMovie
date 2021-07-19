package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.Admin_PageingDto;
import com.kh.projectMovie01.vo.MovieImageVo;
import com.kh.projectMovie01.vo.MovieVo;

public interface Admin_MovieService {
	
	public List<MovieVo> getMovieList();
	public void administerMovieRegistRun(MovieVo MovieVo);
	public MovieVo selectByMovie(String movie_code);
	public List<MovieImageVo> selectByMovieSubImage(String movie_code);
	public void movieModify(MovieVo movieVo) throws Exception;
	public String selectMovieCode();
	public int getCountMovie(Admin_PageingDto admin_PageingDto);
	public List<MovieVo> moviePagingList(Admin_PageingDto admin_PageingDto);

}

package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.BuyMovieVo;


public interface BuyMovieDao {
	public List<BuyMovieVo> buyMovieList();
	public BuyMovieVo selectBybmno(int bm_no);
	
}

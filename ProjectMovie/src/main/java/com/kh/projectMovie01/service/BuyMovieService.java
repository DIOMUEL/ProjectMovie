package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.BuyMovieVo;

public interface BuyMovieService {
	public List<BuyMovieVo> buyMovieList();
	public BuyMovieVo selectBybmno(int bm_no);
}

package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.BuyMovieDao;
import com.kh.projectMovie01.vo.BuyMovieVo;

@Service
public class BuyMovieServiceImpl implements BuyMovieService {

	@Inject
	private BuyMovieDao buyMovieDao;
	
	@Override
	public List<BuyMovieVo> buyMovieList() {
		List<BuyMovieVo> list =buyMovieDao.buyMovieList();
		return list;
	}

	@Override
	public BuyMovieVo selectBybmno(int bm_no) {		
		return buyMovieDao.selectBybmno(bm_no);
	}

}

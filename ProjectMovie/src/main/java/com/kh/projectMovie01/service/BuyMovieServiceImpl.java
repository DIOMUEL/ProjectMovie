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
	public List<BuyMovieVo> buyMovieList(String user_id) {
		List<BuyMovieVo> list =buyMovieDao.buyMovieList(user_id);
		return list;
	}

//	@Override
//	public BuyMovieVo selectBybmid(String user_id) {
//		BuyMovieVo buyMovieVo = buyMovieDao.selectBybmid(user_id);
//		return buyMovieVo;
//	}



}

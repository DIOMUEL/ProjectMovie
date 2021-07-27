package com.kh.projectMovie01.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.LikeDao;
import com.kh.projectMovie01.vo.LikeVo;

@Service
public class LikeServiceImple implements LikeService {

	@Inject
	private LikeDao likeDao;
	
	
	@Override
	public void sendLike(LikeVo likeVo) {
		likeDao.sendLike(likeVo);
		
	}

	@Override
	public boolean checkLike(LikeVo likeVo) {
		return likeDao.checkLike(likeVo);
		
	}

	@Override
	public int likeCount(int b_no) {
		return likeDao.likeCount(b_no);
		
	}

	@Override
	public void sendLikeCancel(LikeVo likeVo) {
		likeDao.sendLikeCancel(likeVo);
		
	}

}

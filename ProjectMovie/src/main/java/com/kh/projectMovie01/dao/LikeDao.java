package com.kh.projectMovie01.dao;

import com.kh.projectMovie01.vo.LikeVo;

public interface LikeDao {
	public void sendLike(LikeVo likeVo);
	public boolean checkLike(LikeVo likeVo);
	public int likeCount(int b_no);
	public void sendLikeCancel(LikeVo likeVo);
}

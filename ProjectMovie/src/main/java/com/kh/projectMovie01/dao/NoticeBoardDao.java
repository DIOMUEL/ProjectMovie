package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.NoticeBoardVo;

public interface NoticeBoardDao {

	public List<NoticeBoardVo> listAll();
	public NoticeBoardVo selectByBno(int b_no);
	public int getNextVal();
	public void insertArticle(NoticeBoardVo noticeBoardVo);
	public void updateArticle(NoticeBoardVo noticeBoardVo);
	public void deleteArticle(int b_no);
}

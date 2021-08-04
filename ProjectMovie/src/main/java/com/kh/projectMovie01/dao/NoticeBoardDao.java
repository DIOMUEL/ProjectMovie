package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.NoticeBoardVo;
import com.kh.projectMovie01.vo.PagingDto;

public interface NoticeBoardDao {

	public List<NoticeBoardVo> listAll(PagingDto pagingDto);
	public NoticeBoardVo selectByBno(int b_no);
	public int getNextVal();
	public void insertArticle(NoticeBoardVo noticeBoardVo);
	public void updateArticle(NoticeBoardVo noticeBoardVo);
	public void deleteArticle(int b_no);
	public int getCount(PagingDto pagingDto);
	public void updateViewCnt(int b_no);
	public void updateCommentCnt(int b_no, int count);
	public List<NoticeBoardVo> myNoticeBoard(String user_id, PagingDto pagingDto);
	public List<NoticeBoardVo> noticeBoardHeadList(PagingDto pagingDto);
	public List<NoticeBoardVo> noticeBoardBranchList(PagingDto pagingDto);
}

package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.NoticeBoardVo;
import com.kh.projectMovie01.vo.PagingDto;

public interface NoticeBoardService {
	
	public List<NoticeBoardVo> noticeBoardPage(PagingDto pagingDto);
	public NoticeBoardVo noticeBoardContentPage(int b_no);
	public void noticeBoardWirteRun(NoticeBoardVo noticeBoardVo);
	public void noticeBoardModifyRun(NoticeBoardVo noticeBoardVo);
	public void noticeBoardDeleteRun(int b_no);
	public int getCount(PagingDto pagingDto);	
	public List<NoticeBoardVo> myNoticeBoard(String user_id, PagingDto pagingDto);
	

}

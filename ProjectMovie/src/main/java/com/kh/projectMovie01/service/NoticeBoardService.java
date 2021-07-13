package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.NoticeBoardVo;

public interface NoticeBoardService {
	
	public List<NoticeBoardVo> noticeBoardPage();
	public NoticeBoardVo noticeBoardContentPage(int b_no);
	public void noticeBoardWirteRun(NoticeBoardVo noticeBoardVo);
	public void noticeBoardModifyRun(NoticeBoardVo noticeBoardVo);
	public void noticeBoardDeleteRun(int b_no);

}

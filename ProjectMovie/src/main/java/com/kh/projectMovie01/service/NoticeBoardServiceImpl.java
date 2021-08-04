package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.NoticeBoardDao;
import com.kh.projectMovie01.vo.NoticeBoardVo;
import com.kh.projectMovie01.vo.PagingDto;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Inject
	private NoticeBoardDao noticeBoardDao;
	
	@Override
	public List<NoticeBoardVo> noticeBoardPage(PagingDto pagingDto) {
		List<NoticeBoardVo> list = noticeBoardDao.listAll(pagingDto);
		return list;
	}

	@Override
	public NoticeBoardVo noticeBoardContentPage(int b_no) {
		NoticeBoardVo noticeBoardVo = noticeBoardDao.selectByBno(b_no);
		noticeBoardDao.updateViewCnt(b_no);
		return noticeBoardVo;
	}

	@Override
	public void noticeBoardWirteRun(NoticeBoardVo noticeBoardVo) {
		int nextval = noticeBoardDao.getNextVal();
		noticeBoardVo.setB_no(nextval);
		noticeBoardDao.insertArticle(noticeBoardVo);
	}

	@Override
	public void noticeBoardModifyRun(NoticeBoardVo noticeBoardVo) {
		noticeBoardDao.updateArticle(noticeBoardVo);
		
	}

	@Override
	public void noticeBoardDeleteRun(int b_no) {
		noticeBoardDao.deleteArticle(b_no);
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = noticeBoardDao.getCount(pagingDto);
		return count;
	}

	@Override
	public List<NoticeBoardVo> myNoticeBoard(String user_id, PagingDto pagingDto) {
		List<NoticeBoardVo> list = noticeBoardDao.myNoticeBoard(user_id, pagingDto);
		return list;
	}

	@Override
	public List<NoticeBoardVo> noticeBoardHeadList(PagingDto pagingDto) {
		List<NoticeBoardVo> list = noticeBoardDao.noticeBoardHeadList(pagingDto);
		return list;
	}

	@Override
	public List<NoticeBoardVo> noticeBoardBranchList(PagingDto pagingDto) {
		List<NoticeBoardVo> list = noticeBoardDao.noticeBoardBranchList(pagingDto);
		return list;
	}

}

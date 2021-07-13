package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.NoticeBoardDao;
import com.kh.projectMovie01.vo.NoticeBoardVo;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Inject
	private NoticeBoardDao noticeBoardDao;
	
	@Override
	public List<NoticeBoardVo> noticeBoardPage() {
		List<NoticeBoardVo> list = noticeBoardDao.listAll();
		return list;
	}

	@Override
	public NoticeBoardVo noticeBoardContentPage(int b_no) {
		NoticeBoardVo noticeBoardVo = noticeBoardDao.selectByBno(b_no);
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

}

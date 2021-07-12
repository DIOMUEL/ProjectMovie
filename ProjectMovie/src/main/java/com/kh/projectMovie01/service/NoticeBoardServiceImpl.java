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

}

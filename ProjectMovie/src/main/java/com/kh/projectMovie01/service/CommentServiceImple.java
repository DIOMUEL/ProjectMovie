package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.projectMovie01.dao.CommentDao;
import com.kh.projectMovie01.dao.NoticeBoardDao;
import com.kh.projectMovie01.vo.CommentVo;

@Service
public class CommentServiceImple implements CommentService {
	
	@Inject
	private CommentDao commentDao;
	@Inject
	private NoticeBoardDao noticeBoardDao;

	@Override
	public List<CommentVo> getCommentList(int b_no) {
		List<CommentVo> list = commentDao.getCommentList(b_no);
		return list;
	}
	
	@Transactional
	@Override
	public void insertComment(CommentVo commentVo) {
		commentDao.insertComment(commentVo);
		noticeBoardDao.updateCommentCnt(commentVo.getB_no(), 1);
	}

	@Override
	public void updateComment(CommentVo commentVo) {
		commentDao.updateCommet(commentVo);
		
	}
	
	@Transactional
	@Override
	public void deleteComment(int c_no, int b_no) {
		commentDao.deleteComment(c_no);
		noticeBoardDao.updateCommentCnt(b_no, -1);
	}

}

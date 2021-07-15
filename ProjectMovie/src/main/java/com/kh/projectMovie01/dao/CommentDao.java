package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.CommentVo;

public interface CommentDao {
	
	public List<CommentVo> getCommentList(int b_no);
	public void insertComment(CommentVo commentVo);
	public void updateCommet(CommentVo commentVo);
	public void deleteComment(int c_no);

}

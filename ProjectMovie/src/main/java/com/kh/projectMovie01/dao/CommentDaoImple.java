package com.kh.projectMovie01.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.CommentVo;

@Repository
public class CommentDaoImple implements CommentDao {
	
	private static final String NAMESPACE = "com.kh.projectMovie.comment.";

	@Inject
	SqlSession sqlsession;

	@Override
	public List<CommentVo> getCommentList(int b_no) {
		List<CommentVo> list = sqlsession.selectList(NAMESPACE + "getCommentList", b_no);
		return list;
	}

	@Override
	public void insertComment(CommentVo commentVo) {
		sqlsession.insert(NAMESPACE + "insertCommentList", commentVo);
		
	}

	@Override
	public void updateCommet(CommentVo commentVo) {
		sqlsession.update(NAMESPACE + "updateCommetList", commentVo);
		
	}

	@Override
	public void deleteComment(int c_no) {
		sqlsession.delete(NAMESPACE + "deleteCommentList", c_no);
		
	}

	
	
}

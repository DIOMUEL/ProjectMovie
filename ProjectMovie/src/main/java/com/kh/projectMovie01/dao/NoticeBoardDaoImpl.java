package com.kh.projectMovie01.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.NoticeBoardVo;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {
	
	private static final String NAMESPACE = "com.kh.projectMovie01.noticeBoard.";

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<NoticeBoardVo> listAll() {
		List<NoticeBoardVo> list = sqlSession.selectList(NAMESPACE + "listAll");
		
		return list;
	}

	@Override
	public NoticeBoardVo selectByBno(int b_no) {
		NoticeBoardVo noticeboardVo = sqlSession.selectOne(NAMESPACE + "selectByBno", b_no); 
		return noticeboardVo;
	}

	@Override
	public void insertArticle(NoticeBoardVo noticeBoardVo) {
		sqlSession.insert(NAMESPACE + "insertArticle", noticeBoardVo);
	}

	@Override
	public int getNextVal() {
		int nextval = sqlSession.selectOne(NAMESPACE + "getNextVal"); 
		return nextval;
	}

	@Override
	public void updateArticle(NoticeBoardVo noticeBoardVo) {
		sqlSession.update(NAMESPACE + "updateArticle", noticeBoardVo);
		
	}

	@Override
	public void deleteArticle(int b_no) {
		sqlSession.delete(NAMESPACE + "deleteArticle", b_no);
		
	}

}

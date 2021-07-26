package com.kh.projectMovie01.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.NoticeBoardVo;
import com.kh.projectMovie01.vo.PagingDto;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {
	
	private static final String NAMESPACE = "com.kh.projectMovie01.noticeBoard.";

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<NoticeBoardVo> listAll(PagingDto pagingDto) {
		List<NoticeBoardVo> list = sqlSession.selectList(NAMESPACE + "listAll", pagingDto);
		
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

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
		return count;
	}

	@Override
	public void updateViewCnt(int b_no) {
		sqlSession.update(NAMESPACE + "updateViewCnt", b_no);
		
	}

	@Override
	public void updateCommentCnt(int b_no, int count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("b_no", b_no);
		map.put("count", count);
		sqlSession.update(NAMESPACE + "updateCommentCnt", map);
	
		
	}

	@Override
	public List<NoticeBoardVo> myNoticeBoard(String user_id, PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("pagingDto", pagingDto);
		List<NoticeBoardVo> list = sqlSession.selectList(NAMESPACE + "myNoticeBoard", map);
		return list;
	}

}

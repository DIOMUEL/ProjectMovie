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

}

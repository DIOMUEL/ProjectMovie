package com.kh.projectMovie01.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.BuyMovieVo;

@Repository
public class BuyMovieDaoImpl implements BuyMovieDao {
	
private static final String NAMESPACE = "com.kh.projectMovie01.buyMovie.";

	@Inject
	SqlSession sqlSession;

	@Override
	public List<BuyMovieVo> buyMovieList(String user_id) {
		List<BuyMovieVo> list = sqlSession.selectList(NAMESPACE+"buyMovieList",user_id);
		return list;
	}
//
//	@Override
//	public BuyMovieVo selectBybmid(String user_id) {		
//		return sqlSession.selectOne(NAMESPACE+"selectBybmid", user_id);
//	}

	
}

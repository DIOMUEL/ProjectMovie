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
	public List<BuyMovieVo> buyMovieList() {
		List<BuyMovieVo> list = sqlSession.selectList(NAMESPACE+"buyMovieList");
		return list;
	}

	@Override
	public BuyMovieVo selectBybmno(int bm_no) {		
		return sqlSession.selectOne(NAMESPACE+"selectBybmno", bm_no);
	}

	
}

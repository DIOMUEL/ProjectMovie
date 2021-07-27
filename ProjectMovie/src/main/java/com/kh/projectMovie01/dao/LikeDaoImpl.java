package com.kh.projectMovie01.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.LikeVo;

@Repository
public class LikeDaoImpl implements LikeDao {

	@Inject
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.projectMovie01.like.";
	
	@Override
	public void sendLike(LikeVo likeVo) {
		sqlSession.insert(NAMESPACE + "sendLike", likeVo);
		
	}

	@Override
	public boolean checkLike(LikeVo likeVo) {
		int count = sqlSession.selectOne(NAMESPACE + "checkLike", likeVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int likeCount(int b_no) {
		return sqlSession.selectOne(NAMESPACE + "likeCount", b_no);

	}

	@Override
	public void sendLikeCancel(LikeVo likeVo) {
		sqlSession.delete(NAMESPACE + "sendLikeCancel", likeVo);
		
	}

}

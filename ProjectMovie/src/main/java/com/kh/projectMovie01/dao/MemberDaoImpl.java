package com.kh.projectMovie01.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	private static final String NAMESPACE ="com.kh.projectMovie01.member.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVo memberVo) {
		sqlSession.insert(NAMESPACE + "insertMember", memberVo);
	}

	@Override
	public MemberVo loginMember(String user_id, String user_pw) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "loginMember", map);
		return memberVo;
	}

	@Override
	public boolean checkDupId(String user_id) {
		int count = sqlSession.selectOne(NAMESPACE + "checkDupId", user_id);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	
}

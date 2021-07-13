package com.kh.projectMovie01.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.MemberDao;
import com.kh.projectMovie01.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDao memberDao;
	
	@Override
	public void insertMember(MemberVo memberVo) {
		memberDao.insertMember(memberVo);
	}

	@Override
	public MemberVo loginMember(String user_id, String user_pw) {
		MemberVo memberVo = memberDao.loginMember(user_id, user_pw);
		return memberVo;
	}

	@Override
	public boolean checkDupId(String user_id) {
		boolean result = memberDao.checkDupId(user_id);
		if(result == true) {
			return true;
		}
		return false;
	}

	@Override
	public MemberVo myinfo(String user_id) {
		MemberVo memberVo = memberDao.myinfo(user_id);
		return memberVo;
	}

	

	
}

package com.kh.projectMovie01.dao;

import com.kh.projectMovie01.vo.MemberVo;

public interface MemberDao {
	
	public void insertMember(MemberVo memberVo);
	public MemberVo loginMember(String user_id, String user_pw);
}

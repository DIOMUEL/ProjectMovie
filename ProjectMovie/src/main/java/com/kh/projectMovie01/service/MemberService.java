package com.kh.projectMovie01.service;

import com.kh.projectMovie01.vo.MemberVo;

public interface MemberService {
	
	public void insertMember(MemberVo memberVo);
	public MemberVo loginMember(String user_id, String user_pw);
	public boolean checkDupId(String user_id);
	public MemberVo myinfo(String user_id);
	public void changePw(String user_id, String user_pw);
	public void changeEmail(String user_id, String user_email);
}

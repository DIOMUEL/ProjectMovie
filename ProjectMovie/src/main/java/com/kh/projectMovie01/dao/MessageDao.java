package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.MessageVo;

public interface MessageDao {
	
	public List<MessageVo> receive_MessageList(String user_id);	
	public List<MessageVo> send_MessageList(String user_id);
}
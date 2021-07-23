package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.MessageVo;

public interface MessageDao {
	
	public void insertMessage(MessageVo messageVo);
	public List<MessageVo> receive_MessageList(String user_id);	
	public List<MessageVo> send_MessageList(String user_id);
	public MessageVo readMessage(int msg_no);
	public boolean deleteMessage(int msg_no, String user_id);
}

package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.MessageVo;

public interface MessageService {
	
	public List<MessageVo> receive_MessageList(String user_id);	
	public List<MessageVo> send_MessageList(String user_id);
	public MessageVo messageRead(int msg_no,String user_id);
	public void sendMessage(MessageVo messageVo);
}

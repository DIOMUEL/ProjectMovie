package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.projectMovie01.dao.MessageDao;
import com.kh.projectMovie01.vo.MessageVo;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDao messageDao;

	@Override
	public List<MessageVo> receive_MessageList(String user_id) {
		List<MessageVo> list = messageDao.receive_MessageList(user_id);
		return list;
	}

	// ���� �޽�����
	@Override
	public List<MessageVo> send_MessageList(String user_id) {
		List<MessageVo> list = messageDao.send_MessageList(user_id);
		return list;
	}
	@Override
	public MessageVo messageRead(int msg_no, String user_id) {
		MessageVo messageVo = messageDao.readMessage(msg_no);
		return messageVo;
	}
	@Transactional
	@Override
	public void sendMessage(MessageVo messageVo) {
		messageDao.insertMessage(messageVo);				
	}	
}

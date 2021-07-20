package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

	// 보낸 메시지함
	@Override
	public List<MessageVo> send_MessageList(String user_id) {
		List<MessageVo> list = messageDao.send_MessageList(user_id);
		return list;
	}

}

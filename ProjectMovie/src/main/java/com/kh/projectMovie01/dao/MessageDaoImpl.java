package com.kh.projectMovie01.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.MessageVo;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	private static final String NAMESPACE ="com.kh.projectMovie01.message.";

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MessageVo> receive_MessageList(String user_id)  {
		List<MessageVo> list = sqlSession.selectList(NAMESPACE + "receive_MessageList" , user_id);
		return list;
	}

	// ���� �޽�����
	@Override
	public List<MessageVo> send_MessageList(String user_id)  {
		List<MessageVo> list = sqlSession.selectList(NAMESPACE + "send_MessageList" , user_id);
		return list;
	}
	@Override
	public MessageVo readMessage(int msg_no) {
		MessageVo messageVo = sqlSession.selectOne(NAMESPACE+"readMessage",msg_no);
		return messageVo;
	}
	@Override
	public void insertMessage(MessageVo messageVo) {
		sqlSession.insert(NAMESPACE + "insertMessage", messageVo);
	}
}

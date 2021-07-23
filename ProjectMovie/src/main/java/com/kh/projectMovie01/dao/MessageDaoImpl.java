package com.kh.projectMovie01.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@Override
	public boolean deleteMessage(int msg_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("msg_no", msg_no);
		map.put("user_id", user_id);
		int count = sqlSession.delete(
				NAMESPACE + "deleteMessage", map);
		if (count > 0) {
			return true;
		}
		return false;
	}

}

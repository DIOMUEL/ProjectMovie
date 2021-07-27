package com.kh.projectMovie01.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.NoticeMessageVo;

@Repository
public class NoticeMessageDaoImple implements NoticeMessageDao {

	private static final String NAMESPACE = "com.kh.projectMovie01.noticeMessage."; 
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertMessage(NoticeMessageVo noticeMessageVo) {
		sqlSession.insert(NAMESPACE + "insertMessage", noticeMessageVo);

	}

	@Override
	public List<NoticeMessageVo> messageListNotRead(String msg_receiver) {
		List<NoticeMessageVo> list = sqlSession.selectList(NAMESPACE + "messageListNotRead", msg_receiver);
		return list;
	}

	@Override
	public List<NoticeMessageVo> messageListReceive(String msg_receiver) {
		List<NoticeMessageVo> list = sqlSession.selectList(NAMESPACE + "messageListReceive", msg_receiver);
		return list;
	}

	@Override
	public List<NoticeMessageVo> messageListSend(String msg_sender) {
		List<NoticeMessageVo> list = sqlSession.selectList(NAMESPACE + "messageListSend", msg_sender);
		return list;
	}

	@Override
	public int notReadCount(String msg_receiver) {
		int count = sqlSession.selectOne(NAMESPACE + "notReadCount", msg_receiver);
		return count;
	}

	@Override
	public NoticeMessageVo messageRead(int msg_no) {
		NoticeMessageVo noticeMessageVo = sqlSession.selectOne(NAMESPACE + "messageRead", msg_no);
		return noticeMessageVo;
	}

	@Override
	public void updateOpenDate(int msg_no) {
		sqlSession.update(NAMESPACE + "updateOpenDate", msg_no);
		
	}

	@Override
	public Timestamp getOpendate(int msg_no) {
		Timestamp msg_opendate = sqlSession.selectOne(NAMESPACE + "getOpendate", msg_no);
		return msg_opendate;
	}

	@Override
	public boolean deleteMessage(int msg_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("msg_no", msg_no);
		map.put("user_id", user_id);
		int count = sqlSession.delete(NAMESPACE + "deleteMessage", map);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<NoticeMessageVo> messageListSelf(String msg_sender, String msg_receiver) {
		Map<String, String> map = new HashMap<>();
		map.put("msg_sender", msg_sender);
		map.put("msg_receiver", msg_receiver);
		List<NoticeMessageVo> list = sqlSession.selectList(NAMESPACE + "messageListSelf", map );
		return list;
	}

	

}

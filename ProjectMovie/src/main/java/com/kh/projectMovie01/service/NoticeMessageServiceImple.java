package com.kh.projectMovie01.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.NoticeMessageDao;
import com.kh.projectMovie01.vo.NoticeMessageVo;

@Service
public class NoticeMessageServiceImple implements NoticeMessageService {

	@Inject
	private NoticeMessageDao noticeMessageDao;
	
	@Override
	public void sendMessage(NoticeMessageVo noticeMessageVo) {
		noticeMessageDao.insertMessage(noticeMessageVo);

	}

	@Override
	public List<NoticeMessageVo> messageListNotRead(String msg_receiver) {
		List<NoticeMessageVo> list = noticeMessageDao.messageListNotRead(msg_receiver);
		return list;
	}

	@Override
	public List<NoticeMessageVo> messageListReceive(String msg_receiver) {
		List<NoticeMessageVo> list = noticeMessageDao.messageListReceive(msg_receiver);
		return list;
	}

	@Override
	public int notReadCount(String msg_receiver) {
		return noticeMessageDao.notReadCount(msg_receiver);
		
	}

	@Override
	public NoticeMessageVo messageRead(int msg_no) {
		NoticeMessageVo noticeMessageVo = noticeMessageDao.messageRead(msg_no);
		Timestamp msg_opendate = noticeMessageVo.getMsg_opendate();
		// 읽지 않은 메시지를 읽은 경우에 할 작업
		if (msg_opendate == null) {
			noticeMessageDao.updateOpenDate(msg_no);
//			memberDao.updatePoint(
//					user_id, PointDao.READ_MESSAGE_POINT);
//			PointVo pointVo = new PointVo(user_id, 
//					PointDao.READ_MESSAGE_CODE, 
//					PointDao.READ_MESSAGE_POINT);
//			pointDao.insertPoint(pointVo);
			msg_opendate = noticeMessageDao.getOpendate(msg_no);
			noticeMessageVo.setMsg_opendate(msg_opendate);
		}
		return noticeMessageVo;
	}

	@Override
	public boolean deleteMessage(int msg_no, String user_id) {
		boolean result = noticeMessageDao.deleteMessage(msg_no, user_id);
		return result;
	}

}

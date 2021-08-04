package com.kh.projectMovie01.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.NoticeMessageDao;
import com.kh.projectMovie01.vo.Admin_PageingDto;
import com.kh.projectMovie01.vo.NoticeMessageVo;
import com.kh.projectMovie01.vo.PagingDto;

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
	public List<NoticeMessageVo> messageListSend(String msg_sender) {
		List<NoticeMessageVo> list = noticeMessageDao.messageListSend(msg_sender);
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

	@Override
	public List<NoticeMessageVo> messageListSelf(String msg_sender, String msg_receiver) {
		List<NoticeMessageVo> list = noticeMessageDao.messageListSelf(msg_sender, msg_receiver);
		return list;
	}
	
	
	//관리자 쪽지함
	@Override
	public List<NoticeMessageVo> messageListReceiveAll(String msg_receiver, Admin_PageingDto admin_PageingDto) {
		List<NoticeMessageVo> list = noticeMessageDao.messageListReceiveAll(msg_receiver, admin_PageingDto);
		return list;
	}

	@Override
	public List<NoticeMessageVo> messageListSendAll(String msg_sender, Admin_PageingDto admin_PageingDto) {
		List<NoticeMessageVo> list = noticeMessageDao.messageListSendAll(msg_sender, admin_PageingDto);
		return list;
	}

	@Override
	public List<NoticeMessageVo> messageListSelfAll(String msg_sender, String msg_receiver, Admin_PageingDto admin_PageingDto) {
		List<NoticeMessageVo> list = noticeMessageDao.messageListSelfAll(msg_sender, msg_receiver, admin_PageingDto);
		return list;
	}

	@Override
	public int getCountReceive(String msg_receiver) {
		int count = noticeMessageDao.getCountReceive(msg_receiver);
		return count;
	}

	@Override
	public int getCountSend(String msg_sender) {
		int count = noticeMessageDao.getCountSend(msg_sender);
		return count;
	}

	@Override
	public int getCountSelf(String msg_receiver) {
		int count = noticeMessageDao.getCountSelf(msg_receiver);
		return count;
	}

	

}

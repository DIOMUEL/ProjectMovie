package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.NoticeMessageVo;

public interface NoticeMessageService {
	
	public void sendMessage(NoticeMessageVo noticeMessageVo);
	public List<NoticeMessageVo> messageListNotRead(String msg_receiver);
	public List<NoticeMessageVo> messageListReceive(String msg_receiver);
	public List<NoticeMessageVo> messageListSend(String msg_sender);
	public List<NoticeMessageVo> messageListSelf(String msg_sender, String msg_receiver);
	public int notReadCount(String msg_receiver);
	public NoticeMessageVo messageRead(int msg_no);
	public boolean deleteMessage(int msg_no, String user_id);
	
}

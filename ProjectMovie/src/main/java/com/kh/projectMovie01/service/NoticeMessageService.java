package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.Admin_PageingDto;
import com.kh.projectMovie01.vo.NoticeMessageVo;
import com.kh.projectMovie01.vo.PagingDto;

public interface NoticeMessageService {
	
	public void sendMessage(NoticeMessageVo noticeMessageVo);
	public List<NoticeMessageVo> messageListNotRead(String msg_receiver);
	public List<NoticeMessageVo> messageListReceive(String msg_receiver);
	public List<NoticeMessageVo> messageListSend(String msg_sender);
	public List<NoticeMessageVo> messageListSelf(String msg_sender, String msg_receiver);
	public int notReadCount(String msg_receiver);
	public NoticeMessageVo messageRead(int msg_no);
	public boolean deleteMessage(int msg_no, String user_id);
	
	//관리자 페이지 쪽지함
	public int getCountReceive(String msg_receiver);
	public int getCountSend(String msg_sender);
	public int getCountSelf(String msg_receiver);
	public List<NoticeMessageVo> messageListReceiveAll(String msg_receiver, Admin_PageingDto admin_PageingDto);
	public List<NoticeMessageVo> messageListSendAll(String msg_sender ,  Admin_PageingDto admin_PageingDto);
	public List<NoticeMessageVo> messageListSelfAll(String msg_sender, String msg_receiver,  Admin_PageingDto admin_PageingDto);
}

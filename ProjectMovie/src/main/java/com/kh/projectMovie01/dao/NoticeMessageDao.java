package com.kh.projectMovie01.dao;



import java.sql.Timestamp;
import java.util.List;

import com.kh.projectMovie01.vo.NoticeMessageVo;

public interface NoticeMessageDao {

	
	public void insertMessage(NoticeMessageVo noticeMessageVo);
	public List<NoticeMessageVo> messageListNotRead(String msg_receiver);
	public List<NoticeMessageVo> messageListReceive(String msg_receiver);
	public int notReadCount(String msg_receiver);
	public NoticeMessageVo messageRead(int msg_no);
	public void updateOpenDate(int msg_no);
	public Timestamp getOpendate(int msg_no);
	public boolean deleteMessage(int msg_no, String user_id);
}

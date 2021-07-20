package com.kh.projectMovie01.vo;

import java.sql.Timestamp;

public class MessageVo {
	private int msg_no;
	private String msg_content;
	private String msg_sender;
	private String msg_receiver;
	private Timestamp msg_senddate;
	private Timestamp msg_opendate;
	
	
	public int getMsg_no() {
		return msg_no;
	}

	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public String getMsg_sender() {
		return msg_sender;
	}

	public void setMsg_sender(String msg_sender) {
		this.msg_sender = msg_sender;
	}

	public String getMsg_receiver() {
		return msg_receiver;
	}

	public void setMsg_receiver(String msg_receiver) {
		this.msg_receiver = msg_receiver;
	}

	public Timestamp getMsg_senddate() {
		return msg_senddate;
	}

	public void setMsg_senddate(Timestamp msg_senddate) {
		this.msg_senddate = msg_senddate;
	}

	public Timestamp getMsg_opendate() {
		return msg_opendate;
	}

	public void setMsg_opendate(Timestamp msg_opendate) {
		this.msg_opendate = msg_opendate;
	}

	public MessageVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MessageVo(int msg_no, String msg_content, String msg_sender, String msg_receiver, Timestamp msg_senddate,
			Timestamp msg_opendate) {
		super();
		this.msg_no = msg_no;
		this.msg_content = msg_content;
		this.msg_sender = msg_sender;
		this.msg_receiver = msg_receiver;
		this.msg_senddate = msg_senddate;
		this.msg_opendate = msg_opendate;
	}

	@Override
	public String toString() {
		return "MessageVo [msg_no=" + msg_no + ", msg_content=" + msg_content + ", msg_sender=" + msg_sender
				+ ", msg_receiver=" + msg_receiver + ", msg_senddate=" + msg_senddate + ", msg_opendate=" + msg_opendate
				+ "]";
	}

}

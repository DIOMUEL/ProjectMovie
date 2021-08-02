package com.kh.projectMovie01.vo;

public class EmailDto {
	private String from = "rlaqjaals0213@gmail.com";
	private String to;
	private String subject = "ooo영화관 인증 코드입니다.";
	private String content;

	
	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "EmailDto [from=" + from + ", to=" + to + ", subject=" + subject + ", content=" + content + "]";
	}

}


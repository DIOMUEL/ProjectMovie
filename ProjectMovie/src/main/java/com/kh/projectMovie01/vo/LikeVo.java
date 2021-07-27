package com.kh.projectMovie01.vo;

public class LikeVo {
	private String user_id;
	private int b_no;

	public LikeVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LikeVo(String user_id, int b_no) {
		super();
		this.user_id = user_id;
		this.b_no = b_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	@Override
	public String toString() {
		return "LikeVo [user_id=" + user_id + ", b_no=" + b_no + "]";
	}


}

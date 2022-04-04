package com.conn.test;

public class MemberVO {
	private int num;
	private String name;
	private String birthday;
	
	public MemberVO() {
		this.name = "이름이 없습니다.";
		this.birthday = "생일이 등록되지 않았습니다.";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	
}

package com.sist.vo;
import java.util.*;

public class Board_ReplyVO {
	private int no; // ��ȣ
	private String id; // �ۼ��� ���̵�
	private int bno; // �Խñ� ��ȣ
	private String content; // ��� ����
	private Date regdate; // �����
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}

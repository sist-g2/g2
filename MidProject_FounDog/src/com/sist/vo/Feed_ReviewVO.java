package com.sist.vo;
import java.util.*;

public class Feed_ReviewVO {
	private int no;
	private Date regdate;
	private String rdateS;
	private String subject;
	private String content;
	private int star;
	private String id;
	private int fnum;
	private String dtype;
	private FeedVO fvo;
	private MemberVO mvo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getRdateS() {
		return rdateS;
	}
	public void setRdateS(String rdateS) {
		this.rdateS = rdateS;
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
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
	public String getDtype() {
		return dtype;
	}
	public void setDtype(String dtype) {
		this.dtype = dtype;
	}
	public FeedVO getFvo() {
		return fvo;
	}
	public void setFvo(FeedVO fvo) {
		this.fvo = fvo;
	}
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}

}

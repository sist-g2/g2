package com.sist.vo;
import java.util.*;

public class FavoriteVO {
	private int no;
	private Date fdate;
	private String id;
	private int fnum;
	private FeedVO fvo;
	private MemberVO mvo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getFdate() {
		return fdate;
	}
	public void setFdate(Date fdate) {
		this.fdate = fdate;
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

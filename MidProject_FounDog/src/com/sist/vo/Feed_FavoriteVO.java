package com.sist.vo;
import java.util.*;

public class Feed_FavoriteVO {
	private int no;
	private Date fdate;
	private String fdateS;
	private String id;
	private int fnum;
	private int fnum_lowPrice;
	public int getFnum_lowPrice() {
		return fnum_lowPrice;
	}
	public void setFnum_lowPrice(int fnum_lowPrice) {
		this.fnum_lowPrice = fnum_lowPrice;
	}
	private FeedVO fvo = new FeedVO();
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
	public String getFdateS() {
		return fdateS;
	}
	public void setFdateS(String fdateS) {
		this.fdateS = fdateS;
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

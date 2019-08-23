package com.sist.vo;

public class StoreVO {
	private int no;
	private String stName;
	private String link;
	private int price;
	private int fnum;
	private FeedVO fvo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	
}

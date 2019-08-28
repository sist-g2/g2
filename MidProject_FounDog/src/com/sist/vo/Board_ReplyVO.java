package com.sist.vo;
import java.util.*;

public class Board_ReplyVO {
	private int no; // 글번호, primary key, seq 이용
	private String id; // 작성자 아이디 - foreign key member
	private int bno;
	private String content; // 글 내용
	private Date regdate; // 작성일
	private String dbday; // 작성일 yyyy년 mm월 dd일
	private int group_id; // 글 그룹 번호(NVL(MAX)) 이용 예정
	private int group_step; // 글 그룹 내 정렬 순서
	private int group_tab; // 글 작성 시 제목 앞 공백
	private int root; // 원글 번호
	private int depth; // 답글의 갯수
	
	private BoardVO bvo = new BoardVO();
	private MemberVO mvo = new MemberVO();
	
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
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getGroup_step() {
		return group_step;
	}
	public void setGroup_step(int group_step) {
		this.group_step = group_step;
	}
	public int getGroup_tab() {
		return group_tab;
	}
	public void setGroup_tab(int group_tab) {
		this.group_tab = group_tab;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public BoardVO getBvo() {
		return bvo;
	}
	public void setBvo(BoardVO bvo) {
		this.bvo = bvo;
	}
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	
}

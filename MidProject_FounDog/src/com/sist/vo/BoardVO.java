package com.sist.vo;
import java.util.*;

public class BoardVO {
	private int no; // 번호
	private int category; // 카테고리
	private String id; // 작성자 아이디
	private String subject; // 제목
	private String content; // 내용
	private Date regdate; // 등록일
	private String dbday;
	private int hit; // 조회수
	private int group_id; // 답변 ID
	private int group_step;// 답변 정렬순서(출력)
	private int group_tab;// 답글 제목 여백 
	private int root;// 상위 댓글 ==> 삭제
	private int depth; // 댓글 갯수 ==> 삭제 
	
    private Board_ReplyVO rvo=new Board_ReplyVO();
    
	public Board_ReplyVO getRvo() {
		return rvo;
	}
	public void setRvo(Board_ReplyVO rvo) {
		this.rvo = rvo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}

}

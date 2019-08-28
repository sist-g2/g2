package com.sist.vo;
import java.util.*;

public class BoardVO {
	private int no; // �۹�ȣ, primary key, seq �̿�
	private int category; // ī�װ� - foreign key board_cate
	private String id; // �ۼ��� ���̵� - foreign key member
	private String subject; // ������
	private String content; // �� ����
	private Date regdate; // �ۼ���
	private String dbday; // �ۼ��� yyyy�� mm�� dd��
	private int hit; // ��ȸ��
	private int group_id; // �� �׷� ��ȣ(NVL(MAX)) �̿� ����
	private int group_step; // �� �׷� �� ���� ����
	private int group_tab; // �� �ۼ� �� ���� �� ����
	private int root; // ���� ��ȣ
	private int depth; // ����� ����
	
	private Board_cateVO cvo = new Board_cateVO();
	private MemberVO mvo = new MemberVO();
	
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
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
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
	public Board_cateVO getCvo() {
		return cvo;
	}
	public void setCvo(Board_cateVO cvo) {
		this.cvo = cvo;
	}
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}

}

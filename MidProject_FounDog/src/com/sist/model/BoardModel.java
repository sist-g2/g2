package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;
import com.sist.vo.Board_ReplyVO;

@Controller("boardModel")
public class BoardModel {
	
  @RequestMapping("board/board_list.do")	
  public String board_list(Model model)
  {
	  HttpSession session = model.getRequest().getSession(); // ����
	  
	  // page�� �޴´� 
	  String page=model.getRequest().getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  
	  // Map�� ���� 
	  Map map=new HashMap();
	  
	  int rowSize=10;
	  int start=(curpage*rowSize)-(rowSize-1);
	  // 1~10 , 11~20 , 21....
	  int end=curpage*rowSize;
	  
	  map.put("start", start);
	  map.put("end", end);
	  map.put("category", 0); // �����Խ��� ī�װ� : 0
	  
	  List<BoardVO> list=BoardDAO.boardListData(map);
	  
	  // ��� ���� 
	  model.addAttribute("list", list);
	  
	  // ���� ������ => curpage
	  // ��������  => totalpage
	  int totalpage = BoardDAO.boardTotalPage(0);
	  int count=BoardDAO.boardRowCount(0); // 22
	  count=count-((curpage*rowSize)-rowSize); 
	
	  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	  model.addAttribute("today", today);
	  model.addAttribute("curpage", curpage);
	  model.addAttribute("totalpage", totalpage);
	  model.addAttribute("count", count);
	  model.addAttribute("main_jsp", "../board/board_list.jsp");// main.jsp (include)
	  return "../main/main.jsp";
  }
 
  // ������ �߰�
  // ȭ�� 
  
  @RequestMapping("board/board_insert.do")
  public String board_insert(Model model)
  {
	  model.addAttribute("main_jsp", "../board/board_insert.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("board/board_insert_ok.do")
  public String board_insert_ok(Model model)
  {
	  try
	  {
		  model.getRequest().setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  
	  HttpSession session = model.getRequest().getSession();
	  String id = (String)session.getAttribute("id");
	  String subject=model.getRequest().getParameter("subject");
	  String content=model.getRequest().getParameter("content");
	  
	  BoardVO vo=new BoardVO();

	  vo.setCategory(0);
	  vo.setId(id);
	  vo.setSubject(subject);
	  vo.setContent(content);
	  
	  // DAO�� ���� 
	  BoardDAO.boardInsert(vo);
	  
	  return "redirect:../board/board_list.do";
  }
  
  // �󼼺��� 
  @RequestMapping("board/board_detail.do")
  public String board_detail(Model model)
  {
	  // ��û�� �ޱ�
	  String no=model.getRequest().getParameter("no");
	  // DAO���� => �����
	  BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no), 0);
	  // 0: �󼼺��⿡�� ������ ��� boardDetailData - hit ���� O
	  // JSP�� ���� 
	  model.addAttribute("vo", vo);
	  // list  ��� ��� 
	  /*List<BoardVO> list = BoardDAO.replyListData(Integer.parseInt(no));
	  int count=BoardDAO.replyListCount(Integer.parseInt(no));
	  model.addAttribute("list", list);
	  model.addAttribute("count", count);*/
	  model.addAttribute("main_jsp", "../board/board_detail.jsp");
	  return "../main/main.jsp";
  }
  
  // �����ϱ�
  @RequestMapping("board/board_update.do")
  public String board_update(Model model)
  {
	  // ��û���� �޴´�
	  String no=model.getRequest().getParameter("no");
	  // DAO => ����� �ޱ� 
	  BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no), 1);
	  // 1: �����ϱ⿡�� ������ ��� boardDetailData - hit ���� X
	  // ����� => JSP�� ����
	  model.addAttribute("vo", vo);
	  model.addAttribute("main_jsp", "../board/board_update.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("board/board_update_ok.do")
  public String board_update_ok(Model model)
  {
	  try
	  {
		  model.getRequest().setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  
	  String no=model.getRequest().getParameter("no");
	  String subject=model.getRequest().getParameter("subject");
	  String content=model.getRequest().getParameter("content");
	  
	  BoardVO vo=new BoardVO();
	  vo.setNo(Integer.parseInt(no));
	  vo.setSubject(subject);
	  vo.setContent(content);
	  
	  // DAO ���� ==> password
	  BoardDAO.boardUpdate(vo);
	  
	  return "redirect:../board/board_detail.do?no="+no;
  }
  
  @RequestMapping("board/reply_insert.do")
  public String reply_insert(Model model)
  {
	  // ��û���� �޴´� 
	  try
	  {
		  model.getRequest().setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  
	  String bno=model.getRequest().getParameter("bno");
	  String content=model.getRequest().getParameter("content");
	  
	  HttpSession session=model.getRequest().getSession();
	  String id=(String)session.getAttribute("id");
	  
	  Board_ReplyVO vo=new Board_ReplyVO();
	  vo.setBno(Integer.parseInt(bno));
	  vo.setContent(content);
	  vo.setId(id);
	  // DAO=>������ �߰� 
	  
	  BoardDAO.replyInsert(vo);
	  // �����(X)
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  @RequestMapping("board/reply_reinsert.do")
  public String reply_reinsert(Model model)
  {
	  try
	  {
		  model.getRequest().setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  
	  // msg
	  String content=model.getRequest().getParameter("content");
	  // no
	  String pno=model.getRequest().getParameter("no");
	  // bno
	  String bno=model.getRequest().getParameter("bno");

	  // id , name
	  HttpSession session=model.getRequest().getSession();
	  String id=(String)session.getAttribute("id");
	  String name=(String)session.getAttribute("name");
	  
	  Board_ReplyVO vo=new Board_ReplyVO();
	  BoardVO rvo=new BoardVO();
	  vo.setBno(Integer.parseInt(bno));
	  vo.setContent(content);
	  vo.setId(id);
	  
	  BoardDAO.replyReInsert(Integer.parseInt(pno),vo, rvo);
	  // group_id , group_step , group_tab
	  
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  @RequestMapping("board/reply_update.do")
  public String reply_update(Model model)
  {
	  try
	  {
		  model.getRequest().setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  
	  // content
	  String content=model.getRequest().getParameter("content");
	  // no
	  String no=model.getRequest().getParameter("no");
	  // bno
	  String bno=model.getRequest().getParameter("bno");
	  
	  Board_ReplyVO vo=new Board_ReplyVO();
	  // DAOó�� 
	  vo.setContent(content);
	  vo.setNo(Integer.parseInt(no));
	  
	  BoardDAO.replyUpdate(vo);
	  
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  @RequestMapping("board/reply_delete.do")
  public String reply_delete(Model model)
  {
	  String no=model.getRequest().getParameter("no");
	  // bno
	  String bno=model.getRequest().getParameter("bno");
	  // DAO
	  BoardDAO.replyDelete(Integer.parseInt(no));
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  @RequestMapping("board/board_delete.do")
  public String board_delete(Model model){
	  String no=model.getRequest().getParameter("no");
	  model.addAttribute("no", no);
	  model.addAttribute("main_jsp", "../board/board_delete.jsp");
	  return "../main/main.jsp";
	  // ����â���� �̵�
  }
  
  @RequestMapping("board/board_delete_ok.do")
  public String board_delete_ok(Model model){
	  String no=model.getRequest().getParameter("no");
	  // bno
	  String pwd=model.getRequest().getParameter("pwd");
	  int res=BoardDAO.freeboardDelete(Integer.parseInt(no), pwd);
	  model.addAttribute("res", res);
	  return "../board/board_delete_ok.jsp";
  }
}













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
	  // page를 받는다 
	  String page=model.getRequest().getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  // Map에 저장 
	  Map map=new HashMap();
	  int rowSize=10;
	  int start=(curpage*rowSize)-(rowSize-1);
	  // 1~10 , 11~20 , 21....
	  int end=curpage*rowSize;
	  
	  map.put("start", start);
	  map.put("end", end);
	  
	  List<BoardVO> list=BoardDAO.boardListData(map);
	  
	  // 목록 전송 
	  model.addAttribute("list", list);
	  
	  // 현재 페이지 => curpage
	  // 총페이지  => totalpage
	  int totalpage=BoardDAO.boardTotalPage();
	  int count=BoardDAO.boardRowCount();// 22
	  count=count-((curpage*rowSize)-rowSize); 
	
	  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	  model.addAttribute("today", today);
	  model.addAttribute("curpage", curpage);
	  model.addAttribute("totalpage", totalpage);
	  model.addAttribute("count", count);
	  model.addAttribute("main_jsp", "../board/board_list.jsp");// main.jsp (include)
	  return "../main/main.jsp";
  }
 
  // 데이터 추가
  // 화면 
  
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
	  // String id=model.getRequest().getParameter("id");
	  String subject=model.getRequest().getParameter("subject");
	  String content=model.getRequest().getParameter("content");
	  
	  BoardVO vo=new BoardVO();

	  vo.setId(id);
	  vo.setCategory(0);
	  vo.setSubject(subject);
	  vo.setContent(content);
	  
	  // DAO로 전송 
	  BoardDAO.boardInsert(vo);
	  
	  return "redirect:../board/board_list.do";
  }
  
  // 상세보기 
  @RequestMapping("board/board_detail.do")
  public String board_detail(Model model)
  {
	  // 요청값 받기
	  String no=model.getRequest().getParameter("no");
	  // DAO연결 => 결과값
	  BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no),"detail");
	  // JSP에 전송 
	  model.addAttribute("vo", vo);
	  // list  댓글 목록 
	  List<BoardVO> list = BoardDAO.replyListData(Integer.parseInt(no));
	  int count=BoardDAO.replyListCount(Integer.parseInt(no));
	  model.addAttribute("list", list);
	  model.addAttribute("count", count);
	  model.addAttribute("main_jsp", "../board/board_detail.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("board/board_update.do")
  public String board_update(Model model)
  {
	  // 요청값을 받는다
	  String no=model.getRequest().getParameter("no");
	  // DAO => 결과값 받기 
	  BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no), "update");
	  // 결과값 => JSP로 전송
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
	  
	  String id=model.getRequest().getParameter("id");
	  String subject=model.getRequest().getParameter("subject");
	  String content=model.getRequest().getParameter("content");
	  String no=model.getRequest().getParameter("no");
	  
	  BoardVO vo=new BoardVO();
	  vo.setId(id);
	  vo.setSubject(subject);
	  vo.setContent(content);
	  vo.setNo(Integer.parseInt(no));
	  
	  // DAO 연결 ==> password
	  int n=BoardDAO.boardUpdate(vo);
	  
	  model.addAttribute("no", n);
	  
	  return "../board/board_update_ok.jsp";
  }
  
  @RequestMapping("board/reply_insert.do")
  public String reply_insert(Model model)
  {
	  // 요청값을 받는다 
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
	  // DAO=>데이터 추가 
	  
	  BoardDAO.replyInsert(vo);
	  // 결과값(X)
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
	  // DAO처리 
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
	  // 삭제창으로 이동
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













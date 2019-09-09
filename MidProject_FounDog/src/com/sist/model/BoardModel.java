package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
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
  public String board_list(Model model){
	  HttpSession session = model.getRequest().getSession(); // 세션
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
	  map.put("category", 0); // 자유게시판 카테고리 : 0
	  
	  List<BoardVO> list=BoardDAO.boardListData(map);
	  
	  // 목록 전송 
	  model.addAttribute("list", list);
	  
	  // 현재 페이지 => curpage
	  // 총페이지  => totalpage
	  int totalpage = BoardDAO.boardTotalPage(0);
	  int count=BoardDAO.boardRowCount(0); // 22
	  int BLOCK=5;
	  
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  int allPage=totalpage;
	  
	  if(endPage>allPage){
		  endPage=allPage;
	  }
	  count=count-((curpage*rowSize)-rowSize); 
	
	  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	  model.addAttribute("today", today);
	  model.addAttribute("curpage", curpage);
	  model.addAttribute("totalpage", totalpage);
	  model.addAttribute("BLOCK", BLOCK);
	  model.addAttribute("startPage", startPage);
	  model.addAttribute("endPage", endPage);
	  model.addAttribute("allPage", allPage);
	  model.addAttribute("count", count);
	  model.addAttribute("main_jsp", "../board/board_list.jsp");// main.jsp (include)
	  return "../main/main.jsp";
  }
  
  @RequestMapping("board/board_find.do")
  public String board_find(Model model){
	
			try{
				model.getRequest().setCharacterEncoding("UTF-8");
			}catch(Exception ex){}
			
	  // page를 받는다 
	  String page=model.getRequest().getParameter("page");
      String fs=model.getRequest().getParameter("fs");
	  String ss=model.getRequest().getParameter("ss");
	  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	  
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
	  map.put("fs", fs);
	  map.put("ss", ss);
	  map.put("category", 0); // 자유게시판 카테고리 : 0
	  
	  List<BoardVO> list=BoardDAO.boardFindData(map);
	  
	  // 목록 전송 
	  model.addAttribute("list", list);
	  
	  // 현재 페이지 => curpage
	  // 총페이지  => totalpage
	  int totalpage = BoardDAO.boardFindTotalPage(map);
	  System.out.println("총페이지 : " + totalpage);
	  int count=BoardDAO.boardFindRowCount(map); // 22
	  int BLOCK=5;
	  
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  int allPage=totalpage;
	  
	  if(endPage>allPage){
		  endPage=allPage;
	  }
	  count=count-((curpage*rowSize)-rowSize); 
	
		model.getRequest().setAttribute("list", list);
		model.getRequest().setAttribute("count", list.size());
		model.addAttribute("fs", fs);
		model.addAttribute("ss", ss);
		model.addAttribute("today", today);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("count", count);
		model.addAttribute("main_jsp", "../board/board_find.jsp");
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
	  String subject=model.getRequest().getParameter("subject");
	  String content=model.getRequest().getParameter("content");
	  
	  BoardVO vo=new BoardVO();

	  vo.setCategory(0);
	  vo.setId(id);
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
	  BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no), 0);
	  // 0: 상세보기에서 접근할 경우 boardDetailData - hit 증가 O
	  // JSP에 전송 
	  model.addAttribute("vo", vo);
	  // list  댓글 목록 
	  List<Board_ReplyVO> list = BoardDAO.boardreplyListData(Integer.parseInt(no));
	  int count=BoardDAO.boardreplyListCount(Integer.parseInt(no));
	  model.addAttribute("list", list);
	  model.addAttribute("count", count);
	  model.addAttribute("main_jsp", "../board/board_detail.jsp");
	  return "../main/main.jsp";
  }
  
  // 수정하기
  @RequestMapping("board/board_update.do")
  public String board_update(Model model)
  {
	  // 요청값을 받는다
	  String no=model.getRequest().getParameter("no");
	  // DAO => 결과값 받기 
	  BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no), 1);
	  // 1: 수정하기에서 접근할 경우 boardDetailData - hit 증가 X
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
	  
	  String no=model.getRequest().getParameter("no");
	  String subject=model.getRequest().getParameter("subject");
	  String content=model.getRequest().getParameter("content");
	  
	  BoardVO vo=new BoardVO();
	  vo.setNo(Integer.parseInt(no));
	  vo.setSubject(subject);
	  vo.setContent(content);
	  
	  // DAO 연결 ==> password
	  BoardDAO.boardUpdate(vo);
	  
	  return "redirect:../board/board_detail.do?no="+no;
  }
  //댓글 추가
  @RequestMapping("board/boardreply_Insert.do")
  public String boardreply_Insert(Model model)
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
	  
	  BoardDAO.boardreplyInsert(vo);
	  // 결과값(X)
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  @RequestMapping("board/boardreply_ReInsert.do")
  public String boardreply_ReInsert(Model model)
  {
	  try
	  {
		  model.getRequest().setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  
	  // content
	  String content=model.getRequest().getParameter("content");
	  // no
	  String pno=model.getRequest().getParameter("no");
	  // bno
	  String bno=model.getRequest().getParameter("bno");

	  // id
	  HttpSession session=model.getRequest().getSession();
	  String id=(String)session.getAttribute("id");

	  Board_ReplyVO vo=new Board_ReplyVO();
	  vo.setBno(Integer.parseInt(bno));
	  vo.setContent(content);
	  vo.setId(id);
	  
	  BoardDAO.boardreplyReInsert(Integer.parseInt(pno),vo);
	  // group_id , group_step , group_tab
	  
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  @RequestMapping("board/boardreply_Update.do")
  public String boardreply_Update(Model model)
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
	  
	  BoardDAO.boardreplyUpdate(vo);
	  
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  @RequestMapping("board/boardreply_Delete.do")
  public String boardreply_Delete(Model model)
  {
	  String no=model.getRequest().getParameter("no");
	  // bno
	  String bno=model.getRequest().getParameter("bno");
	  // DAO
	  BoardDAO.boardreplyDelete(Integer.parseInt(no));
	  return "redirect:../board/board_detail.do?no="+bno;
  }
  
  @RequestMapping("board/board_delete.do")
  public String board_Delete(Model model){
	  String no=model.getRequest().getParameter("no");
	  model.addAttribute("no", no);
	  model.addAttribute("main_jsp", "../board/board_delete.jsp");
	  return "../main/main.jsp";
	  // 삭제창으로 이동
  }
  
  @RequestMapping("board/board_delete_ok.do")
  public String board_delete_ok(Model model){
	  String no=model.getRequest().getParameter("no");
	  BoardDAO.rboardreplyDelete(Integer.parseInt(no));
	  // model.addAttribute("res", res);
	  return "redirect:../board/board_list.do";
  }

  //답글 추가
  @RequestMapping("board/rboard_reply.do")
  public String rboard_reply(Model model){
	  String no=model.getRequest().getParameter("no");
	  model.addAttribute("no", no);
	  model.addAttribute("main_jsp", "../board/rboard_reply.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("board/rboardreply_ReInsert.do")
  public String rboardreply_ReInsert(Model model)
  {
	  try
	  {
		  model.getRequest().setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  
	  // content
	  String content=model.getRequest().getParameter("content");
	  // no
	  String pno=model.getRequest().getParameter("no");
	  // subject
	  String subject=model.getRequest().getParameter("subject");
	  // id
	  HttpSession session=model.getRequest().getSession();
	  String id=(String)session.getAttribute("id");

	  BoardVO vo=new BoardVO();
	  vo.setContent(content);
	  vo.setId(id);
	  vo.setSubject(subject);
	  vo.setCategory(0);
	  
	  BoardDAO.rboardreplyReInsert(Integer.parseInt(pno),vo);
	  // group_id , group_step , group_tab
	  
	  return "redirect:../board/board_list.do";
  }
  
  @RequestMapping("board/rboardreply_Update.do")
  public String rboardreply_Update(Model model)
  {
	  try
	  {
		  model.getRequest().setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  
	  // content
	  String content=model.getRequest().getParameter("content");
	  // no
	  String no=model.getRequest().getParameter("no");
	  // subject
	  String subject=model.getRequest().getParameter("subject");
	  
	  BoardVO vo=new BoardVO();
	  // DAO처리 
	  vo.setContent(content);
	  vo.setNo(Integer.parseInt(no));
	  vo.setSubject(subject);

	  BoardDAO.rboardreplyUpdate(vo);
	  
	  return "redirect:../board/board_list.do?no="+no;
  }
 
  @RequestMapping("board/rboardreply_Delete.do")
  public String rboardreply_Delete(Model model)
  {
	  String no=model.getRequest().getParameter("no");
	  // DAO
	  BoardDAO.boardreplyDelete(Integer.parseInt(no));
	  return "redirect:../board/board_detail.do?no="+no;
  }
  
  @RequestMapping("board/rboard_delete.do")
  public String rboard_Delete(Model model){
	  String no=model.getRequest().getParameter("no");
	  model.addAttribute("no", no);
	  model.addAttribute("main_jsp", "../board/board_delete.jsp");
	  return "../main/main.jsp";
	  // 삭제창으로 이동
  }
  
  @RequestMapping("board/rboard_delete_ok.do")
  public String rboard_delete_ok(Model model){
	  String no=model.getRequest().getParameter("no");
	  BoardDAO.rboardreplyDelete(Integer.parseInt(no));
	  // model.addAttribute("res", res);
	  return "redirect:../board/board_list.do";
  }
 
}
package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.BoardVO;
import com.sist.vo.Board_ReplyVO;

@Controller("QnaModel")
public class QnaModel {
	
  @RequestMapping("qnaboard/qna_board_list.do")	
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
	  map.put("category", 1); // Q&A게시판 카테고리 : 0
	  
	  List<BoardVO> list=QnaDAO.boardListData(map);
	  
	  // 목록 전송 
	  model.addAttribute("list", list);
	  
	  // 현재 페이지 => curpage
	  // 총페이지  => totalpage
	  int totalpage = QnaDAO.boardTotalPage(1);
	  int count=QnaDAO.boardRowCount(1); // 22
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
	  model.addAttribute("main_jsp", "../qnaboard/qna_board_list.jsp");// main.jsp (include)
	  return "../main/main.jsp";
  }
  
  @RequestMapping("qnaboard/qna_board_find.do")
  public String board_find(Model model){

		try{
			model.getRequest().setCharacterEncoding("UTF-8");
		}catch(Exception ex){}
		
		String page=model.getRequest().getParameter("page");
		String fs=model.getRequest().getParameter("fs");
		String ss=model.getRequest().getParameter("ss");
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		if(page==null)
			  page="1";
		int curpage=Integer.parseInt(page);
		//WHERE ${fs} LIKE '%'||#{ss}||'%'
		Map map = new HashMap();
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		// 1~10 , 11~20 , 21....
		int end=curpage*rowSize;
		
		map.put("start", start);
		map.put("end", end);
		map.put("fs", fs);
		map.put("ss", ss);
		map.put("category", 1);
		
		List<BoardVO> list = QnaDAO.boardFindData(map);
		// 목록 전송 
		model.addAttribute("list", list);

		// 현재 페이지 => curpage
		// 총페이지  => totalpage
		int totalpage = BoardDAO.boardTotalPage(1);
		int count=BoardDAO.boardRowCount(1); // 22
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
		model.addAttribute("today", today);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("count", count);
		model.addAttribute("main_jsp", "../qnaboard/qna_board_find.jsp");
		return "../main/main.jsp";
	}
  // 데이터 추가
  // 화면 
  
  @RequestMapping("qnaboard/qna_board_insert.do")
  public String board_insert(Model model)
  {
	  model.addAttribute("main_jsp", "../qnaboard/qna_board_insert.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("qnaboard/qna_board_insert_ok.do")
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

	  vo.setCategory(1);
	  vo.setId(id);
	  vo.setSubject(subject);
	  vo.setContent(content);
	  
	  // DAO로 전송 
	  QnaDAO.boardInsert(vo);
	  
	  return "redirect:../qnaboard/qna_board_list.do";
  }
  
  // 상세보기 
  @RequestMapping("qnaboard/qna_board_detail.do")
  public String board_detail(Model model)
  {
	  // 요청값 받기
	  String no=model.getRequest().getParameter("no");
	  // DAO연결 => 결과값
	  BoardVO vo=QnaDAO.boardDetailData(Integer.parseInt(no), 0);
	  // 0: 상세보기에서 접근할 경우 boardDetailData - hit 증가 O
	  // JSP에 전송 
	  model.addAttribute("vo", vo);
	  // list  댓글 목록 
	  List<Board_ReplyVO> list = QnaDAO.boardreplyListData(Integer.parseInt(no));
	  int count=QnaDAO.boardreplyListCount(Integer.parseInt(no));
	  model.addAttribute("list", list);
	  model.addAttribute("count", count);
	  model.addAttribute("main_jsp", "../qnaboard/qna_board_detail.jsp");
	  return "../main/main.jsp";
  }
  
  // 수정하기
  @RequestMapping("qnaboard/qna_board_update.do")
  public String board_update(Model model)
  {
	  // 요청값을 받는다
	  String no=model.getRequest().getParameter("no");
	  // DAO => 결과값 받기 
	  BoardVO vo=QnaDAO.boardDetailData(Integer.parseInt(no), 1);
	  // 1: 수정하기에서 접근할 경우 boardDetailData - hit 증가 X
	  // 결과값 => JSP로 전송
	  model.addAttribute("vo", vo);
	  model.addAttribute("main_jsp", "../qnaboard/qna_board_update.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("qnaboard/qna_board_update_ok.do")
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
	  QnaDAO.boardUpdate(vo);
	  
	  return "redirect:../qnaboard/qna_board_detail.do?no="+no;
  }
  //댓글 추가
  @RequestMapping("qnaboard/qna_boardreply_Insert.do")
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
	  
	  QnaDAO.boardreplyInsert(vo);
	  // 결과값(X)
	  return "redirect:../qnaboard/qna_board_detail.do?no="+bno;
  }
  
  @RequestMapping("qnaboard/qna_boardreply_ReInsert.do")
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
	  
	  QnaDAO.boardreplyReInsert(Integer.parseInt(pno),vo);
	  // group_id , group_step , group_tab
	  
	  return "redirect:../qnaboard/qna_board_detail.do?no="+bno;
  }
  
  @RequestMapping("qboard/qboardreply_Delete.do")
  public String qboardreply_Delete(Model model)
  {
	  String no=model.getRequest().getParameter("no");
	  // bno
	  String bno=model.getRequest().getParameter("bno");
	  // DAO
	  QnaDAO.boardreplyDelete(Integer.parseInt(no));
	  return "redirect:../qnaboard/qna_board_detail.do?no="+bno;
  }
  
  @RequestMapping("qnaboard/qna_boardreply_Update.do")
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
	  
	  QnaDAO.boardreplyUpdate(vo);
	  
	  return "redirect:../qnaboard/qna_board_detail.do?no="+bno;
  }
  
  @RequestMapping("qnaboard/qna_boardreply_Delete.do")
  public String boardreply_Delete(Model model)
  {
	  String no=model.getRequest().getParameter("no");
	  // bno
	  String bno=model.getRequest().getParameter("bno");
	  // DAO
	  QnaDAO.boardreplyDelete(Integer.parseInt(no));
	  return "redirect:../qnaboard/qna_board_detail.do?no="+bno;
  }
  
  @RequestMapping("qnaboard/qna_board_delete.do")
  public String board_Delete(Model model){
	  String no=model.getRequest().getParameter("no");
	  model.addAttribute("no", no);
	  model.addAttribute("main_jsp", "../qnaboard/qna_board_delete.jsp");
	  return "../main/main.jsp";
	  // 삭제창으로 이동
  }
  
  @RequestMapping("qnaboard/qna_board_delete_ok.do")
  public String board_delete_ok(Model model){
	  String no=model.getRequest().getParameter("no");
	  QnaDAO.rboardreplyDelete(Integer.parseInt(no));
	  // model.addAttribute("res", res);
	  return "redirect:../qnaboard/qna_board_list.do";
  }

  //답글 추가
  @RequestMapping("qnaboard/qna_rboard_reply.do")
  public String rboard_reply(Model model){
	  String no=model.getRequest().getParameter("no");
	  model.addAttribute("no", no);
	  model.addAttribute("main_jsp", "../qnaboard/qna_rboard_reply.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("qnaboard/qna_rboardreply_ReInsert.do")
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
	  vo.setCategory(1);
	  
	  QnaDAO.rboardreplyReInsert(Integer.parseInt(pno),vo);
	  // group_id , group_step , group_tab
	  
	  return "redirect:../qnaboard/qna_board_list.do";
  }
  
  @RequestMapping("qnaboard/qna_rboardreply_Update.do")
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

	  QnaDAO.rboardreplyUpdate(vo);
	  
	  return "redirect:../qnaboard/qna_board_list.do?no="+no;
  }
 
  @RequestMapping("qnaboard/qna_rboardreply_Delete.do")
  public String rboardreply_Delete(Model model)
  {
	  String no=model.getRequest().getParameter("no");
	  // DAO
	  QnaDAO.boardreplyDelete(Integer.parseInt(no));
	  return "redirect:../qnaboard/qna_board_detail.do?no="+no;
  }
  
  @RequestMapping("qnaboard/qna_rboard_delete.do")
  public String rboard_Delete(Model model){
	  String no=model.getRequest().getParameter("no");
	  model.addAttribute("no", no);
	  model.addAttribute("main_jsp", "../qnaboard/qna_board_delete.jsp");
	  return "../main/main.jsp";
	  // 삭제창으로 이동
  }
  
  @RequestMapping("qnaboard/qna_rboard_delete_ok.do")
  public String rboard_delete_ok(Model model){
	  String no=model.getRequest().getParameter("no");
	  QnaDAO.rboardreplyDelete(Integer.parseInt(no));
	  // model.addAttribute("res", res);
	  return "redirect:../qnaboard/qna_board_list.do";
  }
 
}
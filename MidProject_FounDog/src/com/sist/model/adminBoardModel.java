package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.AdminBoardDAO;
import com.sist.vo.AdminBoardVO;
@Controller("boardModel")
public class adminBoardModel {
  @RequestMapping("adminboard/adminboard_list.do")	
  public String adminboard_list(Model model)
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
	  
	  List<AdminBoardVO> list=AdminBoardDAO.adminboardListData(map);
	  
	  // 목록 전송 
	  model.addAttribute("list", list);
	  
	  // 현재 페이지 => curpage
	  // 총페이지  => totalpage
	  int totalpage=AdminBoardDAO.adminboardTotalPage();
	  int count=AdminBoardDAO.adminboardRowCount();// 22
	  count=count-((curpage*rowSize)-rowSize); 
	  // int c=count-((curpage*rowSize)-rowSize); 
	  /*
	   *    22 => 
	   *    
	   *    1 page => 22 21 .... 13
	   *    2 page => 12 11 .... 3
	   *    3 page => 2 1
	   */
	  // 블록   => 5
	  // 블록 시작  => fromPage  1~5 => 1 
	  // 블록 끝  => toPage     1~5 => 5
	  // JSP로 값을 전송 
	  /*
	   *   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	   *   Date date=new Date();
	   *   String today=sdf.format(date);
	   *   
	   *   sdf.format(date)
	   */
	  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	  model.addAttribute("today", today);
	  model.addAttribute("curpage", curpage);
	  model.addAttribute("totalpage", totalpage);
	  model.addAttribute("count", count);
	  model.addAttribute("main_jsp", "../adminboard/adminboard_list.jsp");// main.jsp (include)
	  return "../main/main.jsp";
  }
  /*
   *     1. 화면 이동
   *        sendRedirect() => request를 무시하고 이동 (request초기화) : 순수하게 이동 
   *                          _ok
   *        forward()  => request를 포함 (request가 초기화 되지 않는다) : 화면에 데이터를 출력할 목적
   *     2. 포함 
   *         => 전체 메인화면 => 부분적으로 화면 출력 => include (request를 공유)
   */
  // 데이터 추가
  // 화면 
  @RequestMapping("adminboard/adminboard_insert.do")
  public String adminboard_insert(Model model)
  {
	  model.addAttribute("main_jsp", "../adminboard/adminboard_insert.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("adminboard/adminboard_insert_ok.do")
  public String adminboard_insert_ok(Model model)
  {
	  try
	  {
		  model.getRequest().setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  
	  String name=model.getRequest().getParameter("name");
	  String subject=model.getRequest().getParameter("subject");
	  String content=model.getRequest().getParameter("content");
	  
	  AdminBoardVO vo=new AdminBoardVO();
	  /*
	   *   new FreeBoardVO().setName(name);
	   *   new FreeBoardVO().setSubject(name);
	   *   new FreeBoardVO().setContent(name);
	   *   new FreeBoardVO().setPwd(name);
	   *   
	   *   insert(new FreeBoardVO())
	   */
	  vo.setName(name);
	  vo.setSubject(subject);
	  vo.setContent(content);
	  
	  // DAO로 전송 
	  AdminBoardDAO.adminboardInsert(vo);
	  
	  return "redirect:../adminboard/adminboard_list.do";
  }
  
  // 상세보기 
  @RequestMapping("adminboard/adminboard_detail.do")
  public String adminboard_detail(Model model)
  {
	  // 요청값 받기
	  String no=model.getRequest().getParameter("no");
	  // DAO연결 => 결과값
	  AdminBoardVO vo=AdminBoardDAO.adminboardDetailData(Integer.parseInt(no),"detail");
	  // JSP에 전송 
	  model.addAttribute("vo", vo);
	  // list  댓글 목록 
	  model.addAttribute("main_jsp", "../adminboard/adminboard_detail.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("adminboard/adminboard_update.do")
  public String adminboard_update(Model model)
  {
	  // 요청값을 받는다
	  String no=model.getRequest().getParameter("no");
	  // DAO => 결과값 받기 
	  AdminBoardVO vo=AdminBoardDAO.adminboardDetailData(Integer.parseInt(no), "update");
	  // 결과값 => JSP로 전송
	  model.addAttribute("vo", vo);
	  model.addAttribute("main_jsp", "../adminboard/adminboard_update.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("adminboard/adminboard_update_ok.do")
  public String adminboard_update_ok(Model model)
  {
	  try
	  {
		  model.getRequest().setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  
	  String name=model.getRequest().getParameter("name");
	  String subject=model.getRequest().getParameter("subject");
	  String content=model.getRequest().getParameter("content");
	  String pwd=model.getRequest().getParameter("pwd");
	  String no=model.getRequest().getParameter("no");
	  
	  AdminBoardVO vo=new AdminBoardVO();
	  vo.setName(name);
	  vo.setSubject(subject);
	  vo.setContent(content);
	  vo.setNo(Integer.parseInt(no));
	  
	  // DAO 연결 ==> password
	  int n=AdminBoardDAO.adminboardUpdate(vo);
	  
	  model.addAttribute("no", n);
	  
	  return "../adminboard/adminboard_update_ok.jsp";
  }
  
  @RequestMapping("adminboard/adminboard_delete.do")
  public String adminboard_delete(Model model)
  {
	  String no=model.getRequest().getParameter("no");
	  model.addAttribute("no", no);
	  model.addAttribute("main_jsp", "../adminboard/adminboard_delete.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("adminboard/adminboard_delete_ok.do")
  public String adminboard_delete_ok(Model model)
  {
	  String no=model.getRequest().getParameter("no");
	  int res=AdminBoardDAO.adminboardDelete(Integer.parseInt(no));
	  model.addAttribute("res", res);
	  return "../adminboard/adminboard_delete_ok.jsp";
  }
  
  
}













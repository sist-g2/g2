package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.AdminBoardDAO;
import com.sist.dao.BoardDAO;
import com.sist.vo.AdminBoardVO;
import com.sist.vo.BoardVO;
@Controller("boardModel")
public class adminBoardModel {
  @RequestMapping("adminboard/adminboard_list.do")	
  public String adminboard_list(Model model)
  {
	  // page�� �޴´� 
	  String page=model.getRequest().getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  // Map?? ???? 
	  Map map=new HashMap();
	  int rowSize=10;
	  int start=(curpage*rowSize)-(rowSize-1);
	  // 1~10 , 11~20 , 21....
	  int end=curpage*rowSize;
	  
	  map.put("start", start);
	  map.put("end", end);
	  
	  List<AdminBoardVO> list=AdminBoardDAO.adminboardListData(map);
	  
	  // ��� ���� 
	  model.addAttribute("list", list);
	  
	  // ���� ������ => curpage
	  // ��������  => totalpage
	  int totalpage=AdminBoardDAO.adminboardTotalPage();
	  int count=AdminBoardDAO.adminboardRowCount();// 22
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
	  model.addAttribute("main_jsp", "../adminboard/adminboard_list.jsp");// main.jsp (include)
	  return "../main/main.jsp";
  }
  /*
   *     1. ȭ�� �̵�
   *        sendRedirect() => request�� �����ϰ� �̵� (request�ʱ�ȭ) : �����ϰ� �̵� 
   *                          _ok
   *        forward()  => request�� ���� (request�� �ʱ�ȭ ���� �ʴ´�) : ȭ�鿡 �����͸� ����� ����
   *     2. ���� 
   *         => ��ü ����ȭ�� => �κ������� ȭ�� ��� => include (request�� ����)
   */
  // ������ �߰�
  // ȭ�� 
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
	  
	  // DAO�� ���� 
	  AdminBoardDAO.adminboardInsert(vo);
	  
	  return "redirect:../adminboard/adminboard_list.do";
  }
  
  // �󼼺��� 
  @RequestMapping("adminboard/adminboard_detail.do")
  public String adminboard_detail(Model model)
  {
	  // ��û�� �ޱ�
	  String no=model.getRequest().getParameter("no");
	  // DAO���� => �����
	  AdminBoardVO vo=AdminBoardDAO.adminboardDetailData(Integer.parseInt(no),"detail");
	  // JSP�� ���� 
	  model.addAttribute("vo", vo);
	  // list  ��� ��� 
	  model.addAttribute("main_jsp", "../adminboard/adminboard_detail.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("adminboard/adminboard_update.do")
  public String adminboard_update(Model model)
  {
	  // ��û���� �޴´�
	  String no=model.getRequest().getParameter("no");
	  // DAO => ����� �ޱ� 
	  AdminBoardVO vo=AdminBoardDAO.adminboardDetailData(Integer.parseInt(no), "update");
	  // ����� => JSP�� ����
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
	  
	  // DAO ���� ==> password
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
  @RequestMapping("adminboard/Calc.do")
  public String Calc(Model model)
  {
	  model.addAttribute("main_jsp", "../adminboard/Calc.jsp");
	  return "../main/main.jsp";
  }

  @RequestMapping("adminboard/adminboard_find.do")
  public String adminboard_find(Model model){

		try{
			model.getRequest().setCharacterEncoding("UTF-8");
		}catch(Exception ex){}
		
		
		String fs=model.getRequest().getParameter("fs");
		String ss=model.getRequest().getParameter("ss");
		//WHERE ${fs} LIKE '%'||#{ss}||'%'
		Map map = new HashMap();
		map.put("fs", fs);
		map.put("ss", ss);
		map.put("category", 0);
		List<AdminBoardVO> list = AdminBoardDAO.adminboardFindData(map);
		
		model.getRequest().setAttribute("list", list);
		model.getRequest().setAttribute("count", list.size());
		
		model.addAttribute("main_jsp", "../adminboard/adminboard_find.jsp");
		return "../main/main.jsp";
	}
}













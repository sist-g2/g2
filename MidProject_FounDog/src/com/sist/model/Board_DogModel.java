package com.sist.model;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.Board_DogDAO;
import com.sist.vo.Board_DogVO;


@Controller("board_dogModel")
public class Board_DogModel {
		
	  @RequestMapping("dogboard/dogboard_list.do")	
	  public String boarddog_list(Model model){
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
		  
		  List<Board_DogVO> list=Board_DogDAO.boarddogListData(map);
		  
		  // 목록 전송 
		  model.addAttribute("list", list);
		  
		  // 현재 페이지 => curpage
		  // 총페이지  => totalpage
		  int totalpage = Board_DogDAO.boarddogTotalPage(0);
		  int count=Board_DogDAO.boarddogRowCount(0); // 22
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
		  model.addAttribute("main_jsp", "../dogboard/dogboard_list.jsp");// main.jsp (include)
		  return "../main/main.jsp";
	  }
	  
	  @RequestMapping("dogboard/dogboard_find.do")
	  public String boarddog_find(Model model){

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
			List<Board_DogVO> list = Board_DogDAO.boarddogFindData(map);
			
			model.getRequest().setAttribute("list", list);
			model.getRequest().setAttribute("count", list.size());
			
			model.addAttribute("main_jsp", "../dogboard/dogboard_find.jsp");
			return "../main/main.jsp";
		}
	  // 데이터 추가
	  // 화면 
	  
	  @RequestMapping("dogboard/dogboard_insert.do")
	  public String boarddog_insert(Model model)
	  {
		  model.addAttribute("main_jsp", "../dogboard/dogboard_insert.jsp");
		  return "../main/main.jsp";
	  }
	  
	  @RequestMapping("dogboard/dogboard_insert_ok.do")
	  public String boarddog_insert_ok(Model model)
	  {
		  Board_DogVO vo=new Board_DogVO();
		  try
		  {
			  model.getRequest().setCharacterEncoding("UTF-8");
			  HttpSession session = model.getRequest().getSession();
			  String path="C:\\midProject\\g2\\MidProject_FounDog\\WebContent\\dogboard\\upload";
			  String enctype="UTF-8";
			  int size=100*1024*1024;
			  MultipartRequest mr =new MultipartRequest(model.getRequest(), path,size,enctype,
					  new DefaultFileRenamePolicy());
			  String id = (String)session.getAttribute("id");
			  String area=model.getRequest().getParameter("area");
			  String dtype=model.getRequest().getParameter("dtype");
			  String dsex =model.getRequest().getParameter("dsex");
			  String dkg = (String)model.getRequest().getParameter("dkg");
			  String dcolor =model.getRequest().getParameter("dcolor");
			  String dcharacter =model.getRequest().getParameter("dcharacter");
			  String tel =model.getRequest().getParameter("tel");
			  
			  vo.setId(id);
			  vo.setArea(area);
			  vo.setDtype(dtype);
			  vo.setDsex(dsex);
			  vo.setDkg(Integer.parseInt(dkg));
			  vo.setDcolor(dcolor);
			  vo.setDcharacter(dcharacter);
			  vo.setTel(tel);
			  
			  String filename = mr.getOriginalFileName("upload");
				if(filename==null){
					vo.setFilename("");
					vo.setFilesize(0);
				}
				else{
					File file = new File(path+"\\"+filename);
					vo.setFilename(filename);
					vo.setFilesize((int)file.length());
					System.out.println("file:"+file);
				}
		  }catch(Exception ex){}  
		 
		  // DAO로 전송 
		  Board_DogDAO.boarddogInsert(vo);
		  
		  return "redirect:../dogboard/dogboard_list.do";
	  }
	  
	  // 상세보기 
	  @RequestMapping("dogboard/dogboard_detail.do")
	  public String boarddog_detail(Model model)
	  {
		  // 요청값 받기
		  String no=model.getRequest().getParameter("no");
		  // DAO연결 => 결과값
		  Board_DogVO vo=Board_DogDAO.boarddogDetailData(Integer.parseInt(no));
		  // 0: 상세보기에서 접근할 경우 boardDetailData - hit 증가 O
		  // JSP에 전송 
		  model.addAttribute("vo", vo);
		  model.addAttribute("main_jsp", "../dogboard/dogboard_detail.jsp");
		  return "../main/main.jsp";
	  }
	  
	  // 수정하기
	  @RequestMapping("dogboard/dogboard_update.do")
	  public String boarddog_update(Model model)
	  {
		  // 요청값을 받는다
		  String no=model.getRequest().getParameter("no");
		  // DAO => 결과값 받기 
		  Board_DogVO vo=Board_DogDAO.boarddogDetailData(Integer.parseInt(no));
		  // 1: 수정하기에서 접근할 경우 boardDetailData - hit 증가 X
		  // 결과값 => JSP로 전송
		  model.addAttribute("vo", vo);
		  model.addAttribute("main_jsp", "../dogboard/dogboard_update.jsp");
		  return "../main/main.jsp";
	  }
	  
	  @RequestMapping("dogboard/dogboard_update_ok.do")
	  public String boarddog_update_ok(Model model)
	  {
		  try
		  {
			  model.getRequest().setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  
		  String no=model.getRequest().getParameter("no");
		  String area=model.getRequest().getParameter("area");
		  String dtype=model.getRequest().getParameter("dtype");
		  String dsex =model.getRequest().getParameter("dsex");
		  String dkg = (String)model.getRequest().getParameter("dkg");
		  String dcolor =model.getRequest().getParameter("dcolor");
		  String dcharacter =model.getRequest().getParameter("dcharacter");
		  String tel =model.getRequest().getParameter("tel");
		  
		  Board_DogVO vo=new Board_DogVO();
		  vo.setNo(Integer.parseInt(no));
		  vo.setArea(area);
		  vo.setDtype(dtype);
		  vo.setDsex(dsex);
		  vo.setDkg(Integer.parseInt(dkg));
		  vo.setDcolor(dcolor);
		  vo.setDcharacter(dcharacter);
		  vo.setTel(tel);
		  
		  // DAO 연결 ==> password
		  Board_DogDAO.boarddogUpdate(vo);
		  
		  return "redirect:../dogboard/dogboard_detail.do?no="+no;
	  }
	  
	  
	  @RequestMapping("dogboard/dogboard_delete.do")
	  public String boarddog_Delete(Model model){
		  String no=model.getRequest().getParameter("no");
		  model.addAttribute("no", no);
		  model.addAttribute("main_jsp", "../dogboard/dogboard_delete.jsp");
		  return "../main/main.jsp";
		  // 삭제창으로 이동
	  }
	  
	  @RequestMapping("dogboard/dogboard_delete_ok.do")
	  public String boarddog_delete_ok(Model model){
		  String no=model.getRequest().getParameter("no");
		  // model.addAttribute("res", res);
		  return "redirect:../dogboard/dogboard_list.do";
	  }

	 
}

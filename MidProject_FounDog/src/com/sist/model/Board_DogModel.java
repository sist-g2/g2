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
import com.sist.dao.AdminBoardDAO;
import com.sist.dao.Board_DogDAO;
import com.sist.vo.Board_DogVO;


@Controller("board_dogModel")
public class Board_DogModel {
		
	  @RequestMapping("dogboard/dogboard_list.do")	
	  public String boarddog_list(Model model){
		  HttpSession session = model.getRequest().getSession(); // 占쏙옙占쏙옙
		  // page占쏙옙 占쌨는댐옙 
		  String page=model.getRequest().getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  
		  // Map占쏙옙 占쏙옙占쏙옙 
		  Map map=new HashMap();
		  int rowSize=8;
		  int start=(curpage*rowSize)-(rowSize-1);
		  // 1~10 , 11~20 , 21....
		  int end=curpage*rowSize;
		  
		  map.put("start", start);
		  map.put("end", end);
		  
		  List<Board_DogVO> list=Board_DogDAO.boarddogListData(map);
		  
		  // 占쏙옙占� 占쏙옙占쏙옙 
		  model.addAttribute("list", list);
		  
		  // 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 => curpage
		  // 占쏙옙占쏙옙占쏙옙占쏙옙  => totalpage
		  int totalpage = Board_DogDAO.boarddogTotalPage();
		  int count=Board_DogDAO.boarddogRowCount(); // 22
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
			String category = model.getRequest().getParameter("category");
			//WHERE ${fs} LIKE '%'||#{ss}||'%'
			Map map = new HashMap();
			map.put("fs", fs);
			map.put("ss", ss);

			List<Board_DogVO> list = Board_DogDAO.boarddogFindData(map);
			
			model.getRequest().setAttribute("list", list);
			model.getRequest().setAttribute("count", list.size());
			
			model.addAttribute("main_jsp", "../dogboard/dogboard_find.jsp");
			return "../main/main.jsp";
		}
	  @RequestMapping("dogboard/dogboard_report.do")
	  public String boarddog_Report(Model model){
		  
		  try{
			  model.getRequest().setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  
		  HttpSession session = model.getRequest().getSession(); // 占쏙옙占쏙옙
		  // page占쏙옙 占쌨는댐옙 
		  String page=model.getRequest().getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  
		  // Map占쏙옙 占쏙옙占쏙옙 
		  Map map=new HashMap();
		  int rowSize=8;
		  int start=(curpage*rowSize)-(rowSize-1);
		  // 1~10 , 11~20 , 21....
		  int end=curpage*rowSize;
		  
		  map.put("start", start);
		  map.put("end", end);
		  map.put("category", 0); // 占쏙옙占쏙옙占쌉쏙옙占쏙옙 카占쌓곤옙 : 0
		  
	  
		  // 占쏙옙占� 占쏙옙占쏙옙 

		  
		  int totalpage = Board_DogDAO.boarddogTotalPage();
		  int count=Board_DogDAO.boarddogRowCount(); // 22
		  int BLOCK=5;
		  
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  int allPage=totalpage;
		  
		  if(endPage>allPage){
			  endPage=allPage;
		  }
		  count=count-((curpage*rowSize)-rowSize); 

		  List<Board_DogVO> list = Board_DogDAO.boarddogReportData(map);
		  model.addAttribute("list", list);
		  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		  model.addAttribute("today", today);
		  model.addAttribute("curpage", curpage);
		  model.addAttribute("totalpage", totalpage);
		  model.addAttribute("BLOCK", BLOCK);
		  model.addAttribute("startPage", startPage);
		  model.addAttribute("endPage", endPage);
		  model.addAttribute("allPage", allPage);
		  model.addAttribute("count", count);
		  model.addAttribute("main_jsp", "../dogboard/dogboard_report.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("dogboard/dogboard_look.do")
	  public String boarddog_look(Model model){
		  
		  try{
			  model.getRequest().setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  
		  HttpSession session = model.getRequest().getSession(); // 占쏙옙占쏙옙
		  // page占쏙옙 占쌨는댐옙 
		  String page=model.getRequest().getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  
		  // Map占쏙옙 占쏙옙占쏙옙 
		  Map map=new HashMap();
		  int rowSize=8;
		  int start=(curpage*rowSize)-(rowSize-1);
		  // 1~10 , 11~20 , 21....
		  int end=curpage*rowSize;
		  
		  map.put("start", start);
		  map.put("end", end);
		  map.put("category", 1); // 占쏙옙占쏙옙占쌉쏙옙占쏙옙 카占쌓곤옙 : 0
		  
	  
		  // 占쏙옙占� 占쏙옙占쏙옙 

		  
		  int totalpage = Board_DogDAO.boarddogTotalPage();
		  int count=Board_DogDAO.boarddogRowCount(); // 22
		  int BLOCK=5;
		  
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  int allPage=totalpage;
		  
		  if(endPage>allPage){
			  endPage=allPage;
		  }
		  count=count-((curpage*rowSize)-rowSize); 

		  List<Board_DogVO> list = Board_DogDAO.boarddogLookData(map);
		  model.addAttribute("list", list);
		  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		  model.addAttribute("today", today);
		  model.addAttribute("curpage", curpage);
		  model.addAttribute("totalpage", totalpage);
		  model.addAttribute("BLOCK", BLOCK);
		  model.addAttribute("startPage", startPage);
		  model.addAttribute("endPage", endPage);
		  model.addAttribute("allPage", allPage);
		  model.addAttribute("count", count);
		  model.addAttribute("main_jsp", "../dogboard/dogboard_look.jsp");
		  return "../main/main.jsp";
	  }
	  // 占쏙옙占쏙옙占쏙옙 占쌩곤옙
	  // 화占쏙옙 
	  
	  @RequestMapping("dogboard/dogboard_insert.do")
	  public String boarddog_insert(Model model)
	  {
		  model.addAttribute("main_jsp", "../dogboard/dogboard_insert.jsp");
		  return "../main/main.jsp";
	  }
	  
	  @RequestMapping("dogboard/dogboard_insert_ok.do")
	  public String boarddog_insert_ok(Model model)
	  {
		  try
		  {
			  Board_DogVO vo=new Board_DogVO();
			  model.getRequest().setCharacterEncoding("UTF-8");
			  HttpSession session = model.getRequest().getSession();
			  String path="C:\\midProject\\g2\\MidProject_FounDog\\WebContent\\dogboard\\upload";
			  String enctype="UTF-8";
			  int size=100*1024*1024;
			  MultipartRequest mr =new MultipartRequest(model.getRequest(), path,size,enctype,
					  new DefaultFileRenamePolicy());

			  String id = (String)session.getAttribute("id");
			  String area = mr.getParameter("area");
			  String dtype=mr.getParameter("dtype");
			  String dsex =mr.getParameter("dsex");
			  String dkg = mr.getParameter("dkg");
			  String dcolor =mr.getParameter("dcolor");
			  String dcharacter =mr.getParameter("dcharacter");
			  String tel =mr.getParameter("tel");
			  String dname = mr.getParameter("dname");
			  String dage = mr.getParameter("dage");
			  String category = mr.getParameter("category");
			  String lfdate = mr.getParameter("lfdate");
			  
			  vo.setId(id);
			  vo.setArea(area);
			  vo.setDtype(dtype);
			  vo.setDsex(dsex);
			  vo.setDkg(dkg);
			  vo.setDcolor(dcolor);
			  vo.setDcharacter(dcharacter);
			  vo.setTel(tel);
			  vo.setDname(dname);
			  vo.setDage(dage);
			  vo.setCategory(Integer.parseInt(category));
			  vo.setLfdate(lfdate);

			  Enumeration filename = mr.getFileNames();
			  String str = (String)filename.nextElement();
			  String files = mr.getFilesystemName(str);
				if(files==null){
					vo.setFilename("");
					vo.setFilesize(0);
				}
				else{
					File file = new File(path+"\\"+files);
					vo.setFilename(files);				
					vo.setFilesize((int)file.length());
					Board_DogDAO.boarddogInsert(vo);
				}
		  }catch(Exception ex){
			  ex.printStackTrace();
		  }    
		  
		  return "redirect:../dogboard/dogboard_list.do";
	  }
	  
	  // 占쏢세븝옙占쏙옙 
	  @RequestMapping("dogboard/dogboard_detail.do")
	  public String boarddog_detail(Model model)
	  {
		  // 占쏙옙청占쏙옙 占쌨깍옙
		  String no=model.getRequest().getParameter("no");
		  // DAO占쏙옙占쏙옙 => 占쏙옙占쏙옙占�
		  Board_DogVO vo=Board_DogDAO.boarddogDetailData(Integer.parseInt(no));
		  // 0: 占쏢세븝옙占썩에占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占� boardDetailData - hit 占쏙옙占쏙옙 O
		  // JSP占쏙옙 占쏙옙占쏙옙 
		  model.addAttribute("vo", vo);
		  model.addAttribute("main_jsp", "../dogboard/dogboard_detail.jsp");
		  return "../main/main.jsp";
	  }
	  
	  // 占쏙옙占쏙옙占싹깍옙
	  @RequestMapping("dogboard/dogboard_update.do")
	  public String boarddog_update(Model model)
	  {
		  // 占쏙옙청占쏙옙占쏙옙 占쌨는댐옙
		  String no=model.getRequest().getParameter("no");
		  // DAO => 占쏙옙占쏙옙占� 占쌨깍옙 
		  Board_DogVO vo=Board_DogDAO.boarddogDetailData(Integer.parseInt(no));
		  // 1: 占쏙옙占쏙옙占싹기에占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占� boardDetailData - hit 占쏙옙占쏙옙 X
		  // 占쏙옙占쏙옙占� => JSP占쏙옙 占쏙옙占쏙옙
		  model.addAttribute("vo", vo);
		  model.addAttribute("main_jsp", "../dogboard/dogboard_update.jsp");
		  return "../main/main.jsp";
	  }
	  
	  @RequestMapping("dogboard/dogboard_update_ok.do")
	  public String boarddog_update_ok(Model model)
	  {
		  String no ="";
		  try
		  {
			  Board_DogVO vo=new Board_DogVO();
			  model.getRequest().setCharacterEncoding("UTF-8");
			  HttpSession session = model.getRequest().getSession();
			  String path="C:\\midProject\\g2\\MidProject_FounDog\\WebContent\\dogboard\\upload";
			  String enctype="UTF-8";
			  int size=100*1024*1024;
			  MultipartRequest mr =new MultipartRequest(model.getRequest(), path,size,enctype,
					  new DefaultFileRenamePolicy());
			  
			  no=mr.getParameter("no");
			  String id = (String)session.getAttribute("id");
			  String area = mr.getParameter("area");
			  String dtype=mr.getParameter("dtype");
			  String dsex =mr.getParameter("dsex");
			  String dkg = mr.getParameter("dkg");
			  String dcolor =mr.getParameter("dcolor");
			  String dcharacter =mr.getParameter("dcharacter");
			  String tel =mr.getParameter("tel");
			  String dname = mr.getParameter("dname");
			  String dage = mr.getParameter("dage");
			  
			  vo.setNo(Integer.parseInt(no));
			  vo.setId(id);
			  vo.setArea(area);
			  vo.setDtype(dtype);
			  vo.setDsex(dsex);
			  vo.setDkg(dkg);
			  vo.setDcolor(dcolor);
			  vo.setDcharacter(dcharacter);
			  vo.setTel(tel);
			  vo.setDname(dname);
			  vo.setDage(dage);
			  

			  Enumeration filename = mr.getFileNames();
			  String str = (String)filename.nextElement();
			  String files = mr.getFilesystemName(str);
				if(files==null){
					vo.setFilename("");
					vo.setFilesize(0);
				}
				else{
					File file = new File(path+"\\"+files);
					vo.setFilename(files);				
					vo.setFilesize((int)file.length());
					Board_DogDAO.boarddogUpdate(vo);
				}
		  }catch(Exception ex){	  }
		  
/*		  String no=model.getRequest().getParameter("no");
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
		  
		  // DAO 占쏙옙占쏙옙 ==> password
		  Board_DogDAO.boarddogUpdate(vo);*/
		  return "redirect:../dogboard/dogboard_detail.do?no="+no;
	  }
	  
	  
	  @RequestMapping("dogboard/dogboard_delete.do")
	  public String boarddog_Delete(Model model){
		  String no=model.getRequest().getParameter("no");
		  model.addAttribute("no", no);
		  model.addAttribute("main_jsp", "../dogboard/dogboard_delete.jsp");
		  return "../main/main.jsp";
		  // 占쏙옙占쏙옙창占쏙옙占쏙옙 占싱듸옙
	  }
	  
	  @RequestMapping("dogboard/dogboard_delete_ok.do")
	  public String boarddog_delete_ok(Model model){
		  String no=model.getRequest().getParameter("no");
		  int res=Board_DogDAO.boarddogDelete(Integer.parseInt(no));
		  model.addAttribute("res", res);
		  return "redirect:../dogboard/dogboard_list.do";
	  }

	 
}

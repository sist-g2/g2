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
		  HttpSession session = model.getRequest().getSession(); // ����
		  // page�� �޴´� 
		  String page=model.getRequest().getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  
		  // Map�� ���� 
		  Map map=new HashMap();
		  int rowSize=8;
		  int start=(curpage*rowSize)-(rowSize-1);
		  // 1~10 , 11~20 , 21....
		  int end=curpage*rowSize;
		  
		  map.put("start", start);
		  map.put("end", end);
		  map.put("category", 0); // �����Խ��� ī�װ� : 0
		  
		  List<Board_DogVO> list=Board_DogDAO.boarddogListData(map);
		  
		  // ��� ���� 
		  model.addAttribute("list", list);
		  
		  // ���� ������ => curpage
		  // ��������  => totalpage
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
	  // ������ �߰�
	  // ȭ�� 
	  
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
			  System.out.println("size = "+size );
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
			  
			  vo.setId(id);
			  vo.setArea(area);
			  vo.setDtype(dtype);
			  vo.setDsex(dsex);
			  vo.setDkg(Integer.parseInt(dkg));
			  vo.setDcolor(dcolor);
			  vo.setDcharacter(dcharacter);
			  vo.setTel(tel);
			  vo.setDname(dname);
			  vo.setDage(Integer.parseInt(dage));
			  
			  String filename = mr.getOriginalFileName("upload");
				if(filename==null){
					vo.setFilename("");
					vo.setFilesize(0);
				}
				else{
					File file = new File(path+"\\"+filename);
					vo.setFilename(filename);				
					vo.setFilesize((int)file.length());
					Board_DogDAO.boarddogInsert(vo);
				}
		  }catch(Exception ex){
			  ex.printStackTrace();
		  }    
		  
		  return "redirect:../dogboard/dogboard_list.do";
	  }
	  
	  // �󼼺��� 
	  @RequestMapping("dogboard/dogboard_detail.do")
	  public String boarddog_detail(Model model)
	  {
		  // ��û�� �ޱ�
		  String no=model.getRequest().getParameter("no");
		  // DAO���� => �����
		  Board_DogVO vo=Board_DogDAO.boarddogDetailData(Integer.parseInt(no));
		  // 0: �󼼺��⿡�� ������ ��� boardDetailData - hit ���� O
		  // JSP�� ���� 
		  model.addAttribute("vo", vo);
		  model.addAttribute("main_jsp", "../dogboard/dogboard_detail.jsp");
		  return "../main/main.jsp";
	  }
	  
	  // �����ϱ�
	  @RequestMapping("dogboard/dogboard_update.do")
	  public String boarddog_update(Model model)
	  {
		  // ��û���� �޴´�
		  String no=model.getRequest().getParameter("no");
		  // DAO => ����� �ޱ� 
		  Board_DogVO vo=Board_DogDAO.boarddogDetailData(Integer.parseInt(no));
		  // 1: �����ϱ⿡�� ������ ��� boardDetailData - hit ���� X
		  // ����� => JSP�� ����
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
			  vo.setDkg(Integer.parseInt(dkg));
			  vo.setDcolor(dcolor);
			  vo.setDcharacter(dcharacter);
			  vo.setTel(tel);
			  vo.setDname(dname);
			  vo.setDage(Integer.parseInt(dage));
			  

			  String filename = mr.getOriginalFileName("upload");
				if(filename==null){
					vo.setFilename("");
					vo.setFilesize(0);
				}
				else{
					System.out.println("요기");
					File file = new File(path+"\\"+filename);
					vo.setFilename(filename);				
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
		  
		  // DAO ���� ==> password
		  Board_DogDAO.boarddogUpdate(vo);*/
		  return "redirect:../dogboard/dogboard_detail.do?no="+no;
	  }
	  
	  
	  @RequestMapping("dogboard/dogboard_delete.do")
	  public String boarddog_Delete(Model model){
		  String no=model.getRequest().getParameter("no");
		  model.addAttribute("no", no);
		  model.addAttribute("main_jsp", "../dogboard/dogboard_delete.jsp");
		  return "../main/main.jsp";
		  // ����â���� �̵�
	  }
	  
	  @RequestMapping("dogboard/dogboard_delete_ok.do")
	  public String boarddog_delete_ok(Model model){
		  String no=model.getRequest().getParameter("no");
		  int res=Board_DogDAO.boarddogDelete(Integer.parseInt(no));
		  model.addAttribute("res", res);
		  return "redirect:../dogboard/dogboard_list.do";
	  }

	 
}

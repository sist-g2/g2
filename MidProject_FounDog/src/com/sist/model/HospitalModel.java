package com.sist.model;
import java.util.*;

import org.json.simple.JSONArray; 
import org.json.simple.JSONObject; 
import org.json.simple.parser.JSONParser; 
import org.json.simple.parser.ParseException;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.HospitalDAO;
import com.sist.vo.HospitalVO;

@Controller("hospitalModel")
public class HospitalModel {
	
	@RequestMapping("hospital/hospital_list.do")
	public String hospital_list(Model model){
		
		List<String> loc = HospitalDAO.hospitalGetLoc();

		model.addAttribute("loc", loc);
		
		model.addAttribute("main_jsp", "../hospital/hospital_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("main/hospital_search_ok.do")
	public String hospital_search_ok(Model model){
	// 요청값을 받는다
	try {
		model.getRequest().setCharacterEncoding("UTF-8");
	} catch (Exception e) {}
	
	String page=model.getRequest().getParameter("page");
	String loc = model.getRequest().getParameter("loc");
	String name = model.getRequest().getParameter("name");
	   if(page==null)
		   page="1";
	   // 현재 페이지 저장 
	   int curpage=Integer.parseInt(page);
	   Map map=new HashMap();
	   int rowSize=8;
	   int start=(curpage*rowSize)-(rowSize-1); // 1 , 9...
	   int end=(curpage*rowSize);
	   
	   map.put("loc", loc);
	   map.put("name", name);   
	   map.put("start", start);
	   map.put("end", end);
	  
	   List<HospitalVO> list=HospitalDAO.hospitalSearch(map);
	   
	   HashMap<String, Object> myHashMap1 = new HashMap<String, Object>();
       JSONObject jsonObject1 = new JSONObject(); // 중괄호에 들어갈 속성 정의 { "a" : "1", "b" : "2" }
       JSONArray jsonArray1 = new JSONArray(); // 대괄호 정의 [{ "a" : "1", "b" : "2" }]
       
       for(HospitalVO lis:list){
    	   
	       myHashMap1.put("no", lis.getNo());
	       myHashMap1.put("name", lis.getName());
	       myHashMap1.put("loc", lis.getLoc());
	       myHashMap1.put("tel", lis.getTel());
	       jsonObject1 = new JSONObject(myHashMap1); 
	       jsonArray1.add(jsonObject1);
       } 	   
	    
	model.addAttribute("jsonlist",jsonArray1 );	
	
	return "../hospital/hospital_search_ok.jsp";
	}
	
	@RequestMapping("hospital/hospital_result.do")
	public String hospital_result(Model model){
		
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String page=model.getRequest().getParameter("page");
		String loc = model.getRequest().getParameter("loc");
		String name = model.getRequest().getParameter("name");
		   if(page==null)
			   page="1";
		   // 현재 페이지 저장 
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=8;
		   int start=(curpage*rowSize)-(rowSize-1); // 1 , 9...
		   int end=(curpage*rowSize);
		   
		   map.put("loc", loc);
		   map.put("name", name);
		   int totalResult=HospitalDAO.hospitalTotalResult(map);
		   
		   map.put("start", start);
		   map.put("end", end);
		  
		   List<HospitalVO> list=HospitalDAO.hospitalSearch(map);
		
		int totalpage = (int)Math.ceil(totalResult/8.0);
		   
		   int BLOCK=5;
		   /*
		    *    이전 1 2 3 4 5 다음    ==> 현재페이지 ==> 1~5page  startPage(1) endPage(5)
		    *    이전 6 7 8 9 10 다음  ==> 현재페이지 ==> 6~10page startPage(6) endPage(10)
		    */
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   // 1~5 => (curpage-1)/BLOCK*BLOCK (0) ===> 1
		   // 6~10 => (curpage-1)/BLOCK*BLOCK (5) ==> 6   ==> 1~5  totalpage=4
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   int allPage=totalpage;
		   
		   if(endPage>allPage)
		   {
			   endPage=allPage;
		   }

		model.addAttribute("list", list);
		model.addAttribute("totalResult", totalResult);
		model.addAttribute("curpage", curpage);
	    model.addAttribute("totalpage", totalpage);
		   
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("allPage", allPage);
		
		return "../hospital/hospital_result.jsp";
	}
	
}

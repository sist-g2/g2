package com.sist.model;
import java.text.SimpleDateFormat;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray; 
import org.json.simple.JSONObject; 

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.HospitalDAO;
import com.sist.vo.DogVO;
import com.sist.vo.HospitalVO;

@Controller("hospitalModel")
public class HospitalModel {
	
	@RequestMapping("hospital/hospital_list.do")
	public String hospital_list(Model model){
		
		List<String> loc = HospitalDAO.hospitalGetLoc();
		
		 HttpSession session=model.getRequest().getSession();
		 String id=(String)session.getAttribute("id");

		model.addAttribute("id", id);
		model.addAttribute("loc", loc);
		model.addAttribute("main_jsp", "../hospital/hospital_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("hospital/hospital_search_ok.do")
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
	
	@RequestMapping("hospital/hospital_reserve.do")
	public String hospital_reserve(Model model){
		
		String no = model.getRequest().getParameter("no");
		String hosName = HospitalDAO.hospitalName(Integer.parseInt(no));
		
		HttpSession session=model.getRequest().getSession();
		String id=(String)session.getAttribute("id");
		
		String name = HospitalDAO.memberId(id);
		
		model.addAttribute("name", name);
		model.addAttribute("no", no);
		model.addAttribute("hosName", hosName);
		model.addAttribute("main_jsp", "../hospital/hospital_reserve.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("hospital/hospital_diary.do")
	   public String hospital_diary(Model model)
	   {
		
		   String strYear=model.getRequest().getParameter("year");
		   String strMonth=model.getRequest().getParameter("month");
		   
		   // 현재 날짜 읽기
		   Date date=new Date();
		   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");//07 08  MM=>1~9 => 01,09
		   // 자바는 숫자표현식 => 10,8(0),16(0x)
		   StringTokenizer st=new StringTokenizer(sdf.format(date),"-");
		   
		   String sy=st.nextToken();
		   String sm=st.nextToken();
		   String day1=st.nextToken();
		   
		   if(strYear==null)
		   {
			   strYear=sy;
		   }
		   if(strMonth==null)
		   {
			   strMonth=sm;
		   }
		   
		   int year=Integer.parseInt(strYear);
		   int month=Integer.parseInt(strMonth);
		   int day=Integer.parseInt(day1);
		   
		   model.addAttribute("year", year);
		   model.addAttribute("month", month);
		   model.addAttribute("day", day);
		   
		   String[] strWeek={"일","월","화","수","목","금","토"};
		   model.addAttribute("strWeek", strWeek);
		   
		   // 요일 구하기
		   int[] lastday={31,28,31,30,31,30,
				          31,31,30,31,30,31};
		   // 1년 1월 1일 ~ 2018년 12월 31의 총합
		   int total=(year-1)*365
				   +(year-1)/4
				   -(year-1)/100
				   +(year-1)/400;
		   //2019년 1월 ~ 7월의 총합
		   if((year%4==0 && year%100!=0)||(year%400==0))
			   lastday[1]=29;
		   else
			   lastday[1]=28;
		   
		   for(int i=0;i<month-1;i++){
			   total+=lastday[i];
		   }
		   
		   total++;
		   
		   // 요일구하기
		   int week=total%7;
		   
		   model.addAttribute("week", week);
		   model.addAttribute("lastday", lastday[month-1]);
		   
		   String no=model.getRequest().getParameter("no");
	
		   String hosDate = HospitalDAO.hospitalReserveDate(Integer.parseInt(no));
		   
		   int[] reday=new int[31];
		   StringTokenizer st1=new StringTokenizer(hosDate,",");
		   while(st1.hasMoreTokens()){
			   int k=Integer.parseInt(st1.nextToken());
			   reday[k-1]=k;
		   }	   
			   
		   List<Integer> rList = new ArrayList<Integer>();
		   for(int k:reday){
			   if(k<day) k=0;
			   rList.add(k);
		   }
		 
		   model.addAttribute("rList", rList);
		   
		   return "../hospital/hospital_diary.jsp";
	   }
	
		@RequestMapping("hospital/hospital_time.do")
		   public String hospital_time(Model model)
		   {
			   String day=model.getRequest().getParameter("day");	
			   String time=HospitalDAO.reserveGetTime(Integer.parseInt(day));
			
			   List<String> list=new ArrayList<String>();
			   StringTokenizer st=new StringTokenizer(time,",");
	
			   while(st.hasMoreTokens())
			   {
				   list.add(HospitalDAO.reserveTime(Integer.parseInt(st.nextToken())));
			   }
			   model.addAttribute("list", list);
			   return "../hospital/hospital_time.jsp";
		   }
		
		@RequestMapping("hospital/hospital_dog.do")
		public String hospital_dog(Model model){
			HttpSession session=model.getRequest().getSession();
			String id=(String)session.getAttribute("id");
			
			List<DogVO> list=HospitalDAO.reserveDog(id);
			
			model.addAttribute("list", list);
	
			return "../hospital/hospital_dog.jsp";
		}
		
		@RequestMapping("hospital/hospital_doginsert.do")
		public String hospital_doginsert(Model model){
			
			return "../member/dog_insert.jsp";
		}
	
}

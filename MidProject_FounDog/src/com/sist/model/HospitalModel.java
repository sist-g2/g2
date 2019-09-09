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
import com.sist.dao.MemberDAO;
import com.sist.vo.CareChartVO;
import com.sist.vo.CertificateVO;
import com.sist.vo.DogVO;
import com.sist.vo.HospitalVO;
import com.sist.vo.ReserveVO;
import com.sist.vo.Reserve_DetailVO;
import com.sist.vo.VaccinationVO;

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
			   System.out.println("time="+time);
			   String timeno = time.replace(",", "|");
			   List<String> list = new ArrayList<String>();
			   list = HospitalDAO.reserveTime(timeno);
			   
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
		
		@RequestMapping("hospital/hospital_dog_insert.do")
		public String hospital_doginsert(Model model){
			
			return "../hospital/hospital_dog_insert.jsp";
		}
		
		@RequestMapping("hospital/hospital_dog_insert_ok.do")
		public String hospital_doginsert_ok(Model model){
			try{
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			
			HttpSession session = model.getRequest().getSession();
			String id = (String)session.getAttribute("id");
			
			DogVO dvo = new DogVO();
			String dname = model.getRequest().getParameter("dogname");
			String dtype = model.getRequest().getParameter("dtype");
			String dyear = model.getRequest().getParameter("dyear");
			String dmonth = model.getRequest().getParameter("dmonth");
			String dday = model.getRequest().getParameter("dday");
			String dsex = model.getRequest().getParameter("dsex");
			dvo.setDname(dname);
			dvo.setDtype(dtype);
			if(dyear!="" && dmonth!="" && dday!=""){
				dvo.setDbirth(dyear + "-" + dmonth + "-" + dday);
			} else if(dyear=="" || dmonth=="" || dday=="") {
				dvo.setDbirth("");
			}
			dvo.setDsex(dsex);
			dvo.setId(id);
				
			MemberDAO.dogJoin(dvo);
						
			List<DogVO> list=HospitalDAO.reserveDog(id);
			
			model.addAttribute("list", list);
			
			return "../hospital/hospital_dog.jsp";
		}
		
		@RequestMapping("hospital/hospital_reserve_ok.do")
		public String hospital_reserve_ok(Model model){
			
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			
			String hosNo=model.getRequest().getParameter("hosNo");
			String dogNo=model.getRequest().getParameter("dogNo");
			String symptom=model.getRequest().getParameter("symptom");
			String wr5=model.getRequest().getParameter("wr_5");
			String reserveday=model.getRequest().getParameter("reserve_day");	
			String state = "예약중";
			ReserveVO vo = new ReserveVO();				
			
			vo.setReserve_date(reserveday);
			vo.setReserve_time(wr5);
			vo.setSymptom(symptom);
			vo.setState(state);
			vo.setDogno(Integer.parseInt(dogNo));
			vo.setHosno(Integer.parseInt(hosNo));
			
			HospitalDAO.reserveOk(vo);	
		
			return "redirect:../hospital/hospital_reserve_detail.do";
		}
		
		@RequestMapping("hospital/hospital_reserve_detail.do")
		public String hospital_reserve_detail(Model model){
			
			HttpSession session=model.getRequest().getSession();
			String id=(String)session.getAttribute("id");
			
			List<DogVO> doglist = HospitalDAO.reserveDogname(id);
			
			model.addAttribute("doglist", doglist);
			
			model.addAttribute("main_jsp", "../hospital/hospital_reserve_detail.jsp");
			return "../main/main.jsp";
		}
		
		@RequestMapping("hospital/hospital_reserve_list.do")
		public String hospital_reserve_list(Model model){
			
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			
			HttpSession session=model.getRequest().getSession();
			String id=(String)session.getAttribute("id");
			
			Map map=new HashMap();
			String dno = model.getRequest().getParameter("dno");
			String startDate = model.getRequest().getParameter("startDate");
			String endDate = model.getRequest().getParameter("endDate");
			String page = model.getRequest().getParameter("page");
			
			if(page==null)
				page = "1";
			int curpage = Integer.parseInt(page);
			model.addAttribute("curpage", curpage);
			int rowSize = 5;
			int start = (curpage*rowSize) - (rowSize-1);
			int end = curpage*rowSize;
			map.put("start", start);
			map.put("end", end);
			
			if(startDate==null || startDate==""){
				startDate = "2019-09-01";
			}
			if(endDate==null || endDate==""){
				SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
				Date date = new Date();
				endDate = format.format(date).toString();
			}
			if(dno==null || dno==""){
				dno = "";
				map.put("dno", dno);	
			}else{
				
				map.put("dno", Integer.parseInt(dno));			
			}
			map.put("startDate", startDate);
			map.put("endDate", endDate);
			map.put("id", id);
			
			// 페이지 목록
			int totalNum = HospitalDAO.reserveDetailAllCnt(map);
			model.addAttribute("totalNum", totalNum);
			
			int totalPage = HospitalDAO.reserveDetailTotalPage(map);
			int startPage = 0;
			int endPage = 0;
			
			if(totalPage <= 5) {
				startPage = 1;
				endPage = totalPage;
			} else {
				if(curpage <= 2) {
					startPage = 1;
					endPage = startPage+4;
				} else if (curpage >= totalPage-2) {
					startPage = totalPage-5;
					endPage = totalPage;
				} else {
					startPage = curpage-2;
					endPage = curpage+2;
				}
			}
			
			List<Reserve_DetailVO> list = HospitalDAO.reserveDetail(map);
			
			
			model.addAttribute("list", list);
			
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			
			return "../hospital/hospital_reserve_list.jsp";
		}
		
		@RequestMapping("hospital/hospital_reserve_delete.do")
		public String hospital_reserve_delete(Model model){
			String no = model.getRequest().getParameter("rno");
			
			HospitalDAO.reserveDelete(Integer.parseInt(no));
			
			return "redirect:../hospital/hospital_reserve_detail.do";
		}
		
		@RequestMapping("hospital/hospital_carechart_detail.do")
		public String hospital_carechart_detail(Model model){
			
			HttpSession session=model.getRequest().getSession();
			String id=(String)session.getAttribute("id");
			
			List<DogVO> doglist = HospitalDAO.reserveDogname(id);
			model.addAttribute("doglist", doglist);
			
			model.addAttribute("main_jsp", "../hospital/hospital_carechart_detail.jsp");
			return "../main/main.jsp";
		}
		
		@RequestMapping("hospital/hospital_carechart_list.do")
		public String hospital_carechart_list(Model model){
			
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			
			HttpSession session=model.getRequest().getSession();
			String id=(String)session.getAttribute("id");
			
			Map map=new HashMap();
			String dno = model.getRequest().getParameter("dno");
			String startDate = model.getRequest().getParameter("startDate");		
			String endDate = model.getRequest().getParameter("endDate");		
			String page = model.getRequest().getParameter("page");
			
			if(page==null)
				page = "1";
			int curpage = Integer.parseInt(page);
			model.addAttribute("curpage", curpage);
			int rowSize = 5;
			int start = (curpage*rowSize) - (rowSize-1);
			int end = curpage*rowSize;
			map.put("start", start);
			map.put("end", end);
			
			if(startDate==null || startDate==""){
				startDate = "2019-09-01";
			}
			if(endDate==null || endDate==""){
				SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
				Date date = new Date();
				endDate = format.format(date).toString();
			}
			if(dno==null || dno==""){
				dno = "";
				map.put("dno", dno);	
			}else{
				
				map.put("dno", Integer.parseInt(dno));			
			}			
			map.put("startDate", startDate);
			map.put("endDate", endDate);
			map.put("id", id);
			
			// 페이지 목록
			int totalNum = HospitalDAO.carechartDetailAllCnt(map);
			model.addAttribute("totalNum", totalNum);
			
			int totalPage = HospitalDAO.carechartDetailTotalPage(map);
			int startPage = 0;
			int endPage = 0;
			
			if(totalPage <= 5) {
				startPage = 1;
				endPage = totalPage;
			} else {
				if(curpage <= 2) {
					startPage = 1;
					endPage = startPage+4;
				} else if (curpage >= totalPage-2) {
					startPage = totalPage-5;
					endPage = totalPage;
				} else {
					startPage = curpage-2;
					endPage = curpage+2;
				}
			}
			
			List<CareChartVO> list = HospitalDAO.carechartDetail(map);
						
			model.addAttribute("list", list);			
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			
			return "../hospital/hospital_carechart_list.jsp";
		}
		
		@RequestMapping("hospital/hospital_vaccination_detail.do")
		public String hospital_vaccination_detail(Model model){
			
			HttpSession session=model.getRequest().getSession();
			String id=(String)session.getAttribute("id");
			
			List<DogVO> doglist = HospitalDAO.reserveDogname(id);
			model.addAttribute("doglist", doglist);
			
			model.addAttribute("main_jsp", "../hospital/hospital_vaccination_detail.jsp");
			return "../main/main.jsp";
		}
		
		@RequestMapping("hospital/hospital_vaccination_list.do")
		public String hospital_vaccination_list(Model model){
			
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			
			HttpSession session=model.getRequest().getSession();
			String id=(String)session.getAttribute("id");
			
			Map map=new HashMap();
			String dno = model.getRequest().getParameter("dno");		
			String page = model.getRequest().getParameter("page");
			
			if(page==null)
				page = "1";
			int curpage = Integer.parseInt(page);
			model.addAttribute("curpage", curpage);
			int rowSize = 5;
			int start = (curpage*rowSize) - (rowSize-1);
			int end = curpage*rowSize;
			map.put("start", start);
			map.put("end", end);
			
			if(dno==null || dno==""){
				dno = "";
				map.put("dno", dno);	
			}else{
				
				map.put("dno", Integer.parseInt(dno));			
			}			
			map.put("id", id);
			
			// 페이지 목록
			int totalNum = HospitalDAO.vaccinationDetailAllCnt(map);
			model.addAttribute("totalNum", totalNum);
			
			int totalPage = HospitalDAO.vaccinationDetailTotalPage(map);
			int startPage = 0;
			int endPage = 0;
			
			if(totalPage <= 5) {
				startPage = 1;
				endPage = totalPage;
			} else {
				if(curpage <= 2) {
					startPage = 1;
					endPage = startPage+4;
				} else if (curpage >= totalPage-2) {
					startPage = totalPage-5;
					endPage = totalPage;
				} else {
					startPage = curpage-2;
					endPage = curpage+2;
				}
			}
			
			List<VaccinationVO> list = HospitalDAO.vaccinationDetail(map);
						
			model.addAttribute("list", list);			
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			
			return "../hospital/hospital_vaccination_list.jsp";
		}
		
		@RequestMapping("hospital/hospital_carechart_certificate.do")
		public String hospital_carechart_certificate(Model model){
			String no = model.getRequest().getParameter("no");
		
			CertificateVO list = HospitalDAO.certificateData(Integer.parseInt(no));
			
			model.addAttribute("list", list);
			
			return "../hospital/hospital_carechart_certificate.jsp";
		}
		
		@RequestMapping("hospital/hospital_vaccination_insert.do")
		public String hospital_vaccination_insert(Model model){
			
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			
			String dname = model.getRequest().getParameter("dname");
			String vname = model.getRequest().getParameter("vname");
			String vdate = model.getRequest().getParameter("vdate");
			String id = model.getRequest().getParameter("id");
			
			VaccinationVO vo = new VaccinationVO();

			vo.setVaccination_name(vname);
			vo.setLast_date(vdate);
			vo.setSchedule_date(vdate);
			vo.setDogname(dname);
			vo.setId(id);
			
			HospitalDAO.vaccinationInsert(vo);
			
			return "redirect:../hospital/hospital_vaccination_detail.do";
		}
}

package com.sist.model;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.HospitalDAO;
import com.sist.vo.HospitalVO;
@Controller("hospitalModel")
public class HospitalModel {
	@RequestMapping("main/sample_search.do")
	public String sample(Model model){
	// 요청값을 받는다
	try {
		model.getRequest().setCharacterEncoding("UTF-8");
	} catch (Exception e) {}	
	
	String loc = model.getRequest().getParameter("loc");
	String name = model.getRequest().getParameter("name");
	 
	List<HospitalVO> list = HospitalDAO.hospitalSearch(loc, name);
	model.addAttribute("list", list);
	
	List<String> loc2 = HospitalDAO.hospitalGetLoc();
	model.addAttribute("loc", loc2);
	model.addAttribute("main_jsp", "../hospital/hospital_list.jsp");
	return "../main/main.jsp";
	}
	
	@RequestMapping("hospital/sample.do")
	public String sample_main(Model model){
		
		List<String> loc = HospitalDAO.hospitalGetLoc();

		model.addAttribute("loc", loc);
		
		model.addAttribute("main_jsp", "../hospital/hospital_list.jsp");
		return "../main/main.jsp";
	}
}

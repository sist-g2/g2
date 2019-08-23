package com.sist.model;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.SampleDAO;
import com.sist.vo.SampleVO;
@Controller("sampleModel")
public class SampleModel {
	@RequestMapping("main/sample_ok.do")
	public String sample(Model model){
	// 요청값을 받는다
	try {
		model.getRequest().setCharacterEncoding("UTF-8");
	} catch (Exception e) {}	
	
	String loc = model.getRequest().getParameter("loc");
	String name = model.getRequest().getParameter("name");
	 
	List<SampleVO> list = SampleDAO.sampleData(loc, name);
	model.addAttribute("list", list);
	
	List<String> loc2 = SampleDAO.sampleGetLoc();
	model.addAttribute("loc", loc2);
	model.addAttribute("main_jsp", "../hospital/sample.jsp");
	return "../main/main.jsp";
	}
	
	@RequestMapping("hospital/sample.do")
	public String sample_main(Model model){
		
		List<String> loc = SampleDAO.sampleGetLoc();

		model.addAttribute("loc", loc);
		
		model.addAttribute("main_jsp", "../hospital/sample.jsp");
		return "../main/main.jsp";
	}
}

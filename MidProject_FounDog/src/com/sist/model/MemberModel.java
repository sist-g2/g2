package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;

@Controller("memberModel")
public class MemberModel {
	@RequestMapping("member/member_join.do")
	public String member_join(Model model){
		model.addAttribute("main_jsp", "../member/member_join.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_login.do")
	public String member_login(Model model){
		model.addAttribute("main_jsp", "../member/member_login.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_update.do")
	public String member_update(Model model){
		model.addAttribute("main_jsp", "../member/member_update.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_delete.do")
	public String member_delete(Model model){
		model.addAttribute("main_jsp", "../member/member_delete.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_mypage.do")
	public String member_mypage(Model model){
		model.addAttribute("main_jsp", "../member/member_mypage.jsp");
		return "../main/main.jsp";
	}
}

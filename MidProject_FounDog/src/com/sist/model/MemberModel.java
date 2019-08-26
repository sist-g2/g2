package com.sist.model;

import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Controller("memberModel")
public class MemberModel {
	@RequestMapping("member/member_join.do")
	public String member_join(Model model){
		model.addAttribute("main_jsp", "../member/member_join.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_join_ok.do")
	public String member_join_ok(Model model){
		try{
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String id = model.getRequest().getParameter("id");
		String pwd = model.getRequest().getParameter("pwd");
		String name = model.getRequest().getParameter("name");
		String year = model.getRequest().getParameter("year");
		String month = model.getRequest().getParameter("month");
		String day = model.getRequest().getParameter("day");
		String sex = model.getRequest().getParameter("sex");
		String tel1 = model.getRequest().getParameter("tel1");
		String tel2 = model.getRequest().getParameter("tel2");
		String tel3 = model.getRequest().getParameter("tel3");
		String email = model.getRequest().getParameter("email");
		String post = model.getRequest().getParameter("post");
		String addr1 = model.getRequest().getParameter("addr1");
		String addr2 = model.getRequest().getParameter("addr2");
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setBirthday(year + "-" + month + "-" + day);
		vo.setSex(sex);
		vo.setTel(tel1 + "-" + tel2 + "-" + tel3);
		vo.setEmail(email);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		
		System.out.println(id);
		
		MemberDAO.memberJoin(vo);
		
		return "redirect:../main/main.do";
	}
	
	@RequestMapping("member/member_login.do")
	public String member_login(Model model){
		model.addAttribute("main_jsp", "../member/member_login.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_login_ok.do")
	public String member_login_ok(Model model){
		String id = model.getRequest().getParameter("id");
		String pwd = model.getRequest().getParameter("pwd");
		MemberVO vo = MemberDAO.memberLogin(id, pwd);
		if(!(vo.getName().equals("NOID") || vo.getName().equals("NOPWD"))){
			HttpSession session = model.getRequest().getSession();
			session.setAttribute("id", id);
			session.setAttribute("name", vo.getName()); //로그인 시 name을 세션에 저장하기 위함 => 댓글쓰기에서 name 사용
		}
		model.addAttribute("res", vo.getName());
		return "../member/member_login_ok.jsp";
	}
	
	@RequestMapping("member/member_logout.do")
	public String member_logout(Model model){
		HttpSession session = model.getRequest().getSession();
		session.invalidate();
		return "redirect:../main/main.do";
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

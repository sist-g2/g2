package com.sist.model;


import java.util.List;

import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.DogVO;
import com.sist.vo.MemberVO;

@Controller("memberModel")
public class MemberModel {
	@RequestMapping("member/member_join.do")
	public String member_join(Model model){
		model.addAttribute("main_jsp", "../member/member_join.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_join_after.do")
	public String member_join_after(Model model){
		model.addAttribute("main_jsp", "../member/member_join_after.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_jungbok.do")
	public String member_jungbok(Model model){
		String id = model.getRequest().getParameter("id");
		int count = MemberDAO.member_jungbok(id);
		System.out.println(count);
		HttpSession session = model.getRequest().getSession();
		session.setAttribute("count", count);
		return "../member/member_jungbok.jsp";
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

		MemberDAO.memberJoin(vo);
		
		DogVO dvo = new DogVO();
		
		//System.out.println(dname);
		
		String input = model.getRequest().getParameter("input");
		System.out.println("input : " + input);
		
		if(input.equals("1")){
			String dname = model.getRequest().getParameter("dname1");
			String dtype = model.getRequest().getParameter("dtype1");
			String dyear = model.getRequest().getParameter("dyear1");
			String dmonth = model.getRequest().getParameter("dmonth1");
			String dday = model.getRequest().getParameter("dday1");
			String dsex = model.getRequest().getParameter("dsex1");
			
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
		} else if(input.equals("2")){
			String dname = model.getRequest().getParameter("dname1");
			String dtype = model.getRequest().getParameter("dtype1");
			String dyear = model.getRequest().getParameter("dyear1");
			String dmonth = model.getRequest().getParameter("dmonth1");
			String dday = model.getRequest().getParameter("dday1");
			String dsex = model.getRequest().getParameter("dsex1");
			
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
			
			dname = model.getRequest().getParameter("dname2");
			dtype = model.getRequest().getParameter("dtype2");
			dyear = model.getRequest().getParameter("dyear2");
			dmonth = model.getRequest().getParameter("dmonth2");
			dday = model.getRequest().getParameter("dday2");
			dsex = model.getRequest().getParameter("dsex2");
			
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
		} else if(input.equals("3")){
			String dname = model.getRequest().getParameter("dname1");
			String dtype = model.getRequest().getParameter("dtype1");
			String dyear = model.getRequest().getParameter("dyear1");
			String dmonth = model.getRequest().getParameter("dmonth1");
			String dday = model.getRequest().getParameter("dday1");
			String dsex = model.getRequest().getParameter("dsex1");
			
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
			
			dname = model.getRequest().getParameter("dname2");
			dtype = model.getRequest().getParameter("dtype2");
			dyear = model.getRequest().getParameter("dyear2");
			dmonth = model.getRequest().getParameter("dmonth2");
			dday = model.getRequest().getParameter("dday2");
			dsex = model.getRequest().getParameter("dsex2");
			
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
			
			dname = model.getRequest().getParameter("dname3");
			dtype = model.getRequest().getParameter("dtype3");
			dyear = model.getRequest().getParameter("dyear3");
			dmonth = model.getRequest().getParameter("dmonth3");
			dday = model.getRequest().getParameter("dday3");
			dsex = model.getRequest().getParameter("dsex3");
			
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
		} else if(input.equals("0")){}
		
		return "redirect:../member/member_join_after.do";
	}
	
	@RequestMapping("member/dog_insert.do")
	public String dog_insert(Model model){
		model.addAttribute("main_jsp", "../member/dog_insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/dog_update.do")
	public String dog_update(Model model){
		String dno = model.getRequest().getParameter("dno");
		DogVO dvo = MemberDAO.dogUpDetailData(Integer.parseInt(dno));
		model.addAttribute("dvo", dvo);
		model.addAttribute("main_jsp", "../member/dog_update.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/dog_update_ok.do")
	public String dog_update_ok(Model model){
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String dno = model.getRequest().getParameter("dno");
		String dname = model.getRequest().getParameter("dname");
		String dtype = model.getRequest().getParameter("dtype");
		String dyear = model.getRequest().getParameter("dyear");
		String dmonth = model.getRequest().getParameter("dmonth");
		String dday = model.getRequest().getParameter("dday");
		
		DogVO dvo = new DogVO();
		dvo.setDname(dname);
		dvo.setDno(Integer.parseInt(dno));
		if(dyear!="" && dmonth!="" && dday!=""){
			dvo.setDbirth(dyear + "-" + dmonth + "-" + dday);
		} else if(dyear=="" || dmonth=="" || dday=="") {
			dvo.setDbirth("");
		}
		dvo.setDtype(dtype);
		
		MemberDAO.dogUpdate(dvo);
		model.addAttribute("dvo", dvo);
		return "redirect:../member/member_mypage.do";
	}
	
	@RequestMapping("member/dog_insert_ok.do")
	public String dog_insert_ok(Model model){
		try{
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		
		DogVO dvo = new DogVO();
		String dname = model.getRequest().getParameter("dname");
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
		return "redirect:../member/member_mypage.do";
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
			session.setAttribute("name", vo.getName()); //�α��� �� name�� ���ǿ� �����ϱ� ���� => ��۾��⿡�� name ���
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
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		MemberVO vo = MemberDAO.memberDetailData(id);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../member/member_update.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_update_pwd.do")
	public String member_update_pwd(Model model){
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		MemberVO vo = MemberDAO.memberDetailData(id);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../member/member_update_pwd.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_update_pwd_ok.do")
	public String member_update_pwd_ok(Model model){
		HttpSession session = model.getRequest().getSession();
		String id = model.getRequest().getParameter("id");
		String pwd = model.getRequest().getParameter("pwd");
		int res = MemberDAO.memberUpdatePwd(id, pwd);
		model.addAttribute("res", res);
		return "../member/member_update_pwd_ok.jsp";
	}
	
	@RequestMapping("member/member_update_ok.do")
	public String member_update_ok(Model model){
		try{
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		String pwd = MemberDAO.memberUpdateNullPwd(id);
		System.out.println("���� ��й�ȣ : " + pwd);
		
		String tel1 = model.getRequest().getParameter("tel1");
		String tel2 = model.getRequest().getParameter("tel2");
		String tel3 = model.getRequest().getParameter("tel3");
		String email = model.getRequest().getParameter("email");
		String post = model.getRequest().getParameter("post");
		String addr1 = model.getRequest().getParameter("addr1");
		String addr2 = model.getRequest().getParameter("addr2");
		String upPwd = model.getRequest().getParameter("pwd");
		
		System.out.println("������ ��й�ȣ : " + upPwd);
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setTel(tel1 + "-" + tel2 + "-" + tel3);
		vo.setEmail(email);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		if(upPwd==""){
			vo.setPwd(pwd);
		} else {
			vo.setPwd(upPwd);
		}
		
		MemberDAO.memberUpdate(vo);
		
		return "redirect:../member/member_mypage.do";
	}
	
	@RequestMapping("member/member_delete.do")
	public String member_delete(Model model){
		model.addAttribute("main_jsp", "../member/member_delete.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_delete_ok.do")
	public String member_delete_ok(Model model){
		HttpSession session = model.getRequest().getSession();
		String id = model.getRequest().getParameter("id");
		String pwd = model.getRequest().getParameter("pwd");
		int res = MemberDAO.memberDelete(id, pwd);
		model.addAttribute("res", res);
		session.invalidate();
		return "../member/member_delete_ok.jsp";
	}
	
	@RequestMapping("member/dog_delete_ok.do")
	public String dog_delete_ok(Model model){
		String dno = model.getRequest().getParameter("dno");
		MemberDAO.dogDelete(Integer.parseInt(dno));
		return "redirect:../member/member_mypage.do";
	}
	
	@RequestMapping("member/member_delete_after.do")
	public String member_delete_after(Model model){
		model.addAttribute("main_jsp", "../member/member_delete_after.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/member_mypage.do")
	public String member_mypage(Model model){
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		List<DogVO> list = MemberDAO.dogDetailData(id);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../member/member_mypage.jsp");
		return "../main/main.jsp";
	}
}

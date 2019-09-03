package com.sist.model;

import java.util.*;
import javax.servlet.http.HttpSession;
import com.sist.controller.*;
import com.sist.dao.FaqDAO;
import com.sist.vo.Board_FAQVO;


@Controller("FaqModel")
public class FaqModel {

	@RequestMapping("site/site_list.do")
	public String site_list(Model model){
		HttpSession session = model.getRequest().getSession();
		String cate = model.getRequest().getParameter("cate");
		if(cate==null)
			cate="0";
		int category = Integer.parseInt(cate);

		/*String page=model.getRequest().getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map = new HashMap();*/
		
		List<Board_FAQVO> list=FaqDAO.faqListData(category);
		model.addAttribute("cate", category);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../site/site_list.jsp");
		return "../main/main.jsp";
	}
}

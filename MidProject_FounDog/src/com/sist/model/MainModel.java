package com.sist.model;
import java.util.*;
import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller("mainModel")
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_page(Model model) {
		model.addAttribute("main_jsp", "home.jsp");
		return "main.jsp";
	}
}

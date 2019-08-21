package com.sist.model;
import java.util.*;
import com.sist.controller.*;

public class FeedModel {
	@RequestMapping("feed/feed_list.do")
	public String feed_list(Model model) {
		model.addAttribute("main_jsp", "../feed/feed_list.jsp");
		return "../main/main.jsp";
	}
}

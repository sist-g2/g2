package com.sist.model;
import java.util.*;
import com.sist.controller.*;
import com.sist.vo.*;
import com.sist.dao.*;

@Controller("feedModel")
public class FeedModel {
	@RequestMapping("feed/feed_list.do")
	public String feed_list(Model model) {
		// �ɼ� ��� �ε�
		List<Feed_brandVO> brndList = FeedDAO.brandAllData();
		model.addAttribute("brndList", brndList);
		List<Feed_cateVO> cateList = FeedDAO.cateAllData();
		model.addAttribute("cateList", cateList);
		List<Feed_grainVO> grnList = FeedDAO.grainAllData();
		model.addAttribute("grnList", grnList);
		List<Feed_mtrVO> mtrList = FeedDAO.mtrAllData();
		model.addAttribute("mtrList", mtrList);
		List<Feed_targetVO> tgList = FeedDAO.targetAllData();
		model.addAttribute("tgList", tgList);
		
		Map<String, Object> opList = new HashMap<String, Object>();
		
		// ������
		String page = model.getRequest().getParameter("page");
		System.out.println("page : " + page);
		if(page==null)
			page = "1";
		int curpage = Integer.parseInt(page);
		model.addAttribute("curpage", curpage);
		int rowSize = 20;
		int start = (curpage*rowSize) - (rowSize-1);
		int end = curpage*rowSize;
		opList.put("start", start);
		opList.put("end", end);
		
		// ������ �ɼ� �ҷ�����
		String cate = model.getRequest().getParameter("category"); // ��� ����
		int category = 999;
		if(cate!=null)
			category = Integer.parseInt(cate);
		opList.put("cate", category);
		model.addAttribute("category", category);
		
		String[] brnd = model.getRequest().getParameterValues("brand"); // �귣��
		List<Integer> brandOp = FeedDAO.arrToList(brnd);
		opList.put("brandList", brandOp);
		model.addAttribute("brandOp", brandOp);
		
		String[] tg = model.getRequest().getParameterValues("tg"); // ����
		List<Integer> tgOp = FeedDAO.arrToList(tg);
		opList.put("targetList", tgOp);
		model.addAttribute("tgOp", tgOp);
		
		String[] mtr = model.getRequest().getParameterValues("mtr"); // �ֿ���
		String mtrSql = FeedDAO.mtrToMap(mtr);
		opList.put("mtrSql", mtrSql);
		List<Integer> mtrOp = FeedDAO.arrToList(mtr);
		model.addAttribute("mtrOp", mtrOp);
		
		String[] grn = model.getRequest().getParameterValues("grn"); // �˰��� ũ��
		List<Integer> grnOp = FeedDAO.arrToList(grn);
		opList.put("grainList", grnOp);
		model.addAttribute("grnOp", grnOp);
		
		// ����
		String sortOp = model.getRequest().getParameter("sort_btn");
		opList.put("sortOp", sortOp);
		
		// ����� ��ǰ ����Ʈ
		List<FeedVO> feedList = FeedDAO.feedAllData(opList);
		model.addAttribute("fdList", feedList);
		
		// �� ��ǰ ����&�� ������
		Feed_totalVO tvo = FeedDAO.feedTotal(opList);
		model.addAttribute("totalNum", tvo.getTotalCnt());
		model.addAttribute("totalPage", tvo.getTotalPage());
		
		// ������ �̵�
		model.addAttribute("main_jsp", "../feed/feed_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("feed/feed_detail.do")
	public String feed_detail(Model model) {
		String sno = model.getRequest().getParameter("no");
		int no = Integer.parseInt(sno);
		FeedDAO.feedHitIncrease(no); // ��ȸ�� ������Ʈ
		FeedVO vo = FeedDAO.feedDetailData(no); 
		List<Feed_StoreVO> slist = FeedDAO.feedStoreData(no); 
		int lowPrice = FeedDAO.feedLowPrice(no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("slist", slist);
		model.addAttribute("lowPrice", lowPrice);
		
		model.addAttribute("main_jsp", "../feed/feed_detail.jsp");
		return "../main/main.jsp";
	}
}

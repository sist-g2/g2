package com.sist.model;
import java.util.*;
import com.sist.controller.*;
import com.sist.vo.*;
import com.sist.dao.*;

@Controller("feedModel")
public class FeedModel {
	@RequestMapping("feed/feed_list.do")
	public String feed_list(Model model) {
		// 옵션 목록 로딩
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
		
		// 페이지
		String page = model.getRequest().getParameter("page");
		if(page==null)
			page = "1";
		int curpage = Integer.parseInt(page);
		model.addAttribute("curpage", curpage);
		int rowSize = 20;
		int start = (curpage*rowSize) - (rowSize-1);
		int end = curpage*rowSize;
		opList.put("start", start);
		opList.put("end", end);
		
		// 선택한 옵션 불러오기
		String cate = model.getRequest().getParameter("category"); // 사료 종류
		int category = 999;
		if(cate!=null)
			category = Integer.parseInt(cate);
		opList.put("cate", category);
		model.addAttribute("category", category);
		
		String[] brnd = model.getRequest().getParameterValues("brand"); // 브랜드
		List<Integer> brandOp = arrToList(brnd);
		opList.put("brandList", brandOp);
		model.addAttribute("brandOp", brandOp);
		
		String[] tg = model.getRequest().getParameterValues("tg"); // 연령
		List<Integer> tgOp = arrToList(tg);
		opList.put("targetList", tgOp);
		model.addAttribute("tgOp", tgOp);
		
		String[] mtr = model.getRequest().getParameterValues("mtr"); // 주원료
		String mtrSql = mtrToMap(mtr);
		opList.put("mtrSql", mtrSql);
		List<Integer> mtrOp = arrToList(mtr);
		model.addAttribute("mtrOp", mtrOp);
		
		String[] grn = model.getRequest().getParameterValues("grn"); // 알갱이 크기
		List<Integer> grnOp = arrToList(grn);
		opList.put("grainList", grnOp);
		model.addAttribute("grnOp", grnOp);
		
		// 정렬
		String sortOp = model.getRequest().getParameter("sort_btn");
		opList.put("sortOp", sortOp);
		
		// 출력할 상품 리스트
		List<FeedVO> feedList = FeedDAO.feedAllData(opList);
		model.addAttribute("fdList", feedList);
		
		// 총 상품 개수&총 페이지
		int totalNum = FeedDAO.feedTotalNum(opList);
		model.addAttribute("totalNum", totalNum);
		int totalPage = FeedDAO.feedTotalPage(opList);
		model.addAttribute("totalPage", totalPage);
		
		// 페이지 이동
		model.addAttribute("main_jsp", "../feed/feed_list.jsp");
		return "../main/main.jsp";
	}
	
	public List<Integer> arrToList(String[] arr) {
		List<Integer> list = new ArrayList<Integer>();
		if (arr==null) {
			list = null;
		} else {
			for(int i = 0; i < arr.length; i++)
				list.add(Integer.parseInt(arr[i]));
		}
		return list;
	}
	
	public String mtrToMap(String[] arr) {
		String sql = "";
		if(arr==null) {
			sql = null;
		} else {
			for(int i = 0; i < arr.length; i++) {
				sql = sql.concat(arr[i]);
				sql = sql.concat("|");
			}
			sql = sql.substring(0, sql.length()-1);
		}
		return sql;
	}
}

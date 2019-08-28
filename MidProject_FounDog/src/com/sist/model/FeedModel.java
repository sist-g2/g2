package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import com.sist.controller.*;
import com.sist.vo.*;
import com.sist.dao.*;

@Controller("feedModel")
public class FeedModel {
	@RequestMapping("feed/feed_list.do")
	public String feed_list(Model model) {
		// 세션
		HttpSession session = model.getRequest().getSession();
		model.addAttribute("id", (String)session.getAttribute("id"));
		model.addAttribute("memName", (String)session.getAttribute("name"));
		
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
		List<Integer> brandOp = FeedDAO.arrToList(brnd);
		opList.put("brandList", brandOp);
		model.addAttribute("brandOp", brandOp);
		
		String[] tg = model.getRequest().getParameterValues("tg"); // 연령
		List<Integer> tgOp = FeedDAO.arrToList(tg);
		opList.put("targetList", tgOp);
		model.addAttribute("tgOp", tgOp);
		
		String[] mtr = model.getRequest().getParameterValues("mtr"); // 주원료
		String mtrSql = FeedDAO.mtrToMap(mtr);
		opList.put("mtrSql", mtrSql);
		List<Integer> mtrOp = FeedDAO.arrToList(mtr);
		model.addAttribute("mtrOp", mtrOp);
		
		String[] grn = model.getRequest().getParameterValues("grn"); // 알갱이 크기
		List<Integer> grnOp = FeedDAO.arrToList(grn);
		opList.put("grainList", grnOp);
		model.addAttribute("grnOp", grnOp);
		
		// 정렬
		String sortOp = model.getRequest().getParameter("sort_btn");
		opList.put("sortOp", sortOp);
		
		// 출력할 상품 리스트
		List<FeedVO> feedList = FeedDAO.feedAllData(opList);
		model.addAttribute("fdList", feedList);
		
		// 총 상품 개수&총 페이지
		Feed_totalVO tvo = FeedDAO.feedTotal(opList);
		int totalNum = tvo.getTotalCnt();
		model.addAttribute("totalNum", totalNum);
		
		int totalPage = tvo.getTotalPage();
		int startPage = 0;
		int endPage = 0;
		
		// 페이지 목록
		if(tvo.getTotalPage() <= 5) {
			startPage = 1;
			endPage = totalPage;
		} else {
			if(curpage <= 2) {
				startPage = 1;
				endPage = startPage+4;
			} else if (curpage >= totalPage-2) {
				startPage = totalPage-5;
				endPage = totalPage;
			} else {
				startPage = curpage-2;
				endPage = curpage+2;
			}
		}
		
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		// 쿠키 가져오기
		Cookie[] cookies = model.getRequest().getCookies();
		List<FeedVO> clist = new ArrayList<FeedVO>();
		if(cookies!=null) {
			if(cookies.length > 6) {
				for (int i = cookies.length-1; i >= cookies.length-6; i--) {
					if(cookies[i].getName().contains("my")) {
						String value = cookies[i].getValue();
						FeedVO ckvo = FeedDAO.feedDetailData(Integer.parseInt(value));
						clist.add(ckvo);
					}
				}
			} else {
				for (int i = cookies.length-1; i >= 0; i--) {
					if(cookies[i].getName().contains("my")) {
						String value = cookies[i].getValue();
						FeedVO ckvo = FeedDAO.feedDetailData(Integer.parseInt(value));
						clist.add(ckvo);
					}
				}
			}
		}
		model.addAttribute("clist", clist);

		// 페이지 이동
		model.addAttribute("main_jsp", "../feed/feed_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("feed/feed_detail.do")
	public String feed_detail(Model model) {
		// 세션
		HttpSession session = model.getRequest().getSession();
		
		// 이전페이지
		int urlPlag = -1;
		String jsRef = model.getRequest().getParameter("ref");
		System.out.println("js경로 : " + jsRef);
		String referer = (String)model.getRequest().getHeader("REFERER");
		referer = referer.substring(referer.indexOf("/", referer.indexOf("feed"))+1);
		if(referer.indexOf("?")!=-1) {
			referer = referer.substring(0, referer.indexOf("?"));
		}
		System.out.println("경로 : " + referer);
		if(referer.equals("feed_list.do")) {
			urlPlag = 0;
		} else if (referer.equals("feed_fav_list.do") || referer.equals("feed_detail.do")) {
			urlPlag = 1;
		}
		//System.out.println("플래그 : " + urlPlag);
		model.addAttribute("urlPlag", urlPlag);
				
		String sno = model.getRequest().getParameter("no");
		int no = Integer.parseInt(sno);
		FeedDAO.feedHitIncrease(no); // 조회수 업데이트
		FeedVO vo = FeedDAO.feedDetailData(no);  // 상품 정보
		List<Feed_StoreVO> slist = FeedDAO.feedStoreData(no); // 판매처 정보
		int lowPrice = FeedDAO.feedLowPrice(no); // 최저가 정보
		List<Feed_ReviewVO> rlist = FeedDAO.reviewAllData(no); // 리뷰 리스트
		
		Cookie cookie = new Cookie("my"+sno, sno); // 쿠키 추가
		model.getResponse().addCookie(cookie);
		
		// 쿠키 가져오기
		Cookie[] cookies = model.getRequest().getCookies();
		List<FeedVO> clist = new ArrayList<FeedVO>();
		if(cookies!=null) {
			if(cookies.length > 6) {
				for (int i = cookies.length-1; i >= cookies.length-6; i--) {
					if(cookies[i].getName().contains("my")) {
						String value = cookies[i].getValue();
						FeedVO ckvo = FeedDAO.feedDetailData(Integer.parseInt(value));
						clist.add(ckvo);
					}
				}
			} else {
				for (int i = cookies.length-1; i >= 0; i--) {
					if(cookies[i].getName().contains("my")) {
						String value = cookies[i].getValue();
						FeedVO ckvo = FeedDAO.feedDetailData(Integer.parseInt(value));
						clist.add(ckvo);
					}
				}
			}
		}
		model.addAttribute("clist", clist);
		
		// 찜 확인
		Map favmap = new HashMap();
		String id = (String)session.getAttribute("id");
		int fnum = vo.getNo();
		int favnum = -2; // 로그인하지 않았음
		
		if(id != null) {
			favnum = -1; // 로그인했으나 찜하지 않았음
			favmap.put("id", id);
			favmap.put("fnum", fnum);
			
			int tmp = FeedDAO.feedFavCheck(favmap);
			if(tmp > 0) {
				favnum = tmp; // 찜 번호
			}
		}
		model.addAttribute("favnum", favnum);
		
		model.addAttribute("vo", vo);
		model.addAttribute("slist", slist);
		model.addAttribute("lowPrice", lowPrice);
		model.addAttribute("rlist", rlist);
		
		model.addAttribute("main_jsp", "../feed/feed_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("feed/feed_fav_insert.do")
	public String feed_fav_ins(Model model) {
		String no = model.getRequest().getParameter("no");
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		
		Feed_FavoriteVO fvo = new Feed_FavoriteVO();
		fvo.setFnum(Integer.parseInt(no));
		fvo.setId(id);
		
		FeedDAO.feedFavInsert(fvo);
		
		return "redirect:../feed/feed_detail.do?no="+no;
	}
	
	@RequestMapping("feed/feed_fav_delete.do")
	public String feed_fav_del(Model model) {
		String bno = model.getRequest().getParameter("bno");
		String no = model.getRequest().getParameter("no");
		
		FeedDAO.feedFavDelete(Integer.parseInt(no));
		
		return "redirect:../feed/feed_detail.do?no="+bno;
	}
	
	@RequestMapping("feed/feed_review_ins.do")
	public String feed_review_ins(Model model) {
		HttpSession session = model.getRequest().getSession();
		
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception ex) {}
		
		String subject = model.getRequest().getParameter("subject");
		String content = model.getRequest().getParameter("content");
		String star = model.getRequest().getParameter("star");
		String fnum = model.getRequest().getParameter("fnum");
		String id = (String)session.getAttribute("id");
		String dtype = model.getRequest().getParameter("dtype");
		
		Feed_ReviewVO vo = new Feed_ReviewVO();
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setStar(Integer.parseInt(star));
		vo.setFnum(Integer.parseInt(fnum));
		vo.setId(id);
		vo.setDtype(dtype);
		
		FeedDAO.reviewInsert(vo);
		
		return "redirect:../feed/feed_detail.do?no="+fnum;
	}
	
	@RequestMapping("feed/feed_review_del.do")
	public String feed_review_del(Model model) {
		String no = model.getRequest().getParameter("no");
		String bno = model.getRequest().getParameter("bno");
		
		FeedDAO.reviewDelete(Integer.parseInt(no));
		
		return "redirect:../feed/feed_detail.do?no="+bno;
	}
	
	@RequestMapping("feed/feed_review_upd.do")
	public String feed_review_upd(Model model) {
		HttpSession session = model.getRequest().getSession();
		
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception ex) {}
		
		String no = model.getRequest().getParameter("no");
		String subject = model.getRequest().getParameter("subject");
		String content = model.getRequest().getParameter("content");
		String star = model.getRequest().getParameter("star");
		String dtype = model.getRequest().getParameter("dtype");
		String fnum = model.getRequest().getParameter("fnum");
		
		Feed_ReviewVO vo = new Feed_ReviewVO();
		vo.setNo(Integer.parseInt(no));
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setStar(Integer.parseInt(star));
		vo.setFnum(Integer.parseInt(fnum));
		vo.setDtype(dtype);
		
		FeedDAO.reviewUpdate(vo);
		
		return "redirect:../feed/feed_detail.do?no="+fnum;
	}
	
	@RequestMapping("feed/feed_fav_list.do")
	public String feed_fav_list(Model model) {
		Map<String, Object> opList = new HashMap<String, Object>();
		
		// 세션
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		opList.put("id", id);
		
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
		
		// 정렬
		String sortOp = model.getRequest().getParameter("sort_btn");
		opList.put("sortOp", sortOp);
		
		// 출력할 상품 리스트
		List<Feed_FavoriteVO> favList = FeedDAO.favListData(opList);
		model.addAttribute("favList", favList);
		
		// 총 상품 개수&총 페이지
		int totalNum = FeedDAO.feed_fav_totalNum(id);
		model.addAttribute("totalNum", totalNum);
		
		int totalPage = 0;
		int startPage = 0;
		int endPage = 0;
		
		if(totalNum > 0) {
			totalPage = FeedDAO.feed_fav_totalPage(totalNum);
			
			// 페이지 목록
			if(totalPage <= 5) {
				startPage = 1;
				endPage = totalPage;
			} else {
				if(curpage <= 2) {
					startPage = 1;
					endPage = startPage+4;
				} else if (curpage >= totalPage-2) {
					startPage = totalPage-5;
					endPage = totalPage;
				} else {
					startPage = curpage-2;
					endPage = curpage+2;
				}
			}
		}
		
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		// 쿠키 가져오기
		Cookie[] cookies = model.getRequest().getCookies();
		List<FeedVO> clist = new ArrayList<FeedVO>();
		if(cookies!=null) {
			if(cookies.length > 6) {
				for (int i = cookies.length-1; i >= cookies.length-6; i--) {
					if(cookies[i].getName().contains("my")) {
						String value = cookies[i].getValue();
						FeedVO ckvo = FeedDAO.feedDetailData(Integer.parseInt(value));
						clist.add(ckvo);
					}
				}
			} else {
				for (int i = cookies.length-1; i >= 0; i--) {
					if(cookies[i].getName().contains("my")) {
						String value = cookies[i].getValue();
						FeedVO ckvo = FeedDAO.feedDetailData(Integer.parseInt(value));
						clist.add(ckvo);
					}
				}
			}
		}
		model.addAttribute("clist", clist);

		// 페이지 이동
		model.addAttribute("main_jsp", "../feed/feed_favList.jsp");
		return "../main/main.jsp";
	}
}



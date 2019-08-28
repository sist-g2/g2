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
		// ����
		HttpSession session = model.getRequest().getSession();
		model.addAttribute("id", (String)session.getAttribute("id"));
		model.addAttribute("memName", (String)session.getAttribute("name"));
		
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
		int totalNum = tvo.getTotalCnt();
		model.addAttribute("totalNum", totalNum);
		
		int totalPage = tvo.getTotalPage();
		int startPage = 0;
		int endPage = 0;
		
		// ������ ���
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
		
		// ��Ű ��������
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

		// ������ �̵�
		model.addAttribute("main_jsp", "../feed/feed_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("feed/feed_detail.do")
	public String feed_detail(Model model) {
		// ����
		HttpSession session = model.getRequest().getSession();
		
		// ����������
		int urlPlag = -1;
		String jsRef = model.getRequest().getParameter("ref");
		System.out.println("js��� : " + jsRef);
		String referer = (String)model.getRequest().getHeader("REFERER");
		referer = referer.substring(referer.indexOf("/", referer.indexOf("feed"))+1);
		if(referer.indexOf("?")!=-1) {
			referer = referer.substring(0, referer.indexOf("?"));
		}
		System.out.println("��� : " + referer);
		if(referer.equals("feed_list.do")) {
			urlPlag = 0;
		} else if (referer.equals("feed_fav_list.do") || referer.equals("feed_detail.do")) {
			urlPlag = 1;
		}
		//System.out.println("�÷��� : " + urlPlag);
		model.addAttribute("urlPlag", urlPlag);
				
		String sno = model.getRequest().getParameter("no");
		int no = Integer.parseInt(sno);
		FeedDAO.feedHitIncrease(no); // ��ȸ�� ������Ʈ
		FeedVO vo = FeedDAO.feedDetailData(no);  // ��ǰ ����
		List<Feed_StoreVO> slist = FeedDAO.feedStoreData(no); // �Ǹ�ó ����
		int lowPrice = FeedDAO.feedLowPrice(no); // ������ ����
		List<Feed_ReviewVO> rlist = FeedDAO.reviewAllData(no); // ���� ����Ʈ
		
		Cookie cookie = new Cookie("my"+sno, sno); // ��Ű �߰�
		model.getResponse().addCookie(cookie);
		
		// ��Ű ��������
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
		
		// �� Ȯ��
		Map favmap = new HashMap();
		String id = (String)session.getAttribute("id");
		int fnum = vo.getNo();
		int favnum = -2; // �α������� �ʾ���
		
		if(id != null) {
			favnum = -1; // �α��������� ������ �ʾ���
			favmap.put("id", id);
			favmap.put("fnum", fnum);
			
			int tmp = FeedDAO.feedFavCheck(favmap);
			if(tmp > 0) {
				favnum = tmp; // �� ��ȣ
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
		
		// ����
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		opList.put("id", id);
		
		// ������
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
		
		// ����
		String sortOp = model.getRequest().getParameter("sort_btn");
		opList.put("sortOp", sortOp);
		
		// ����� ��ǰ ����Ʈ
		List<Feed_FavoriteVO> favList = FeedDAO.favListData(opList);
		model.addAttribute("favList", favList);
		
		// �� ��ǰ ����&�� ������
		int totalNum = FeedDAO.feed_fav_totalNum(id);
		model.addAttribute("totalNum", totalNum);
		
		int totalPage = 0;
		int startPage = 0;
		int endPage = 0;
		
		if(totalNum > 0) {
			totalPage = FeedDAO.feed_fav_totalPage(totalNum);
			
			// ������ ���
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
		
		// ��Ű ��������
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

		// ������ �̵�
		model.addAttribute("main_jsp", "../feed/feed_favList.jsp");
		return "../main/main.jsp";
	}
}



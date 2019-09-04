package com.sist.dao;
import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class FeedDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 검색 옵션 로드
	public static List<Feed_brandVO> brandAllData() {
		List<Feed_brandVO> list = new ArrayList<Feed_brandVO>();
		SqlSession session = ssf.openSession();
		list = session.selectList("brandAllData");
		session.close();
		return list;
	}
	
	public static List<Feed_cateVO> cateAllData() {
		List<Feed_cateVO> list = new ArrayList<Feed_cateVO>();
		SqlSession session = ssf.openSession();
		list = session.selectList("cateAllData");
		session.close();
		return list;
	}
	
	public static List<Feed_grainVO> grainAllData() {
		List<Feed_grainVO> list = new ArrayList<Feed_grainVO>();
		SqlSession session = ssf.openSession();
		list = session.selectList("grainAllData");
		session.close();
		return list;
	}
	
	public static List<Feed_mtrVO> mtrAllData() {
		List<Feed_mtrVO> list = new ArrayList<Feed_mtrVO>();
		SqlSession session = ssf.openSession();
		list = session.selectList("mtrAllData");
		session.close();
		return list;
	}
	
	public static List<Feed_targetVO> targetAllData() {
		List<Feed_targetVO> list = new ArrayList<Feed_targetVO>();
		SqlSession session = ssf.openSession();
		list = session.selectList("targetAllData");
		session.close();
		return list;
	}
	
	// 상품 목록 출력
	public static List<FeedVO> feedAllData(Map map) {
		List<FeedVO> list = new ArrayList<FeedVO>();
		SqlSession session = ssf.openSession();
		list = session.selectList("feedAllData", map);
		session.close();
		return list;
	}
	
	public static Feed_totalVO feedTotal(Map map) {
		SqlSession session = ssf.openSession();
		Feed_totalVO vo = session.selectOne("feedTotalReturn", map);
		session.close();
		return vo;
	}
	
	// 상품 목록 부가 메서드
	public static List<Integer> arrToList(String[] arr) {
		List<Integer> list = new ArrayList<Integer>();
		if (arr==null) {
			list = null;
		} else {
			for(int i = 0; i < arr.length; i++)
				list.add(Integer.parseInt(arr[i]));
		}
		return list;
	}
	
	public static String mtrToMap(String[] arr) {
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
	
	// 상품 상세보기 - 조회수 증가
	public static void feedHitIncrease(int no) {
		SqlSession session = ssf.openSession(true);
		session.update("feedHitIncrease", no);
		session.close();
	}
	
	// 상품 상세보기
	public static FeedVO feedDetailData(int no) {
		SqlSession session = ssf.openSession();
		FeedVO vo = session.selectOne("feedDetailData", no);
		session.close();
		return vo;
	}
	
	// 상품 판매처 정보 가져오기
	public static List<Feed_StoreVO> feedStoreData(int no) {
		SqlSession session = ssf.openSession();
		List<Feed_StoreVO> list = session.selectList("feedStoreData", no);
		session.close();
		return list;
	}
	
	// 상품 최저가 가져오기
	public static int feedLowPrice(int no) {
		SqlSession session = ssf.openSession();
		int lowPrice = session.selectOne("feedLowPrice", no);
		session.close();
		return lowPrice;
	}
	
	// 상품 찜하기
	public static void feedFavInsert(Feed_FavoriteVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("feedFavInsert", vo);
		session.close();
	}
	
	// 찜 여부 체크
	public static int feedFavCheck(Map map) {
		SqlSession session = ssf.openSession();
		int no = -1;
		if(session.selectOne("feedFavCheck", map)==null) {
			session.close();
			return no;
		} else {
			no = session.selectOne("feedFavCheck", map);
			session.close();
			return no;
		}
	}
	
	// 찜 목록 가져오기
	public static List<Feed_FavoriteVO> favListData(Map map) {
		SqlSession session = ssf.openSession();
		List<Feed_FavoriteVO> list = session.selectList("favListData", map);
		session.close();
		return list;
	}
	
	// 찜 갯수 가져오기 
	public static int feed_fav_totalNum(String id) {
		SqlSession session = ssf.openSession();
		int total = 0;
		if(session.selectOne("feed_fav_totalNum", id)==null) {
			session.close();
			return total;
		} else {
			total = session.selectOne("feed_fav_totalNum", id);
			session.close();
			return total;
		}
	}
	
	// 찜 총페이지 가져오기
	public static int feed_fav_totalPage(int totalNum) {
		int totalPage = (int)Math.ceil(totalNum/20.0);
		return totalPage;
	}
	
	// 찜 삭제
	public static void feedFavDelete(int no) {
		SqlSession session = ssf.openSession(true);
		session.delete("feedFavDelete", no);
		session.close();
	}
	
	// 리뷰 전체 가져오기
	public static List<Feed_ReviewVO> reviewAllData(Map map) {
		SqlSession session = ssf.openSession();
		List<Feed_ReviewVO> list = session.selectList("reviewAllData", map);
		session.close();
		return list;
	}
	
	// 리뷰 갯수
	public static int reviewAllCnt(int bno) {
		int total = 0;
		SqlSession session = ssf.openSession();
		total = session.selectOne("reviewAllCnt", bno);
		session.close();
		return total;
	}
	
	// 리뷰 갯수
	public static int reviewAllPage(int bno) {
		int total = 0;
		SqlSession session = ssf.openSession();
		total = session.selectOne("reviewAllPage", bno);
		session.close();
		return total;
	}
	
	// 리뷰 입력하기(insert)
	public static void reviewInsert(Feed_ReviewVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("reviewInsert", vo);
		session.close();
	}
	
	// 리뷰 수정하기(update)
	public static void reviewUpdate(Feed_ReviewVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("reviewUpdate", vo);
		session.close();
	}
	
	// 리뷰 삭제하기(delete)
	public static void reviewDelete(int no) {
		SqlSession session = ssf.openSession(true);
		session.delete("reviewDelete", no);
		session.close();
	}
}
















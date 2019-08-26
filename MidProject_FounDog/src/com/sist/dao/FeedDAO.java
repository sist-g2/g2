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
	
	// 상품 상세보기
	public static void feedHitIncrease(int no) {
		SqlSession session = ssf.openSession(true);
		session.update("feedHitIncrease", no);
		session.close();
	}
	
	public static FeedVO feedDetailData(int no) {
		SqlSession session = ssf.openSession();
		FeedVO vo = session.selectOne("feedDetailData", no);
		session.close();
		return vo;
	}
	
	public static List<Feed_StoreVO> feedStoreData(int no) {
		SqlSession session = ssf.openSession();
		List<Feed_StoreVO> list = session.selectList("feedStoreData", no);
		session.close();
		return list;
	}
	
	public static int feedLowPrice(int no) {
		SqlSession session = ssf.openSession();
		int lowPrice = session.selectOne("feedLowPrice", no);
		session.close();
		return lowPrice;
	}
	
	public static List<Feed_ReviewVO> reviewAllData(int no) {
		SqlSession session = ssf.openSession();
		List<Feed_ReviewVO> list = session.selectList("reviewAllData", no);
		session.close();
		return list;
	}
	
	// 상품 찜하기
	public static void feedFavInsert(Feed_FavoriteVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("feedFavInsert", vo);
		session.close();
	}
}

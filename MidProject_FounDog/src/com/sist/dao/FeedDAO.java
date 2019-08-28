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
	
	// �˻� �ɼ� �ε�
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
	
	// ��ǰ ��� ���
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
	
	// ��ǰ ��� �ΰ� �޼���
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
	
	// ��ǰ �󼼺��� - ��ȸ�� ����
	public static void feedHitIncrease(int no) {
		SqlSession session = ssf.openSession(true);
		session.update("feedHitIncrease", no);
		session.close();
	}
	
	// ��ǰ �󼼺���
	public static FeedVO feedDetailData(int no) {
		SqlSession session = ssf.openSession();
		FeedVO vo = session.selectOne("feedDetailData", no);
		session.close();
		return vo;
	}
	
	// ��ǰ �Ǹ�ó ���� ��������
	public static List<Feed_StoreVO> feedStoreData(int no) {
		SqlSession session = ssf.openSession();
		List<Feed_StoreVO> list = session.selectList("feedStoreData", no);
		session.close();
		return list;
	}
	
	// ��ǰ ������ ��������
	public static int feedLowPrice(int no) {
		SqlSession session = ssf.openSession();
		int lowPrice = session.selectOne("feedLowPrice", no);
		session.close();
		return lowPrice;
	}
	
	// ��ǰ ���ϱ�
	public static void feedFavInsert(Feed_FavoriteVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("feedFavInsert", vo);
		session.close();
	}
	
	// �� ���� üũ
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
	
	// �� ��� ��������
	public static List<Feed_FavoriteVO> favListData(Map map) {
		SqlSession session = ssf.openSession();
		List<Feed_FavoriteVO> list = session.selectList("favListData", map);
		session.close();
		return list;
	}
	
	// �� ���� �������� 
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
	
	// �� �������� ��������
	public static int feed_fav_totalPage(int totalNum) {
		int totalPage = (int)Math.ceil(totalNum/20.0);
		return totalPage;
	}
	
	// �� ����
	public static void feedFavDelete(int no) {
		SqlSession session = ssf.openSession(true);
		session.delete("feedFavDelete", no);
		session.close();
	}
	
	// ���� ��ü ��������
	public static List<Feed_ReviewVO> reviewAllData(int no) {
		SqlSession session = ssf.openSession();
		List<Feed_ReviewVO> list = session.selectList("reviewAllData", no);
		session.close();
		return list;
	}
	
	// ���� �Է��ϱ�(insert)
	public static void reviewInsert(Feed_ReviewVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("reviewInsert", vo);
		session.close();
	}
	
	// ���� �����ϱ�(update)
	public static void reviewUpdate(Feed_ReviewVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("reviewUpdate", vo);
		session.close();
	}
	
	// ���� �����ϱ�(delete)
	public static void reviewDelete(int no) {
		SqlSession session = ssf.openSession(true);
		session.delete("reviewDelete", no);
		session.close();
	}
}
















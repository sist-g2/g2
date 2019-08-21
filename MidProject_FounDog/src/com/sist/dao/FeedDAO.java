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
}

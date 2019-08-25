package com.sist.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.HospitalVO;


public class HospitalDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static List<HospitalVO> hospitalSearch(String loc,String name)
	   {
		   SqlSession session=ssf.openSession();
		   HospitalVO vo = new HospitalVO();
		   vo.setLoc(loc);
		   vo.setName(name);
		   
		   List<HospitalVO> list=session.selectList("hospitalSearch",vo);
		   session.close();
		   return list;
	   }
	
	public static List<String> hospitalGetLoc(){
		List<String> list=new ArrayList<String>();
		SqlSession session=ssf.openSession();
		list = session.selectList("hospitalGetLoc");
		session.close();
		return list;
	}
}

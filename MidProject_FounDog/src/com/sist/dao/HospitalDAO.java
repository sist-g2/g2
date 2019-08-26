package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.HospitalVO;


public class HospitalDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static List<HospitalVO> hospitalSearch(Map map)
	   {
		   SqlSession session=ssf.openSession();
		   HospitalVO vo = new HospitalVO();
		   
		   List<HospitalVO> list=session.selectList("hospitalSearch",map);
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
	
	 public static int hospitalTotalResult(Map map){
		   int total=0;
		   SqlSession session=ssf.openSession();	   					  
		   total=session.selectOne("hospitalTotalResult",map);
		   session.close();
		   return total;
	   }
}

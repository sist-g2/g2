package com.sist.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.SampleVO;


public class SampleDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static List<SampleVO> sampleData(String loc,String name)
	   {
		   SqlSession session=ssf.openSession();
		   SampleVO vo = new SampleVO();
		   vo.setLoc(loc);
		   vo.setName(name);
		   
		   List<SampleVO> list=session.selectList("sampleSearch",vo);
		   session.close();
		   return list;
	   }
	
	public static List<String> sampleGetLoc(){
		List<String> list=new ArrayList<String>();
		SqlSession session=ssf.openSession();
		list = session.selectList("sampleGetLoc");
		session.close();
		return list;
	}
}

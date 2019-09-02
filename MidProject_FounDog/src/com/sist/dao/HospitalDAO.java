package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.DogVO;
import com.sist.vo.HospitalVO;
import com.sist.vo.ReserveVO;


public class HospitalDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static List<HospitalVO> hospitalSearch(Map map)
	   {
		   SqlSession session=ssf.openSession();
		   
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
	 
	 public static String hospitalName(int no){
		   String hosName = "";
		   SqlSession session = ssf.openSession();	   					  
		   hosName = session.selectOne("hospitalName",no);
		   session.close();
		   return hosName;
	   }
	 
	 public static String hospitalReserveDate(int no){
		   String hosDate = "";
		   SqlSession session = ssf.openSession();	   					  
		   hosDate = session.selectOne("hospitalReserveDate",no);
		   session.close();
		   return hosDate;
	   }
	 
	 public static String reserveGetTime(int dno)
	   {
		   String list="";
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectOne("reserveGetTime",dno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	 
	 public static String reserveTime(int timeno)
	   {
		   String list="";
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectOne("reserveTime",timeno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	 
	 public static String memberId(String id){
		   String list= "";
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectOne("memberId",id);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	 }
	 
	 public static List<DogVO> reserveDog(String id){
		   List<DogVO> list=new ArrayList<DogVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("reserveDog",id);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	 }
	 
	 public static void reserveOk(ReserveVO vo){
		   List<ReserveVO> list=new ArrayList<ReserveVO>();
		   SqlSession session = ssf.openSession(true);
			session.insert("reserveOk", vo);
			session.close();
	 }
}

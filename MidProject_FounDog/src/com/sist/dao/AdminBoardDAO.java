package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.AdminBoardVO;

import java.util.*;
public class AdminBoardDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	// 목록 
	public static List<AdminBoardVO> adminboardListData(Map map)
	{
		List<AdminBoardVO> list=new ArrayList<AdminBoardVO>();
		// DB연결
		SqlSession session=ssf.openSession();
		list=session.selectList("adminboardListData",map);
		//                          XML => id , #{} => map => #{start} : map.get("start")
		// 반환 
		session.close();
		return list;
	}
	// 추가 
	public static void adminboardInsert(AdminBoardVO vo)
	{
		SqlSession session=ssf.openSession(true); // setAutoCommit(true)
		// 처리
		session.insert("adminboardInsert",vo);
		session.close();
	}

	// 총페이지 읽기
	public static int adminboardTotalPage()
	{
		int total=0;
		SqlSession session=ssf.openSession();
		total=session.selectOne("adminboardTotalPage");
		// id=> 대소문자 구분 
		session.close();
		return total;
	}
	// 게시쿨 전체 갯수 읽기
	public static int adminboardRowCount()
	{
		int count=0;
		SqlSession session=ssf.openSession();
		count=session.selectOne("adminboardRowCount");
		// id=> 대소문자 구분 
		session.close();
		return count;
	}

	public static AdminBoardVO adminboardDetailData(int no,String type)
	{
		AdminBoardVO vo=new AdminBoardVO();
		SqlSession session=ssf.openSession();
		if(type.equals("detail"))
		{
			session.update("hitIncrement",no);// 조회수 증가
			session.commit();
		}
		vo=session.selectOne("adminboardDetailData", no);
		session.close();
		return vo;
	}

	public static int adminboardUpdate(AdminBoardVO vo)
	{
		int no=0;
		SqlSession session=ssf.openSession();

		// 비밀번호 
		no=vo.getNo();
		session.update("adminboardUpdate",vo);
		session.commit();

		session.close();
		return no;
	}

	public static int adminboardDelete(int no)
	{

		SqlSession session=ssf.openSession();
		session.delete("adminboardDelete",no);
		session.commit();

		session.close();
		return no;
	}
}











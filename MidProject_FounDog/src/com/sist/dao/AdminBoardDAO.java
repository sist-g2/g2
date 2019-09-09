package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.AdminBoardVO;
import com.sist.vo.Board_DogVO;

import java.util.*;
public class AdminBoardDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	// ��� 
	public static List<AdminBoardVO> adminboardListData(Map map)
	{
		List<AdminBoardVO> list=new ArrayList<AdminBoardVO>();
		// DB����
		SqlSession session=ssf.openSession();
		list=session.selectList("adminboardListData",map);
		//                          XML => id , #{} => map => #{start} : map.get("start")
		// ��ȯ 
		session.close();
		return list;
	}
	// �߰� 
	public static void adminboardInsert(AdminBoardVO vo)
	{
		SqlSession session=ssf.openSession(true); // setAutoCommit(true)
		// ó��
		session.insert("adminboardInsert",vo);
		session.close();
	}

	// �������� �б�
	public static int adminboardTotalPage()
	{
		int total=0;
		SqlSession session=ssf.openSession();
		total=session.selectOne("adminboardTotalPage");
		// id=> ��ҹ��� ���� 
		session.close();
		return total;
	}
	// �Խ��� ��ü ���� �б�
	public static int adminboardRowCount()
	{
		int count=0;
		SqlSession session=ssf.openSession();
		count=session.selectOne("adminboardRowCount");
		// id=> ��ҹ��� ���� 
		session.close();
		return count;
	}

	public static AdminBoardVO adminboardDetailData(int no,String type)
	{
		AdminBoardVO vo=new AdminBoardVO();
		SqlSession session=ssf.openSession();
		if(type.equals("detail"))
		{
			session.update("adminhitIncrement",no);// ��ȸ�� ����
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

		// ��й�ȣ 
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
	
	public static List<AdminBoardVO> adminboardFindData(Map map){
		   List<AdminBoardVO> list= new ArrayList<AdminBoardVO>();
		   SqlSession session = ssf.openSession();
		   list=session.selectList("adminboardFindData",map);
		   session.close();
		   return list;
	}
}











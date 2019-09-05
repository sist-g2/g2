package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.Board_DogVO;



public class Board_DogDAO {
	   private static SqlSessionFactory ssf;
	   static
	   {
		   ssf=CreateSqlSessionFactory.getSsf();
	   }
	   
	   // ��� 
	   public static List<Board_DogVO> boarddogListData(Map map)
	   {
		   List<Board_DogVO> list=new ArrayList<Board_DogVO>();
		   // DB����
		   SqlSession session=ssf.openSession();
		   list=session.selectList("boarddogListData",map);
		   //                          XML => id , #{} => map => #{start} : map.get("start")
		   // ��ȯ 
		   session.close();
		   return list;
	   }
	   
	   // �������� �б�
	   public static int boarddogTotalPage(int category)
	   {
		   int total=0;
		   SqlSession session=ssf.openSession();
		   total=session.selectOne("boarddogTotalPage", category);
		   // id=> ��ҹ��� ���� 
		   session.close();
		   return total;
	   }
	   // �Խñ� ��ü ���� �б�
	   public static int boarddogRowCount(int category)
	   {
		   int count=0;
		   SqlSession session=ssf.openSession();
		   count=session.selectOne("boarddogRowCount", category);
		   // id=> ��ҹ��� ���� 
		   session.close();
		   return count;
	   }
	   
	   // �߰� 
	   public static void boarddogInsert(Board_DogVO vo)
	   {
		   SqlSession session=ssf.openSession(true); // setAutoCommit(true)
		   // ó��
		   session.insert("boarddogInsert",vo);
		   session.close();
	   }
	   
	   // �󼼺���
	   public static Board_DogVO boarddogDetailData(int no)
	   {
		   Board_DogVO vo=new Board_DogVO();
		   SqlSession session=ssf.openSession();
			   
		   vo=session.selectOne("boarddogDetailData", no);
		   session.close();
		   return vo;
	   }
	   
	   // �����ϱ�
	   public static void boarddogUpdate(Board_DogVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("boardUpdate",vo);
		   session.close();
	   }

	   // �����ϱ�
	   public static int boarddogDelete(int no){
		   int result=0;
		   SqlSession session=ssf.openSession();
			   session.delete("boarddogDelete",no);
			   session.commit();
			   session.close();
		return result;
	   }
	   
	   // �˻��ϱ�(ã��)
	   // <select id="boardFindData" resultType="Board_DogVO" parameterType="java.util.Map">
	   public static List<Board_DogVO> boarddogFindData(Map map){
		   List<Board_DogVO> list= new ArrayList<Board_DogVO>();
		   SqlSession session = ssf.openSession();
		   list=session.selectList("boarddogFindData",map);
		   session.close();
		   return list;
	   }
	   
}

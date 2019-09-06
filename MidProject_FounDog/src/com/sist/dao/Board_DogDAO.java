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
	   
	   // 목록 
	   public static List<Board_DogVO> boarddogListData(Map map)
	   {
		   List<Board_DogVO> list=new ArrayList<Board_DogVO>();
		   // DB연결
		   SqlSession session=ssf.openSession();
		   list=session.selectList("boarddogListData",map);
		   //                          XML => id , #{} => map => #{start} : map.get("start")
		   // 반환 
		   session.close();
		   return list;
	   }
	   
	   // ???????? ?б?
	   public static int boarddogTotalPage()
	   {
		   int total=0;
		   SqlSession session=ssf.openSession();
		   total=session.selectOne("boarddogTotalPage");
		   // id=> ?????? ???? 
		   session.close();
		   return total;
	   }
	   // ??n? ??u ???? ?б?
	   public static int boarddogRowCount()
	   {
		   int count=0;
		   SqlSession session=ssf.openSession();
		   count=session.selectOne("boarddogRowCount");
		   // id=> ?????? ???? 
		   session.close();
		   return count;
	   }
	   
	   // 추가 
	   public static void boarddogInsert(Board_DogVO vo)
	   {
		   SqlSession session=ssf.openSession(true); // setAutoCommit(true)
		   // 처리
		   session.insert("boarddogInsert",vo);
		   session.close();
	   }
	   
	   // 상세보기
	   public static Board_DogVO boarddogDetailData(int no)
	   {
		   Board_DogVO vo=new Board_DogVO();
		   SqlSession session=ssf.openSession();
			   
		   vo=session.selectOne("boarddogDetailData", no);
		   session.close();
		   return vo;
	   }
	   
	   // 수정하기
	   public static void boarddogUpdate(Board_DogVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("boarddogUpdate",vo);
		   session.close();
	   }

	   // 삭제하기
	   public static int boarddogDelete(int no){
		   int result=0;
		   SqlSession session=ssf.openSession();
			   session.delete("boarddogDelete",no);
			   session.commit();
			   session.close();
		return result;
	   }
	   
	   // 검색하기(찾기)
	   // <select id="boardFindData" resultType="Board_DogVO" parameterType="java.util.Map">
	   public static List<Board_DogVO> boarddogFindData(Map map){
		   List<Board_DogVO> list= new ArrayList<Board_DogVO>();
		   SqlSession session = ssf.openSession();
		   list=session.selectList("boarddogFindData",map);
		   session.close();
		   return list;
	   }
	   
}

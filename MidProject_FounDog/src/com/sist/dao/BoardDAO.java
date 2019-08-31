package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.BoardVO;
import com.sist.vo.Board_ReplyVO;
import java.util.*;

public class BoardDAO {
	   private static SqlSessionFactory ssf;
	   static
	   {
		   ssf=CreateSqlSessionFactory.getSsf();
	   }
	   
	   // 목록 
	   public static List<BoardVO> boardListData(Map map)
	   {
		   List<BoardVO> list=new ArrayList<BoardVO>();
		   // DB연결
		   SqlSession session=ssf.openSession();
		   list=session.selectList("boardListData",map);
		   //                          XML => id , #{} => map => #{start} : map.get("start")
		   // 반환 
		   session.close();
		   return list;
	   }
	   
	   // 총페이지 읽기
	   public static int boardTotalPage(int category)
	   {
		   int total=0;
		   SqlSession session=ssf.openSession();
		   total=session.selectOne("boardTotalPage", category);
		   // id=> 대소문자 구분 
		   session.close();
		   return total;
	   }
	   // 게시글 전체 갯수 읽기
	   public static int boardRowCount(int category)
	   {
		   int count=0;
		   SqlSession session=ssf.openSession();
		   count=session.selectOne("boardRowCount", category);
		   // id=> 대소문자 구분 
		   session.close();
		   return count;
	   }
	   
	   // 추가 
	   public static void boardInsert(BoardVO vo)
	   {
		   SqlSession session=ssf.openSession(true); // setAutoCommit(true)
		   // 처리
		   session.insert("boardInsert",vo);
		   session.close();
	   }
	   
	   // 상세보기
	   public static BoardVO boardDetailData(int no, int type)
	   {
		   BoardVO vo=new BoardVO();
		   SqlSession session=ssf.openSession();
		   
		   if(type==0) {
			   session.update("boardHitIncrement",no);// 조회수 증가
			   session.commit();
		   }
		   
		   vo=session.selectOne("boardDetailData", no);
		   session.close();
		   return vo;
	   }
	   
	   // 수정하기
	   public static void boardUpdate(BoardVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("boardUpdate",vo);
		   session.close();
	   }
	   
	   // 댓글 올리기
	   public static void boardreplyInsert(Board_ReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.insert("boardreplyInsert",vo);
		   session.close();
	   }
	   // 댓글 가지고 오기 
	   public static List<Board_ReplyVO> boardreplyListData(int bno)
	   {
		   SqlSession session=ssf.openSession(true);
		   List<Board_ReplyVO> list=session.selectList("boardreplyListData",bno);
		   session.close();
		   return list;
	   }
	   // 댓글 수
	   public static int boardreplyListCount(int bno)
	   {
		   SqlSession session=ssf.openSession(true);
		   int count=session.selectOne("boardreplyListCount",bno);
		   session.close();
		   return count;
	   }
	   // 대댓글 추가하기
	   public static void boardreplyReInsert(int root,Board_ReplyVO vo)
	   {
		   SqlSession session=ssf.openSession();
		   Board_ReplyVO pvo=session.selectOne("boardreplyParentInfo",root);
		   session.update("boardreplyStepIncrement",pvo);
		   // insert
		   vo.setGroup_id(pvo.getGroup_id());
		   vo.setGroup_step(pvo.getGroup_step()+1);
		   vo.setGroup_tab(pvo.getGroup_tab()+1);
		   vo.setRoot(root);
		   session.insert("boardreplyReInsert",vo);
		   // depth
		   session.update("boardreplyDepthIncrement",root);
		   
		   session.commit();
		   session.close();
	   }
	   
	   //댓글 수정하기
	   public static void boardreplyUpdate(Board_ReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("boardreplyUpdate",vo);
		   session.close();
	   }
	   // 댓글 삭제하기
	   public static void boardreplyDelete(int no){
		   SqlSession session=ssf.openSession();
		   Board_ReplyVO vo = session.selectOne("boardreplyGetDepth",no);
		   if(vo.getDepth()==0){
			   session.delete("boardreplyDelete",no);
		   }else{
			   BoardVO fvo=new BoardVO();
			   fvo.setContent("<font color=red>관리자가 삭제한 게시물입니다</font>");
			   fvo.setNo(no);
			   session.update("boardreplyDataUpdate", fvo);
		   }
		   session.update("boardreplyDepthDecrement",vo.getRoot());
		   session.commit();
		   session.close();
	   }
	   // 삭제하기
	   public static int boardDelete(int no){
		   int result=0;
		   SqlSession session=ssf.openSession();
			   session.delete("boardreplyDelete",no);
			   session.delete("boardDelete",no);
			   session.commit();
			   session.close();
		return result;
	   }

	   // 답글 추가하기
	   public static void rboardreplyReInsert(int root,BoardVO vo)
	   {
		   SqlSession session=ssf.openSession();
		   BoardVO pvo=session.selectOne("rboardreplyParentInfo",root);
		   session.update("rboardreplyStepIncrement",pvo);
		   // insert
		   vo.setGroup_id(pvo.getGroup_id());
		   vo.setGroup_step(pvo.getGroup_step()+1);
		   vo.setGroup_tab(pvo.getGroup_tab()+1);
		   vo.setRoot(root);
		   session.insert("rboardreplyReInsert",vo);
		   // depth
		   session.update("rboardreplyDepthIncrement",root);
		   
		   session.commit();
		   session.close();
	   }
	   
	   //답글 수정하기
	   public static void rboardreplyUpdate(BoardVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("rboardreplyUpdate",vo);
		   session.close();
	   }
	   
	   // 답글 삭제하기
	   public static void rboardreplyDelete(int no){
		   SqlSession session=ssf.openSession();
		   BoardVO vo = session.selectOne("rboardreplyGetDepth",no);
		   if(vo.getDepth()==0){
			   session.delete("rboardreplyDelete",no);
		   }else{
			   BoardVO fvo=new BoardVO();
			   fvo.setContent("<font color=red>관리자가 삭제한 게시물입니다</font>");
			   fvo.setNo(no);
			   session.update("rboardreplyDataUpdate", fvo);
		   }
		   session.update("rboardreplyDepthDecrement",vo.getRoot());
		   session.commit();
		   session.close();
	   }
	   
}











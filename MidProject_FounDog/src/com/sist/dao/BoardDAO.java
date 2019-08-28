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
	   
	   // ��� 
	   public static List<BoardVO> boardListData(Map map)
	   {
		   List<BoardVO> list=new ArrayList<BoardVO>();
		   // DB����
		   SqlSession session=ssf.openSession();
		   list=session.selectList("boardListData",map);
		   //                          XML => id , #{} => map => #{start} : map.get("start")
		   // ��ȯ 
		   session.close();
		   return list;
	   }
	   
	   // �������� �б�
	   public static int boardTotalPage(int category)
	   {
		   int total=0;
		   SqlSession session=ssf.openSession();
		   total=session.selectOne("boardTotalPage", category);
		   // id=> ��ҹ��� ���� 
		   session.close();
		   return total;
	   }
	   // �Խ��� ��ü ���� �б�
	   public static int boardRowCount(int category)
	   {
		   int count=0;
		   SqlSession session=ssf.openSession();
		   count=session.selectOne("boardRowCount", category);
		   // id=> ��ҹ��� ���� 
		   session.close();
		   return count;
	   }
	   
	   // �߰� 
	   public static void boardInsert(BoardVO vo)
	   {
		   SqlSession session=ssf.openSession(true); // setAutoCommit(true)
		   // ó��
		   session.insert("boardInsert",vo);
		   session.close();
	   }
	   
	   // �󼼺���
	   public static BoardVO boardDetailData(int no, int type)
	   {
		   BoardVO vo=new BoardVO();
		   SqlSession session=ssf.openSession();
		   
		   if(type==0) {
			   session.update("boardHitIncrement",no);// ��ȸ�� ����
			   session.commit();
		   }
		   
		   vo=session.selectOne("boardDetailData", no);
		   session.close();
		   return vo;
	   }
	   
	   // �����ϱ�
	   public static void boardUpdate(BoardVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("boardUpdate",vo);
		   session.close();
	   }
	   
	   // ��� �ø���
	   public static void replyInsert(Board_ReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.insert("replyInsert",vo);
		   session.close();
	   }
	   // ��� ������ ���� 
	   public static List<BoardVO> replyListData(int bno)
	   {
		   SqlSession session=ssf.openSession(true);
		   List<BoardVO> list=session.selectList("replyListData",bno);
		   session.close();
		   return list;
	   }
	   
	   public static int replyListCount(int bno)
	   {
		   SqlSession session=ssf.openSession(true);
		   int count=session.selectOne("replyListCount",bno);
		   session.close();
		   return count;
	   }
	   
	   public static void replyReInsert(int root,Board_ReplyVO vo,BoardVO rvo)
	   {
		   SqlSession session=ssf.openSession();
		   BoardVO pvo=session.selectOne("replyParentInfo",root);
		   session.update("replyStepIncrement",pvo);
		   // insert
		   rvo.setGroup_id(pvo.getGroup_id());
		   rvo.setGroup_step(pvo.getGroup_step()+1);
		   rvo.setGroup_tab(pvo.getGroup_tab()+1);
		   rvo.setRoot(root);
		   session.insert("replyReInsert",vo);
		   // depth
		   session.update("replyDepthIncrement",root);
		   
		   session.commit();
		   session.close();
	   }
	   
	   public static void replyUpdate(Board_ReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("replyUpdate",vo);
		   session.close();
	   }
	   public static void replyDelete(int no){
		   SqlSession session=ssf.openSession();
		   BoardVO vo = session.selectOne("replyGetDepth",no);
		   if(vo.getDepth()==0){
			   session.delete("replyDelete",no);
		   }else{
			   BoardVO fvo=new BoardVO();
			   fvo.setContent("<font color=red>�����ڰ� ������ �Խù��Դϴ�</font>");
			   fvo.setNo(no);
			   session.update("replyDataUpdate", fvo);
		   }
		   session.update("replyDepthDecrement",vo.getRoot());
		   session.commit();
		   session.close();
	   }
	   public static int freeboardDelete(int no,String pwd){
		   int result=0;
		   SqlSession session=ssf.openSession();
			   session.delete("boardReplyDelete",no);
			   session.delete("boardDelete",no);
			   session.commit();
			   session.close();
		return result;
	   }
}











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
	   // �Խñ� ��ü ���� �б�
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
	   public static void boardreplyInsert(Board_ReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.insert("boardreplyInsert",vo);
		   session.close();
	   }
	   // ��� ������ ���� 
	   public static List<Board_ReplyVO> boardreplyListData(int bno)
	   {
		   SqlSession session=ssf.openSession(true);
		   List<Board_ReplyVO> list=session.selectList("boardreplyListData",bno);
		   session.close();
		   return list;
	   }
	   // ��� ��
	   public static int boardreplyListCount(int bno)
	   {
		   SqlSession session=ssf.openSession(true);
		   int count=session.selectOne("boardreplyListCount",bno);
		   session.close();
		   return count;
	   }
	   // ���� �߰��ϱ�
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
	   
	   //��� �����ϱ�
	   public static void boardreplyUpdate(Board_ReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("boardreplyUpdate",vo);
		   session.close();
	   }
	   // ��� �����ϱ�
	   public static void boardreplyDelete(int no){
		   SqlSession session=ssf.openSession();
		   Board_ReplyVO vo = session.selectOne("boardreplyGetDepth",no);
		   if(vo.getDepth()==0){
			   session.delete("boardreplyDelete",no);
		   }else{
			   session.update("boardreplyDataUpdate", no);
		   }
		   // session.update("boardreplyDepthDecrement",vo.getRoot());
		   session.commit();
		   session.close();
	   }
	   // �����ϱ�
	   public static int boardDelete(int no){
		   int result=0;
		   SqlSession session=ssf.openSession();
			   session.delete("boardreplyDelete",no);
			   session.delete("boardDelete",no);
			   session.commit();
			   session.close();
		return result;
	   }

	   // ��� �߰��ϱ�
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
	   
	   //��� �����ϱ�
	   public static void rboardreplyUpdate(BoardVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("rboardreplyUpdate",vo);
		   session.close();
	   }
	   
	   // �� �����ϱ�
	   public static void rboardreplyDelete(int no){
		   SqlSession session=ssf.openSession();
		   BoardVO vo = session.selectOne("rboardreplyGetDepth",no);
		   if(vo.getDepth()==0){
			   session.delete("reboardreplyDelete",no); // ��ۻ���
			   session.delete("rboardreplyDelete",no); // �� ����
		   }else{
			   /*BoardVO fvo=new BoardVO();
			   fvo.setDelState(1);
			   fvo.setSubject("<font color=red>������ �Խù��Դϴ�</font>");
			   fvo.setContent("<font color=red>������ �Խù��Դϴ�</font>");
			   fvo.setNo(no);*/
			   session.update("rboardreplyDataUpdate", no);
		   }
		   // session.update("rboardreplyDepthDecrement",vo.getRoot());
		   session.commit();
		   session.close();
	   }
	   
	   // �˻��ϱ�(ã��)
	   // <select id="boardFindData" resultType="BoardVO" parameterType="java.util.Map">
	   public static List<BoardVO> boardFindData(Map map){
		   List<BoardVO> list= new ArrayList<BoardVO>();
		   SqlSession session = ssf.openSession();
		   list=session.selectList("boardFindData",map);
		   session.close();
		   return list;
	   }
	   
}
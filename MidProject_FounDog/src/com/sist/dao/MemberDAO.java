package com.sist.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.DogVO;
import com.sist.vo.Feed_brandVO;
import com.sist.vo.MemberVO;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static MemberVO memberLogin(String id, String pwd){
		MemberVO vo = new MemberVO();
		String result = "";
		SqlSession session = ssf.openSession();
		//ID
		int count = session.selectOne("memberIdCount", id);
		if(count==0){
			result="NOID"; //아이디가 없는 상태
			vo.setName(result);
		} else {
			vo = session.selectOne("memberGetPwd", id);
			if(vo.getPwd().equals(pwd)){
				vo.setName(vo.getName()); //로그인 되는 상태
				System.out.println(vo.getName());
			} else {
				result="NOPWD"; //비밀번호가 틀린 상태
				vo.setName(result);
			}
		}
		session.close();
		return vo;
	}
	
	public static int member_jungbok(String id){
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberIdCount", id);
		session.close();
		return count;
	}
	
	public static void memberJoin(MemberVO vo){
		SqlSession session = ssf.openSession(true);
		session.insert("memberJoin", vo);
		session.close();
	}
	
	public static MemberVO memberDetailData(String id){
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
		vo = session.selectOne("memberAllData", id);
		session.close();
		return vo;
	}
	
	public static void dogJoin(DogVO dvo){
		SqlSession session = ssf.openSession(true);
		session.insert("dogJoin", dvo);
		session.close();
	}
	
	public static int memberDelete(String id, String pwd){
		int result = 0;
		SqlSession session = ssf.openSession();
		String db_pwd = session.selectOne("deleteGetPwd", id);
		//System.out.println(db_pwd);
		if(db_pwd.equals(pwd)){
			result = 1;
			session.delete("memDeleteVacc", id);
			session.delete("memDeleteCare", id);
			session.delete("memDeleteReserve", id);
			session.delete("memDeleteDog", id);
			session.delete("memDeleteJjim", id);
			session.update("memDeleteReview", id);
			session.update("memDeleteReply", id);
			session.update("memDeleteBoardDog", id);
			session.update("memDeleteBoard", id);
			session.delete("memberDelete", id);
			session.commit();
		}
		//System.out.println(result);
		session.close();
		return result;
	}
	
	public static List<DogVO> dogDetailData(String id){
		List<DogVO> list = new ArrayList<DogVO>();
		SqlSession session = ssf.openSession();
		list = session.selectList("DogDetailData", id);
		session.close();
		return list;
	}
	
	public static DogVO dogUpDetailData(int dno){
		DogVO dvo = new DogVO();
		SqlSession session = ssf.openSession();
		dvo = session.selectOne("DogUpDetailData", dno);
		session.close();
		return dvo;
	}
	
	public static void dogDelete(int dno){
		SqlSession session = ssf.openSession();
		session.delete("dogDelete", dno);
		session.commit();
		session.close();
		
	}
	
	public static void memberUpdate(MemberVO vo){
		SqlSession session = ssf.openSession();
		session.update("memberUpdate", vo);
		session.commit();
		session.close();
	}
	
	public static void dogUpdate(DogVO dvo){
		SqlSession session = ssf.openSession();
		session.update("dogUpdate", dvo);
		session.commit();
		session.close();
	}
	
	public static int memberUpdatePwd(String id, String pwd){
		int result = 0;
		SqlSession session = ssf.openSession();
		String db_pwd = session.selectOne("deleteGetPwd", id);
		if(db_pwd.equals(pwd)){
			result = 1;
		}
		session.close();
		return result;
	}
	
	public static String memberUpdateNullPwd(String id){
		SqlSession session = ssf.openSession();
		String pwd = session.selectOne("deleteGetPwd", id);
		session.close();
		return pwd;
	}
	
}

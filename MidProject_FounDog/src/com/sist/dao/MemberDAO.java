package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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
}

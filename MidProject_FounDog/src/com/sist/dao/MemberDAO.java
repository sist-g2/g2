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
			result="NOID"; //���̵� ���� ����
			vo.setName(result);
		} else {
			vo = session.selectOne("memberGetPwd", id);
			if(vo.getPwd().equals(pwd)){
				vo.setName(vo.getName()); //�α��� �Ǵ� ����
				System.out.println(vo.getName());
			} else {
				result="NOPWD"; //��й�ȣ�� Ʋ�� ����
				vo.setName(result);
			}
		}
		session.close();
		return vo;
	}
	
	public static void memberJoin(MemberVO vo){
		SqlSession session = ssf.openSession(true);
		session.insert("memberJoin", vo);
		session.close();
	}
}
